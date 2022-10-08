local M = {}
function M.parse_launch_file(file_path)
    print ("Parsing launch file: " .. file_path)
    local launch_file = io.open(file_path, "r")
    local launch_file_content = launch_file:read("*all")
    launch_file:close()
    local launch_file_lines = {}
--   Try to run python script to parse launch file
    local python_script = io.popen("ros2 launch " .. file_path .. " --print")
    return python_script:read("*all")
end



return M

