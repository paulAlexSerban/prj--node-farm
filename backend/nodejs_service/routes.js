const fs = require("fs");

const requestHandler = (req, res) => {
  const url = req.url;
  const method = req.method;

  res.setHeader("Content-Type", "text/html");

  if (url === "/submit-message") {
    res.write(`
    <html>
      <head>
        <title>Enter message:</title>
      </head>
      <body>
        <form action="/message" method="POST">
          <input type="text" name="message">
          <button type="submit">Submit</button>
        </form>
      </body>
    </html>
  `);
    return res.end();
  }

  if (url === "/message" && method === "POST") {
    const body = [];

    req.on("data", (chunk) => {
      body.push(chunk);
    });

    return req.on("end", () => {
      const parsedBody = Buffer.concat(body).toString();
      const message = parsedBody.split("=")[1];
      fs.writeFile(`message-${Date.now()}.txt`, message, (error) => {
        res.statusCode = 302;
        res.setHeader("Location", "/submit-message");
        return res.end();
      });
    });
  }
};

module.exports = requestHandler;
