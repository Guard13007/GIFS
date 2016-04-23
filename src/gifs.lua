-- Guard13007 Industries File System (gifs.lua)
-- Copyright (c) 2016 Paul Liverman, released under MIT license
-- TODO URL TO REPO

local rawfs = fs  -- get our own copy of the fs API
local fstree = {} -- loaded GIFS file system tree
local disks = {}  -- loaded physical disk info

-- disks are numerically indexed, have a mountname and uuid

-- checks for disks being added or removed, updates loaded data
local function checkdisks()
    local disklist = rawfs.list("/")
    for _, disk in ipairs(disklist) do
        for _, loadedDisk in ipairs(disks) do
            --if disk == loadedDisk.mountname then
            --    --
            --end
        end
    end
end

-- returns reference to node in fstree represented by path
local function getNode(path)
    --
end

-- returns alphabetically ordered numerically indexed list of contents of a path
-- or an empty table
function list(path)
    checkdisks()
    local node = getNode(path)
end
