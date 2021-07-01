const mysql = require("mysql2/promise");
const bcrypt = require('bcryptjs');
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
exports.register_guardian = async function(req, res, next) {
    const FName = req.body.FName;
    const LName = req.body.LName;
    const email = req.body.email;
    const password = req.body.password;
    const phone_Num = req.body.phone_Num;

    const [rows] = await db.query("SELECT email FROM student WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        //response_err = "Email address already taken";
        res.json({ status: "Email address already taken" });
        console.log("Email address already taken")
        console.log(rows);
    } else {
        let hashedPassword = await bcrypt.hash(password, 8)
        console.log(hashedPassword);
        db.query("INSERT INTO student (email,password,FName,LName,P_Num) VALUES (?,?,?,?,?);", [email, hashedPassword, FName, LName, phone_Num]);
        res.json({ confirm: "Guardian registered successfully" });
        console.log("Guardian registered successfully");
    }
    //res.json({status:response_err});
    next();
};

exports.login_guardian = async function(req, res, next) {
    console.log(req.body);

    const email = req.body.email;
    const password = req.body.password;
    const [rows] = await db.query("SELECT * FROM student WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        if (await bcrypt.compare(password, rows[0].password)) {
            const [studentInfo] = await db.query("SELECT * FROM student WHERE email = ? ;", [email]);
            res.json({ success: studentInfo });
            console.log(studentInfo);
        } else {
            res.json({ status: "Email address or password is invalid" });
            console.log("Password is invalid");
        }
    } else {
        res.json({ status: "Email address or password is invalid" });
        console.log("Email address is invalid");
    }
    //res.json({status:response_err});
    next();

};