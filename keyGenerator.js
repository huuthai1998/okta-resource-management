const njwt = require("njwt");

const fs = require("node:fs");

let privateKey = "";

try {
  const data = fs.readFileSync("./apiKey.pem", "utf8");
  privateKey = data;
} catch (err) {
  console.error(err);
}
const clientId = "0oackj4uoqSDyzgvS1d7"; // Or load from configuration
const now = Math.floor(new Date().getTime() / 1000); // seconds since epoch
const plus5Minutes = new Date((now + 5 * 60) * 1000); // Date object
const alg = "RS256"; // one of RSA or ECDSA algorithms: RS256, RS384, RS512, ES256, ES384, ES512

const claims = {
  aud: "https://ntrsoiesys.oktapreview.com/oauth2/default/v1/token", // audience
};

const jwt = njwt
  .create(claims, privateKey, alg)
  .setIssuedAt(now)
  .setExpiration(plus5Minutes)
  .setIssuer(clientId)
  .setSubject(clientId)
  .compact();

console.log(jwt);
