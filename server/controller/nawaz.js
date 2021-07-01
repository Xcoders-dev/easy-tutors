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

exports.update_tutor = async function(req, res, next) {
    console.log("\n\nUpdate Tutor Api reached");
    const FName = req.body.FName;
    const LName = req.body.LName;
    const email = req.body.email;
    const updatedEmail = req.body.updatedEmail;
    const password = req.body.password;
    const phone_Num = req.body.phone_Num;
    const pref_city = req.body.pref_city;
    const expected_Sal = req.body.expected_Sal;
    const about_me = req.body.about_me;
    const avail_time_from = req.body.avail_time_from;
    const avail_time_to = req.body.avail_time_to;


    const [rows] = await db.query("SELECT email FROM Tutor WHERE email = ? ;", [updatedEmail]);
    if (rows.length > 0) {
        //response_err = "Email address already taken";
        res.json({ status: "Email address already taken" });
        console.log("Email address already taken")
        console.log(rows);
    } else {
        let hashedPassword = await bcrypt.hash(password, 8)
        console.log(hashedPassword);

        db.query("UPDATE  tutor SET email=?,password=?,FName=?,LName=?,P_Num=?,pref_city=?,expected_Sal=?,about_me=?,avail_time_from=?,avail_time_to=? WHERE email=?", [
            updatedEmail, hashedPassword, FName, LName, phone_Num, pref_city, expected_Sal, about_me, avail_time_from, avail_time_to, email
        ], );
        db.query("UPDATE tuitionrequest SET tutorEmail=? WHERE tutorEmail=?", [
            updatedEmail, email
        ], );
        db.query("UPDATE tuitionrequest_temp SET tutorEmail=? WHERE tutorEmail=?", [
            updatedEmail, email
        ], );
        console.log("Profile Updated Successfully");

        const [cols] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [updatedEmail]);
        res.json({ success: cols, confirm: "Profile Updated Successfully" });
        console.log(cols);
    }
    //res.json({status:response_err});
    next();
};

exports.update_student = async function(req, res, next) {
    console.log("\n\nUpdate Student Api reached");

    const FName = req.body.FName;
    const LName = req.body.LName;
    const email = req.body.email;
    const updatedEmail = req.body.updatedEmail;
    const password = req.body.password;
    const phone_Num = req.body.phone_Num;




    const [rows] = await db.query("SELECT email FROM student WHERE email = ? ;", [updatedEmail]);
    if (rows.length > 0) {
        //response_err = "Email address already taken";
        res.json({ status: "Email address already taken" });
        console.log("Email address already taken")
        console.log(rows);
    } else {
        let hashedPassword = await bcrypt.hash(password, 8)
        console.log(hashedPassword);
        db.query("UPDATE  student SET email=?, password=?,FName=?,LName=?,P_Num=? WHERE email=?", [
            updatedEmail, hashedPassword, FName, LName, phone_Num, email
        ], );
        db.query("UPDATE tuitionrequest SET studentEmail=? WHERE studentEmail=?", [
            updatedEmail, email
        ], );
        db.query("UPDATE tuitionrequest_temp SET studentEmail=? WHERE studentEmail=?", [
            updatedEmail, email
        ], );
        console.log("Profile Updated Successfully");

        const [cols] = await db.query("SELECT * FROM student WHERE email = ? ;", [updatedEmail]);
        res.json({ success: cols, confirm: "Profile Updated Successfully" });
        console.log(cols);
    }
    //res.json({status:response_err});
    next();
};