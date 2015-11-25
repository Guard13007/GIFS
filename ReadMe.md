# GIFS

Guard13007 Industries File System. A virtual file system for ComputerCraft that
emulates the Fs API, but allows using multiple disks as if they were one large
disk.

### Notes

Every disk has a file called `fs.gifs` and several numbered files.

`fs.gifs` contains data about the file system.
Numbered files are the actual files. The file system data links these to their
virtual locations.
