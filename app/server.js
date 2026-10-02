const http = require('http');

const PORT = process.env.PORT || 8080;
const VERSION = process.env.APP_VERSION || "v1.0.0";

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    return res.end(JSON.stringify({ status: 'UP', version: VERSION, timestamp: new Date() }));
  }

  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    message: 'Welcome to Enterprise Delivery Platform API',
    version: VERSION,
    environment: process.env.NODE_ENV || 'production'
  }));
});

server.listen(PORT, () => {
  console.log("Server running on port " + PORT + " [Version: " + VERSION + "]");
});