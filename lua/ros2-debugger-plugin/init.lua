-- Imports the plugin's additional Lua modules.
local lib = require("ros2-debugger-plugin.lib")
local parser = require("ros2-debugger-plugin.parser")
local utils = require("ros2-debugger-plugin.utils")

-- Creates an object for the module. All of the module's
-- functions are associated with this object, which is
-- returned when the module is called with `require`.
local M = {}

-- Routes calls made to this module to functions in the
-- plugin's other modules.
M.say_hello = lib.say_hello
M.parse_launch_file = parser.parse_launch_file
M.launch_debugger = lib.launch_debugger
M.generate_vimspector_file= utils.generate_vimspector_file

return M
