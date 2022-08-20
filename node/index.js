import Redis from "ioredis";

var redis = new Redis({
  port: 6379,
  host: "127.0.0.1",
  family: 4,
  db: 0,
});

global.on("vrp_cache:call", async (ev, id, cmd, args) => {
  const sendResponse = (res, err) => {
    setImmediate(() => global.emit(ev, id, err || false, res));
  };
  try {
    const res = await redis[cmd](...args);
    sendResponse(res, null);
  } catch (err) {
    sendResponse(null, err);
  }
});
