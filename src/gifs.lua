-- Guard13007 Industries File System (gifs.lua)
-- Copyright (c) 2016 Paul Liverman, released under MIT license
-- https://github.com/Guard13007/GIFS

local rawfs = fs  -- get our own copy of the fs API
local fstree = {} -- loaded GIFS file system tree
local disks = {}  -- loaded physical disk info

-- attempts to get data from a fs.gifs file on the specified disk
local function getfs(disk)
    local path = "/" .. disk .. "/fs.gifs"

    if rawfs.exists(path) and (not rawfs.isDir(path)) then
        local file = rawfs.open(path, "r")
        local data = textutils.unserialize(file.readAll())

        file.close()

        return data
    end
end

-- loads a file system tree into the main tree
local function loadtree(parent, node, uuid)
    for k, v in pairs(node) do
        if type(v) == "table" then
            parent[k] = v
            loadtree(parent[k], v, uuid)
        else
            parent[k] = uuid
        end
    end
end

-- loads a file system
local function loadfs(fsData)
    fsData.free = rawfs.getFreeSpace(fsData.mount) - 1024

    loadtree(fstree, fsData.tree)

    table.insert(disks, fsData)
end

-- checks for disks being added or removed, updates loaded data
local function checkdisks()
    local disklist = rawfs.list("/")

    local mountList = {}
    local unmountList = {}

    for _, disk in ipairs(disklist) do
        local fsData = getfs(disk)

        if fsData then
            local loaded = false

            for _, loadedDisk in ipairs(disks) do
                if (fsData.uuid == loadedDisk.uuid) and (fsData.mount == loadedDisk.mount) then
                    loaded = true
                    break
                elseif (fsData.uuid == loadedDisk.uuid) then
                    local data = getfs(loadedDisk.mount)
                    if fsData.uuid == data.uuid then
                        error(disk .. " has the same UUID as " .. loadedDisk.mount .. "\nPlease correct the error and reload GIFS.")
                    end
                elseif (fsData.mount == loadedDisk.mount) then
                    table.insert(unmountList, loadedDisk)
                end
            end

            if not loaded then
                table.insert(mountList, fsData)
            end
        end
    end

    for _, fsData in ipairs(unmountList) do
        for i, _ in ipairs() --TODO continue here
    end

    for _, fsData in ipairs(mountList) do
        loadfs(fsData)
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
