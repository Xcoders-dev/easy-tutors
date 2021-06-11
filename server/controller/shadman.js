//var mysql = require('mysql');
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
    console.log("Mysql connected-Shadman");


}
main();
exports.register_tutor = async function(req, res, next) {
    const FName = req.body.FName;
    const LName = req.body.LName;
    const email = req.body.email;
    const password = req.body.password;
    const phone_Num = req.body.phone_Num;
    var response_conf = "";
    var response_err = "";
    const [rows] = await db.query("SELECT email FROM tutor WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        //response_err = "Email address already taken";
        res.json({ status: "Email address already taken" });
        console.log("Email address already taken")
        console.log(rows);
    } else {
        db.query("INSERT INTO tutor (email,password,FName,LName,P_Num) VALUES (?,?,?,?,?);", [email, password, FName, LName, phone_Num]);
        //response_conf = "Tutor registered successfully";
        res.json({ confirm: "Tutor registered successfully" });
        console.log("Tutor registered successfully");
    }
    //res.json({status:response_err});
    next();

};