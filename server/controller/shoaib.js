const mysql = require("mysql2/promise");
let db = null;

async function main() {
    db = await mysql.createConnection({
        host: "xlf3ljx3beaucz9x.cbetxkdyhwsb.us-east-1.rds.amazonaws.com",
        user: "qkc4uo95sj3wl1sg",
        password: "kmawegv34j38jhn7",
        database: "co1iokmcm7qf829x",
        timezone: "+00:00",
        charset: "utf8mb4_general_ci",
        port: 3306 || process.env.PORT
    });
    console.log("Mysql connected-Newaz");


}
main();