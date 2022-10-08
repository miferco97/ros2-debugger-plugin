" Title:        ROS2 debugger plugin
" Description:  A plugin to provide an easy way to debug ros2 nodes using the
" ros2 launch command syntax.
" Last Change:  10/08/2022
" Maintainer:   Miguel Fernandez Cortizas <https://github.com/miferco97>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_ros2_debugger_plugin")
    finish
endif
let g:loaded_ros2_debugger_plugin = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/ros2-debugger-plugin/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 Ros2SayHello 
      \ lua require("ros2-debugger-plugin").say_hello()
command! -nargs=1 -complete=file Ros2LaunchDebugger
      \ lua require('ros2-debugger-plugin').launch_debugger(vim.fn.expand("<args>"))
