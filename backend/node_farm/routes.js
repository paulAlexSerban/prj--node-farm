const fs = require("fs");

const requestHandler = (req, res) => {
  const url = req.url;
  const method = req.method;

  res.setHeader("Content-Type", "text/html");

  if (url === "/" || url === "/overview") {
    res.write(`
      This is the overview page.
  `);
    return res.end();
  } else if (url === "/product") {
    res.write(`
      The is the overview page.
  `);
    return res.end();
  } else {
    res.writeHead(404, {
      "Content-Type": "text/html",
      "my-own-header": "hello world",
    });
    res.end("Page not found");
  }
};

module.exports = requestHandler;
