Redis = {}
cbs = { }
cached = {}
_memoize = nil 

_makeKeyFn = function(key)
  return function(...)
      local args = {...}
      if #args > 0 then
          s = ":"..args[1]
          for i=2, #args do
              s = s ..":".. args[i]
          end
      end
      return key..s
  end
end

redis = function(cmd, ...)
  local args = {...}
  local id = idgens:gen()
  local p = promise.new()
  cbs[id] = function(err, res)
      p:resolve({res, err})
  end
  TriggerEvent('vrp_cache:call', 'vrp_cache:response', id, cmd, args)
  local re = Citizen.Await(p)
  return re[1], re[2]
end

join = function(...)
  local args = {...}
  local s = args[1]
  for i=2, #args do
      s = s .. args[i]
  end
  return s
end

unpackFrom = function(n, t)
  if #t == 0 then return nil end
  if n == #t then return t[#t] end
  return t[n], unpackFrom(n + 1, t)
end