-- Guard13007 Industries File System

local function getPath(path)
    local result = tree

    path = path:gsub("\\", "/")
    local current = 1
    local next = path:find("/", current)
    if current == next then
        current = 2
    end

    if not next then
        return nil --NOTE not sure if good idea
    end

    while next do
        result = result[path:sub(current, next - 1)]
        current = next + 1
        next = path:find("/", current)
    end

    return result
end

function list(path)
    local result = getPath(path)
    if type(result) == "table" then
        --TODO process
        -- (we can't return it raw, we need to simply get what's in it)
    end
end

--[[
fs.list(string path)	table files	Returns a list of all the files (including subdirectories but not their contents) contained in a directory, as a numerically indexed table.
fs.exists(string path)	boolean exists	Checks if a path refers to an existing file or directory.
fs.isDir(string path)	boolean isDirectory	Checks if a path refers to an existing directory.
fs.isReadOnly(string path)	boolean readonly	Checks if a path is read-only (i.e. cannot be modified).
fs.getName(string path)	string name	Gets the final component of a pathname.
fs.getDrive(string path)	string/nil drive	Gets the storage medium holding a path, or nil if the path does not exist.
fs.getSize(string path)	number size	Gets the size of a file in bytes.
fs.getFreeSpace(string path)	number space	Gets the remaining space on the drive containing the given directory.
fs.makeDir(string path)	nil	Makes a directory.
fs.move(string fromPath, string toPath)	nil	Moves a file or directory to a new location.
fs.copy(string fromPath, string toPath)	nil	Copies a file or directory to a new location.
fs.delete(string path)	nil	Deletes a file or directory.
fs.combine(string basePath, string localPath)	string path	Combines two path components, returning a path consisting of the local path nested inside the base path.
fs.open(string path, string mode)	table handle	Opens a file so it can be read or written.
fs.find(string wildcard)	table files	Searches the computer's files using wildcards. Requires version 1.6 or later.
fs.getDir(string path)	string parentDirectory	Returns the parent directory of path. Requires version 1.63 or later.
fs.complete(string partial name, string path [, boolean include files] [, boolean include slashes])	table matches	Returns a list of strings that could be combined with the provided name to produce valid entries in the specified folder. Requires version 1.74 or later.
]]
