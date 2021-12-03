# Anti-Destroy
## What is Anti-Destroy? Anti-Destroy is a script I made which can make an Instance (also referred to as an object) unable to be destroyed.

# Script:
- [source](/script/AntiDestroy.lua)<br>^[\(raw\)](https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua)

# Usage & Documentation:

## First, you need to get the class:
```lua
local AntiDestroy = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua'))()
```
## Then, you can use the `Add` function with the following syntax:
```lua
AntiDestroy:Add(<Instance>Object)
```
## Example:
```lua
local AntiDestroy = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua'))()

local GUI = Instance.new('ScreenGui', workspace)
GUI.Name = 'OP HACKS'

AntiDestroy:Add(GUI)
```
### Now if you try to destroy the object, nothing will happen.<br>This works for calling the Destroy function on an object as well as setting the Parent of the object to nil.

## You can also use the `Toggle` function to toggle on or off whether or not you want Anti-Destroy to be activated on an object with the following syntax:
```lua
AntiDestroy:Toggle(<Instance>Object, (optional)<boolean>Status)
```
### Status determines whether or not the object can be destroyed or not.<br>If nothing is provided as the second argument, the status will be the OPPOSITE of the current status: if the status of an object is toggled on, running the `Toggle` function with no second argument will set the status to false and vice versa.
## Example:
```lua
local AntiDestroy = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua'))()

local GUI = Instance.new('ScreenGui', workspace)
GUI.Name = 'OP HACKS'

AntiDestroy:Add(GUI)
--GUI cannot be deleted now.

AntiDestroy:Toggle(GUI, false)
--GUI CAN be deleted now.
AntiDestroy:Toggle(GUI, true)
--GUI CANNOT be deleted now.
AntiDestroy:Toggle(GUI)
--GUI CAN be deleted again.
AntiDestroy:Toggle(GUI)
--GUI CANNOT be deleted again.
```

## Also, there is the `Stop` function which you can use to completely deactivate Anti-Destroy. This toggles off all objects and will render all hooks useless. This also will make it so the class becomes useless, so this is irreversable. The syntax for the `Stop`function is:
```lua
AntiDestroy:Stop()
```
## Here is an example:
```lua
local AntiDestroy = loadstring(game:HttpGet('https://raw.githubusercontent.com/TechHog8984/Anti-Destroy/main/script/AntiDestroy.lua'))()

local GUI = Instance.new('ScreenGui', workspace)
GUI.Name = 'OP HACKS'

local GUI2 = Instance.new('ScreenGui', workspace)
GUI2.Name = 'SEMI-OP HACKS'

local GUI3 = Instance.new('ScreenGui', workspace)
GUI3.Name = 'DECENT HACKS'

AntiDestroy:Add(GUI)
AntiDestroy:Add(GUI2)
AntiDestroy:Add(GUI3)
--The gui's cannot be destroyed.

AntiDestroy:Toggle(GUI, false)
--GUI can be deleted, while GUI2 and GUI3 cannot.
AntiDestroy:Stop()
--Now, all gui's can be deleted again.
AntiDestroy:Toggle(GUI, true)
--Will error, as the class is now destroyed after running the Stop function.
```

## If you want to toggle all of the objects without stopping or manually keeping track of them, then you can use the `ToggleAll` function with the following syntax:
```lua
AntiDestroy:ToggleAll((optional)<boolean>Status)
```
### This function is the same as the `Toggle` function, except for the fact that you do not provide an Instance as it toggles all of the objects that have been added.

## If you want to toggle a specific object off forever, then you can use the `Remove` function with the following syntax:
```lua
AntiDestroy:Remove(<Instance>Object)
```

# Extra info

## That is all for Anti-Destroy, thanks for reading!
### If you experience any issues, bugs, etc,. or even if you want to make a suggestion, please make a [new issue](https://github.com/TechHog8984/Anti-Destroy/issues/new).<br>If you have any questions regarding the code itself, you can look at the [source code](/script/AntiDestroy.lua) (contains just the plain source code with no notes / any comments regarding the code itself).
