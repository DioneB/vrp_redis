
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
local idgens = Tools.newIDGenerator()

-- Server Only Bridge
Bridge = {}
Proxy.addInterface("vrp_cache",Bridge)

AddEventHandler('vrp_cache:response', function(id, err, res)
    if cbs[id] == nil then return end
    cbs[id](err, res)
    cbs[id] = nil
    idgens:free(id)
end)

function Bridge.set(key,data)
    if type(data) == 'table' then    
        data = json.encode(data)
    end
    return Redis.set(key, data)
end

function Bridge.get(key)
    return Redis.get(key)
end

function Bridge.remove(key)
    return Redis.del(key)
end

function Bridge.invalidate(prefix)
    local keys = Redis.keys(prefix..":*")
    return Redis.del(keys)
end
