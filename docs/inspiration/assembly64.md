# Jak mit vlastni Assembly64 server

https://www.facebook.com/groups/1249159557042604/permalink/1266611468630746/

To use it, put static IP on your C64U and for DNS address use 157.180.85.223 which is my server. That will spoof assembly64 address to point to my server and my server then alters request headers so you get REAL assembly64 files and not commoserve. To revert back, put your own DNS address instead.
Did some digging and captured network traffic from C64U to 'CommoServe'. Looks like it's hosted by Assembly64 and they make the difference what to server depending what client machine puts into Client-Id: in headers. With C64U it's Commodore and from Ultimate64 sources I can find that there it is: Ultimate.
Source, if you want to roll your own. You don't trust me, or assembly has blocked my servers address: https://pastebin.com/Xu3pdfWE
And this really was just 10 minute wiresharking and then asked Gemini to make me a mitmproxy script.
IP where C64U connects:
jalanara@lucifer:~$ host 185.187.254.229
Host 229.254.187.185.in-addr.arpa. not found: 3(NXDOMAIN)
jalanara@lucifer:~$ host ^C
jalanara@lucifer:~$ host hackerswithstyle.se
[hackerswithstyle.se](https://l.facebook.com/l.php?u=http%3A%2F%2Fhackerswithstyle.se%2F%3Ffbclid%3DIwZXh0bgNhZW0CMTAAYnJpZBExMHRNdkhBTlJCbDU4d0pKMHNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR4TAyUQwbHoqku8T2mNFGf9r8lGP9VYtw0ePQleEhN1scrxxIQmW_AldxLcIQ_aem_459--thtEj4O0pm0tp41vA&h=AT2B_dvo8sxmKq8NZWsv95Nz0zyPWFsShLD4CYTTjzTLptqFqwW2uyP6Agud5g_-AKHIW0lQtF17HstTGtpFO8yYJ3RBme9RDBFPUbWWxJrMdCKmW9V3Gt3H9B3_Nf50URxC_GVj1orKyvnBADSetg&__tn__=-UK-R&c[0]=AT3UfkG5L02lUEdFY3rKYOW9JttApgW7ixdlL3hcrtsP08KQtSJw3-XcBUfENEonXHpMSc2RkvLFtn5sdM16JB_a5XdEoLA2bYS4OJvBpGTc38HMgIgh9xoU2f5LP96IcfE1vRcMg_QDYjmlOJhcX-VeczvSw13158oSklSNapn_Fv0pLmnt9rz4NTOMxPWc_XpiYcETdGEiyUzRdB3qw5L1qgzVFnM) has address 185.187.254.229
So one way to access assembly64  would be to craft a proxy, which alters Client-Id: Or we could use DNS spoofing in home network and point [hackerswithstyle.se](https://l.facebook.com/l.php?u=http%3A%2F%2Fhackerswithstyle.se%2F%3Ffbclid%3DIwZXh0bgNhZW0CMTAAYnJpZBExMHRNdkhBTlJCbDU4d0pKMHNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR6CMd-TZR-nwnw9HqYdn6ddwM662K_IMGXO5DQkggHafYn-Ihxe1xqJt9L4Lw_aem_6fzjhLCd8iz5JsEbp0grkA&h=AT2B_dvo8sxmKq8NZWsv95Nz0zyPWFsShLD4CYTTjzTLptqFqwW2uyP6Agud5g_-AKHIW0lQtF17HstTGtpFO8yYJ3RBme9RDBFPUbWWxJrMdCKmW9V3Gt3H9B3_Nf50URxC_GVj1orKyvnBADSetg&__tn__=-UK-R&c[0]=AT3UfkG5L02lUEdFY3rKYOW9JttApgW7ixdlL3hcrtsP08KQtSJw3-XcBUfENEonXHpMSc2RkvLFtn5sdM16JB_a5XdEoLA2bYS4OJvBpGTc38HMgIgh9xoU2f5LP96IcfE1vRcMg_QDYjmlOJhcX-VeczvSw13158oSklSNapn_Fv0pLmnt9rz4NTOMxPWc_XpiYcETdGEiyUzRdB3qw5L1qgzVFnM) name to some other IP which then would make the change on the fly.
On  Linux I guess mitmproxy would do the trick and rewrite the headers. Then just redirect all http traffic to your linux machine from the C64U.
But not sure if I'm interested more to make this, as I already have whole Assembly64 on a sdcard.




```
 To access original assembly64 from C64U
# save this to assembly64.py
# to run it mitmdump -p 80 -s assembly64.py --mode reverse:http://185.187.254.229:80 --set block_global=false
# http-address above is hackerswithstyle.se IP
# ip address below, put there your mitmproxy servers IP
# And then you need your DNS to return your servers IP address when C64U queries for hackerswithstyle.se

from mitmproxy import http

def request(flow: http.HTTPFlow) -> None:
    # Ensure we only touch the specific service traffic
    if flow.request.pretty_host == "hackerswithstyle.se" or flow.request.host == "185.187.254.229":
        
        # Log the original headers for debugging
        print(f"Intercepted Request from: {flow.client_conn.peername[0]}")
        
        # Modify the Machine ID
        if flow.request.headers.get("Client-Id") == "Commodore":
            flow.request.headers["Client-Id"] = "Ultimate"
            print(">>> MODIFIED: Client-Id set to Ultimate")

        # Force the Host header so the remote server doesn't reject the NAT'd request
        flow.request.host = "hackerswithstyle.se"
        flow.request.port = 80
```