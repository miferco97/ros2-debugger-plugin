local M = {}
function M.parse_launch_file(file_path)
    print ("Parsing launch file: " .. file_path)
    local launch_file = io.open(file_path, "r")
    local launch_file_content = launch_file:read("*all")
    launch_file:close()
    local launch_file_lines = {}
--   Try to run python script to parse launch file
    local params_raw = io.popen("ros2 launch " .. file_path .. " -s")

    -- Extract params, they only has one indent
    local params = {}
    local first_line = true
    for line in params_raw:lines() do
      if first_line then
        first_line = false
      else
      if line.match(line, "'.*'") then
        local param = line.match(line, "'.*'")
            table.insert(params, param)
        end
      end
    end

  if #params == 0 then
    print("No params found")
    return nil
  end

  -- match each even line with the next odd line by adding := to the end of the even line
  local names= {}
  local default_values = {}
  local i = 0
  for _, param in ipairs(params) do
    if i % 2 == 0 then
      table.insert(names, param)
    else
      table.insert(default_values, param)
    end
    i = i + 1
  end

  -- create a table with the name and default value of each param
  local final_params_str = ""
  for j = 1, #names do
    local str = ""
    if names[j] == "'namespace'" then
      str = ',"-r"," __ns:="' .. default_values[j] .. '"'
    else
      str = '"-p","' .. string.sub(names[j],2,-2) .. ":=" .. string.sub(default_values[j],2,-2) .. '"'
    end
    final_params_str = final_params_str .. str
  end

  return '"--ros-args"' .. final_params_str

end

return M


