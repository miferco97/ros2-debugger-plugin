local M = {}
function M.say_hello() print('Hello world!!') end
function M.launch_debugger(file)
    local parser = require('ros2-launch-debugger-plugin.parser')
    local launch_file = parser.parse_launch_file(file)
    print(launch_file)
end
return M
