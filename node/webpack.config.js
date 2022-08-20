const path = require("path");

module.exports = {
  entry: "./index.js",
  target: "node",
  mode: "production",
  output: {
    filename: "server/redis_module.js",
    path: path.resolve(__dirname, ".."),
  },
  optimization: {
    minimize: false,
  },
};
