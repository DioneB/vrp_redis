
setmetatable(Redis, {
  __index = function(_, cmd)
      return function(...)
          if cmd == 'memoize' then
              _memoize.ival = select('1', ...) or 100
              return _memoize
          elseif cmd == 'makeKeyFn' then
              return _makeKeyFn(...)
          end
          return redis(cmd, ...)
      end
  end,
})

_memoize = {}
setmetatable(_memoize, {
  __index = function(_, cmd)
      return function(...)
          local ckey = join(cmd, ...)
          if cached[ckey] == nil then
              cached[ckey] = { i = 0, ival = _memoize.ival, res = nil, err = nil, args = {cmd, ...} }
              local res, err = Redis[cmd](...)
              cached[ckey].res = res
              cached[ckey].err = err
          else
              cached[ckey].i = cached[ckey].i + 1
              if cached[ckey].i % cached[ckey].ival == 0 then
                  Citizen.CreateThread(function()
                      local args = cached[ckey].args
                      local res, err = Redis[cmd](unpackFrom(2, args))
                      cached[ckey].res = res
                      cached[ckey].err = err
                  end)
              end
          end
          return cached[ckey].res, cached[ckey].err
      end
  end,
})