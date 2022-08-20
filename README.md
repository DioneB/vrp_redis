<h1 align="center">

![Banner](https://raw.githubusercontent.com/Santagain/vrp_redis/main/banner.png)

</h1>

<h4 align="center">A RedisDB Wrapper for vRP Based on FiveM Redis</h4>

<p align="center">
  <a href="#API">API</a> •
  <a href="#Wiki">Wiki</a> •
  <a href="#License">License</a> •
  <a href="#Roadmap">Roadmap</a> •
  <a href="#Contribute">Contribute</a>
</p>

## Methods

```lua
-- Get vrp_redis Reference/Functions (ONLY SERVER-SIDE)

local Cache = Proxy.getInterface("vrp_redis")


-- Save data on Redis Cache | if not "expire_time" passed they will persistent
Cache.set(key, value, expire_time)

-- Get data from Redis Cache
local result = Cache.get(key)

-- Remove data with informed key from Redis Cache
Cache.remove(key)

-- Invalidate all data with informed prefix from Redis Cache
local res = Cache.invalidate(prefix)


```

## Wiki

- See [Install Instructions](https://github.com/Santagain/vrp_redis/wiki) for detailed Instructions for install and use of Redis & RediSearch.

## Roadmap

- Find on our [roadmap](https://github.com/Santagain/vrp_redis/projects/1) the next steps of the project.

## Contribute

- Want to contribute? [Follow these recommendations](https://github.com/Santagain/vrp_redis/blob/main/CONTRIBUTING.md).
