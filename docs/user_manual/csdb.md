# CSDB - C64 Scene Database

Commodore Scene Database (CSDB) is an online repository for Commodore 64 demos, games, and other scene-related content. You can browse [csdb.dk](https://www.csdb.dk/) and retrieve demos and games from there down to your C64U and run it there.

Requirement: C64 Ultimate or 1541 Ultimate cartridge with networking capabilities.

To activate CSDB commands, first switch to virtual device C by typing: `#c`. It is also possible to prefix all commands with `c:` to avoid switching devices.

## Example Session

This example shows how to search for a Hondani demo, download it and run it. Here is sequence of commands. See also the screenshots below.

```
#c
find hondani
cd rel/248345
cp *.zip
#f
cd /temp
dir
mnt meetro-side-a.d64
#8
dir
l *
run
```

> Note that even though this demo comes with two D64 images zipped into one zip file, the zip will get automatically extracted during the `cp` command.

> Note that when mounting D64 image, it will mount to device 8. If you already have a disk mounted on this device, you need to unmount it first with `umnt` command.

> Note that most of directory listings on floppy disks are optimized for upper case font and may not render as nice. You can use C= + SHIFT to switch between fonts.

> Note that this particular demo starts with a Python exception. That is an on-purpose joke, not an error. Just start typing something and have fun.

![session1](../assets/csdb-session1.png)

![session2](../assets/csdb-session2.png)

## Navigating CSDB

The CSDB offer a lot of information about releases, groups, sceners, forums news, and more.

Here are support object types and its aliases:
- `release` (alias `rel`) - A demo, game, or other production released by a group or individual.
- `group` (alias `grp`) - A team or organization that creates releases.
- `scener` (alias `scn`) - An individual person involved

You can do `cd release` or `cd rel` which is a shorter equivalent.

You can imaging the CSDB database as a directory structure in a virtual #c device. The structure goes like this:

`/release/<release_id>` - Release details and files
`/group/<group_id>` - Group details and members
`/scener/<scener_id>` - Scener details and associated releases

You can also see this if you type `dir` while being in the root directory (`cd /`)

For example `/group/901` will show you details about the group with ID 901. Guess who is that. 🙂

`cd ..` and `cd /` commands work as expected to navigate up and to the root of the virtual device.

When changing directory to a particular release, group or scener, it is necessary to use the numeric ID of the item as you can see it in search results. The reason is that there are often multiple items with the same name and the only way to disambiguate them is by using the ID.

### Search

You can search releases, groups and sceners.

```
find hondani
```

If you do this without switching to a specific directory, it will search across all types and display results across all types. You can also switch to a specific directory first and then do the search which will limit the search to that type. For example:

```
cd release
find hondani
```
This will search only releases for the string "hondani". You can also do `cd group` and then `find hondani` to search for groups.


## Download a Release

When you are in a release detail directory context, you can use `cp` command to copy files from that release to the temporary storage on the Ultimate. For example:

```
cp *.zip
```

> Note the deault target directory for copied files is `/temp` on the Ultimate storage.


## Show Latest Releases

You can also show latest releases by doing `cd release` and then `ls` or `dir`. This will list most recent 10 releases sorted by release date.

![latest releases](../assets/csdb-latest.png)
