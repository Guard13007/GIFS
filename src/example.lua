-- example fs.gifs file
{
    tree = {
        home = {
            emptyDir = {},
            God = {
                file1 = 1,
                file2 = 4
            }
        }
    },
    next = 5,
    reserved = 300
}
-- tree is the filesystem (which numbered files are which files)
-- next is the next ID to use for files
-- reserved is the number of bytes reserved for the fs.gifs file
