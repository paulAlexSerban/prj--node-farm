const http = require("http");
const routes = require("./routes");

const PORT = 3000;

const server = http.createServer(routes);

server.listen(PORT, () => {
  console.log(`Listen to requests on port http://localhost:${PORT}`);
});