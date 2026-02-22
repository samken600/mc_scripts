local url = "https://raw.githubusercontent.com/samken600/mc_scripts/refs/heads/main/cc/bees.lua"
local filename = "/startup.lua"

local wget_file = "/rom/programs/http/wget.lua"

if fs.exists(filename) then
    fs.delete(filename)
end

local wget_command = wget_file .. " " .. url .. " " .. filename
shell.run(wget_command)