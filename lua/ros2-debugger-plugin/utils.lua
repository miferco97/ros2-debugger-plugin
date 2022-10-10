local M = {}
-- default values for a parameter in lua is written as follows:
-- local param = param or default_value
--
function M.generate_vimspector_file(program_name,  program_path_additions,program_args)
    local vimspector_json_file = io.open(".vimspector.json", "w")
    vimspector_json_file:write([[
{
  "configurations": {
    "ROS2": {
      "adapter": "vscode-cpptools",
      "configuration": {
        "request": "launch",
        "program": "${workspaceFolder}/build/]] .. program_path_additions .. [[/]] .. program_name .. [[",
        "args": []] .. program_args .. [[],
        "stopAtEntry": false,
        "cwd": "${workspaceFolder}",
        "environment": [],
        "externalConsole": false,
        "MIMode": "gdb"
      }
    }
  }
}
]])
    vimspector_json_file:close()
end

return M
