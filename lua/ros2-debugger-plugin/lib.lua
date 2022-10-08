local M = {}
function M.say_hello() print('Hello world!!') end
function M.launch_debugger(file)
    local parser = require('ros2-debugger-plugin.parser')
    local utils  = require('ros2-debugger-plugin.utils')
    local params = parser.parse_launch_file(file)
    print(params)
    utils.generate_vimspector_file("test","linux-debug",params)
end
return M
