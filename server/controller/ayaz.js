const mysql = require("mysql2/promise");
let db = null;

async function main() {
    db = await mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "easytuitions",
        timezone: "+00:00",
        charset: "utf8mb4_general_ci",
    });
    console.log("Mysql connected-Ayaz");


}
main();