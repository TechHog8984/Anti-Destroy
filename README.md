# Anti-Destroy
## What is Anti-Destroy? Anti-Destroy is a script I made which can make an Instance (also referred to as an object) unable to be destroyed.

# Script:
- [source](/script/AntiDestroy.lua)<br>^[\(raw\)](https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua)

# Documentation:

## First, you need to get the class:
```lua
local AntiDestroy = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua'))()
```
## Then, you can use the Add function:
```lua
local AntiDestroy = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua'))()

AntiDestroy:Add(<Instance>Object)
```
### Now if you try to destroy the object, nothing will happen.<br>This works for the :Destroy and .Destroy functions as well as and setting the Parent of the object to nil.
