const fs = require("fs");

// - when reading a only when starting the program / server we use
// readFileSync as we don not care if it blocks the process
const tplOverview = fs.readFileSync(
  `${__dirname}/dist/views/tpl-overview.html`,
  "utf-8"
);
const tplProduct = fs.readFileSync(
  `${__dirname}/dist/views/tpl-product.html`,
  "utf-8"
);
const cmpCard = fs.readFileSync(
  `${__dirname}/dist/views/cmp-card.html`,
  "utf-8"
);

const data = fs.readFileSync(`${__dirname}/dist/data.json`, "utf-8");
const dataObj = JSON.parse(data);

const replaceTemplate = (template, product) => {
  let output = template.replace(/{%PRODUCT_NAME%}/g, product.productName);
  output = output.replace(/{%IMAGE%}/g, product.image);
  output = output.replace(/{%PRICE%}/g, product.price);
  output = output.replace(/{%FROM%}/g, product.from);
  output = output.replace(/{%NUTRIENTS%}/g, product.nutrients);
  output = output.replace(/{%QUANTITY%}/g, product.quantity);
  output = output.replace(/{%DESCRIPTION%}/g, product.description);
  output = output.replace(/{%ID%}/g, product.id);
  if (!product.organic) output.replace(/{%NOT_ORGANIC%}/g, "not-organic");
  return output;
};

const requestHandler = (req, res) => {
  const url = req.url;
  const method = req.method;

  if (url === "/" || url === "/overview") {
    // overview page
    res.writeHead(200, { "Content-Type": "text/html" });
    const cardsHTML = dataObj.map((el) => replaceTemplate(cmpCard, el)).join('');
    const output = tplOverview.replace(/{%PRODUCT_CARDS%}/g, cardsHTML);
    return res.end(output);
  } else if (url === "/product") {
    // product page
    res.setHeader("Content-Type", "text/html");

    return res.end(tplProduct);
  } else if (url === "/api") {
    // api
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(data);
  } else if (url.includes(".css")) {
    res.writeHead(200, { "Content-Type": "text/css" });
    fs.readFile(`${__dirname}${url}`, "utf-8", (err, data) => {
      if (err) {
        return console.log("ERROR:", { err });
      }
      res.write(data);
      return res.end();
    });
  } else {
    // not found page
    res.writeHead(404, {
      "Content-Type": "text/html",
      "my-own-header": "hello world",
    });
    res.end("Page not found");
  }
};

module.exports = requestHandler;
