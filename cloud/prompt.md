# Common Instructions

Always review existing code and documentation before making changes.
Ensure that any new code adheres to existing coding standards and practices.
Do not create redundant code; reuse existing functions and classes where applicable. You can refactor existing code if necessary to improve maintainability.
Extend existing documentation to cover new features or changes.
Extend unit tests to cover new functionality and ensure all tests pass before finalizing changes.

# C64 HDN Cloud Server Application

Create python application that receives TCP data as commands from the C64 and responds back with data.
This application is supposed to run local PC or in serverless cloud.
C64 client requires C64 Ultimate with network target.
Create cloud.py that implements the server.

## Communication Protocol Client->Server

- 2 bytes: Magic $FE $FF | This indicates start of a command packet and distinguishes from other traffic
- 1 byte: Command ID | Identifies the command being sent
- n bytes: Command Data | Data specific to the command being sent

### Command IDs
- $01: C64 sending an immediate keypress, to be dispatched appropriately
- $02: C64 sending a string of PETSCII text input, terminated by $00

### Data Formats for particular Commands
- Command $01 (Immediate Keypress):
  - 1 byte: PETSCII code of the key pressed
  - 1 byte: Modifier flags (bit 0: Shift, bit 1: Ctrl, bit 2: Commodore key)
- Command $02 (Text Input String):
  - n bytes: PETSCII text string, ending with null character ($00)

## Communication Protocol Server->Client
- 2 bytes: Magic $FE $FF | This indicates start of a response packet
- 1 byte: Response Type | Following types are supported:
    - $01 PETSCII null terminated, 
    - $02 mix commands and screen codes, 
    - $03 mText format (see docs/mtext.md)
- n bytes: Response Data | Data specific to the response type

## PETSCII Conversion Rules

- Use PETSCII like native encoding inside the server. That means do not convert incoming PETSCII to ASCII/UTF-8 and vice versa.
- When the server needs to communicate to downstream services (like web APIs) that expect UTF-8, convert PETSCII to UTF-8 right before calling such API.
- For this conversion, use the petscii-ascii.md file containing mapping rules.
- Use PETSCII in responses back to C64 for all Response Types except $02 (mix commands and screen codes) where screen codes will be used.

When receiving UTF-8 data from downstream services, convert back to PETSCII using the inverse of the above rules.
Screen codes will be generated directly using binary literals in the code. No conversion needed.

### Reasons for conversion approach
- petscii > utf-8
  - for communicating with web APIs - must preserve the same meaning
  - so I can view/edit it in the cloud - must keep the same visual appearance
- utf-8 > petscii
  - for sending back to the C64


## PyTest

Create unit tests for cloud.py using pytest framework.
Write these tests before application development and work fixing all bugs until all tests pass.

## Test application for PC

Because the TCP traffic exchanged between C64 and the server is binary protocol, it is recommended to use a simple test application to verify the communication. Write a testing app that simulates the C64, able to send commands and receive responses.
Create test_client.py that implements this functionality.
The application will expect a user input

# Other Considerations


---

# Request Dispatcher

Create a dispatch object that will work for text inputs ($02: C64 sending a string of PETSCII text input). The dispatcher will identify type of request and route to the appropriate handler class. At the moment there will be only the following types:

| How to identify | Description | Handler Class |
|-----------------|-------------|---------------|
| starts by "I:"  | General chat requests to LLM Agent | ChatHandler |
| starts by "help" | Help requests | HelpHandler |
| starts by "?"   | Evaluate python expression | PythonEvalHandler |
| starts by "c:"  | requests to csdb.dk database | CSDBHandler |

Create python files for the classes above and implement basic functionality that can be extended later.

## ChatHandler

Use context7 langchain_oss_python_langchain to create a ChatHandler class that will process chat requests to an LLM agent.
The class will accept PETSCII text input, convert to UTF-8, send to the LLM, get the response, convert back to PETSCII and return.
Create following LLM tools:
- Web search tool using SerpAPI (use GOOGLE_CSE_ID env var for CSE ID)
Prepare string for system prompt.
Use MCP server like this:
```json
"mcp": {
  "servers": {
    "context7": {
      "type": "http",
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "CONTEXT7_API_KEY": "<CONTEXT7_API_KEY>"
      }
    }
  }
}
```
The CONTEXT7_API_KEY is expected to be set in environment variables.

## HelpHandler
Create a HelpHandler class that will respond to help requests with a static PETSCII text response describing available commands.
If the "help" request contains additional text, use that as a search query to find relevant help topics from a predefined set. Use LLM agent with the Context7 MCP server to find the most relevant help topic and return that. Have a string for help system prompt.

## PythonEvalHandler
Create a PythonEvalHandler class that will evaluate python expressions sent from the C64. The class will accept PETSCII text input, convert to UTF-8, evaluate the expression using eval(), convert the result back to PETSCII and return.
For security reasons, restrict the available built-in functions and variables that can be accessed during evaluation.

## CSDBHandler
Create a CSDBHandler class that will process requests to csdb.dk database. The class will accept PETSCII text input, convert to UTF-8, send a request to csdb.dk API, get the response, convert back to PETSCII and return.
Use the requests library to make HTTP requests to the csdb.dk API.
### Web API documentation
```
The CSDb webservice allows you to fetch most of the information within the CSDb database. This can either be used for private use, or to make some of the information in CSDb available on other websites.

The webservice returns the information in XML-format. So far the webservice is only in it's very early stage, so no real documentation for the format of the XML is present. Also there might be missing some information you might think should be there, or some information might not be presented in the best way. If you have any sugestions you are welcome to contact the CSDb admin. (Check the help-section of CSDb for contact-info).

So far you can extract the basic information within CSDb. This is information on the Releases, Groups, Sceners (handles) and Events plus all their relations. (Note that some of the information might not be there yet due to the early stage of development)


How to use the webservice:
So far you can only request info on one of the four basic entry-types by their internal ID in CSDb. The ID can be seen in the URL when browsing CSDb.
The way to call the webservice is:
https://csdb.dk/webservice/?type=<type>&id=<id>&depth=<d>

<type> is the entry-type you want info for. The possibilities are: "release", "group", "scener", "event", "bbs" and "sid".
<id> is the internal ID of the entry you want info for.
<d> is the depth you want info for. Default is 2, which will return more or less the same info which is displayed on the normal info-page for the particular entry.

The depth-value tells the webservice how deep it should makes it's recursive calls when finding information. F.x. if you want information on a group, the call to get the information on the group is considered the first recursive call. You can also get information on which releases this group have relased, which is the second recursive call. The third recursive call would be something like credits for each of the releases released by this group, etc.
Because CSDb is so heavily cross-referenced, a call of depth 5 or 6 to almost any entry, will result in a VERY large output. Because of this the maximum depth alowed is 4.

You can also get information from the forum. The syntax for this is a bit different. First of all you need to set the type to "forum". This will return an XML with all the rooms in the forum. If you add the parameter roomid=<roomid> you will get all the topics in the specific room. Finally you can add the parameter topicid=<topicid> and get all the posts in the given topic.
```
