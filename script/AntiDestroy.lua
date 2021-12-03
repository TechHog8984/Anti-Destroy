local Class = {}
local Objects = {}
local Active = true

local function tablefind(Table, Value)
    for I, V in next, Table do
        if V == Value then
            return I, V
        end
    end
end
local function tablefindByIndex(Table, Index)
    for I, V in next, Table do
        if I == Index then
            return I, V
        end
    end
end

local oldNewIndex = nil
oldNewIndex = hookmetamethod(game, '__newindex', newcclosure(function(Self, Index, Value)
    if Active then
        if Self and tablefindByIndex(Objects, Self) and ({tablefindByIndex(Objects, Self)})[2] == true and (Index == 'Parent' and not Value) or (Index == 'Destroy' and Value ~= nil) then
            return
        end
    end
    return oldNewIndex(Self, Index, Value)
end))

local oldNameCall = nil
oldNameCall = hookmetamethod(game, '__namecall', newcclosure(function(Object, ...)
    if Active then
        local Method = getnamecallmethod()
        if Object and tablefindByIndex(Objects, Object) and ({tablefindByIndex(Objects, Object)})[2] == true and Method == 'Destroy' then
            return nil
        end
    end
        
    return oldNameCall(Object, ...)
end))

function Class:Add(Object)
    if Object and typeof(Object) == 'Instance' then
        local oldDestroy = nil
        oldDestroy = hookfunction(Object.Destroy, function(...)
            if Active and tablefindByIndex(Objects, Object) and ({tablefindByIndex(Objects, Object)})[2] == true then
                return nil
            end
            return oldDestroy(...)
        end)

        Objects[Object] = true
    else
        return error('expected Instance, got ' .. typeof(Object), 2)
    end
end
function Class:Remove(Object)
    if Object and typeof(Object) == 'Instance' then
        local Index, Value = tablefindByIndex(Objects, Object)
        if Index and Value ~= nil then
            Objects[Object] = false
            Objects[Object] = nil
        end
    else
        return error('expected Instance, got ' .. typeof(Object), 2)
    end
end
function Class:Toggle(Object, Bool)
    if Object and typeof(Object) == 'Instance' then
        local Index, Value = tablefindByIndex(Objects, Object)
        if Index and Value ~= nil then
            if Bool ~= nil then
                Objects[Object] = Bool
            else
                Objects[Object] = not Objects[Object]
            end
        else
            return error('failed to find object in objects', 2)
        end
    else
        return error('expected Instance, got ' .. typeof(Object), 2)
    end
end
function Class:ToggleAll(Bool)
    for Object, Status in next, Objects do
        if Object and Status ~= nil then
            if Bool ~= nil then
                Objects[Object] = Bool
            else
                Objects[Object] = not Objects[Object]
            end
        end
    end
end
function Class:Stop()
    Active = false
    Class = nil
end

return Class
