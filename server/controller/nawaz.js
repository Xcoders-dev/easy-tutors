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
    console.log("Mysql connected-Newaz");


}
main();

exports.update_tutor = async function(req, res, next) {
    const FName = req.body.FName;
    const LName = req.body.LName;
    const email = req.body.email;
    const password = req.body.password;
    const phone_Num = req.body.phone_Num;
    const pref_city = req.body.pref_city;
    const expected_Sal = req.body.expected_Sal;
    const about_me = req.body.about_me;
    const avail_time_from = req.body.avail_time_from;
    const avail_time_to = req.body.avail_time_to;
    const gender = req.body.gender;


    {
        db.query("UPDATE  tutor SET password=?,FName=?,LName=?,P_Num=?,pref_city=?,expected_Sal=?,about_me=?,avail_time_from=?,avail_time_to=?,gender=? WHERE email=?", [
                password, FName, LName, phone_Num, pref_city, expected_Sal, about_me, avail_time_from, avail_time_to, gender, email
            ],
            function(err, results, fields) {
                console.log(err);
                console.log(results); // results contains rows returned by server
                console.log(fields); // fields contains extra meta data about results, if available
                // fields contains extra meta data about results, if available

                // If you execute same statement again, it will be picked from a LRU cache
                // which will save query preparation time and give better performance
            });
        res.json({ confirm: "Tutor registered successfully" });
        console.log("Tutor registered successfully");
    }

    next();
};

exports.update_student = async function(req, res, next) {
    const FName = req.body.FName;
    const LName = req.body.LName;
    const email = req.body.email;
    const password = req.body.password;
    const phone_Num = req.body.phone_Num;



    {
        db.query("UPDATE  student SET password=?,FName=?,LName=?,P_Num=? WHERE email=?", [
                password, FName, LName, phone_Num, email
            ],
            function(err, results, fields) {
                console.log(err);
                console.log(results); // results contains rows returned by server
                console.log(fields); // fields contains extra meta data about results, if available
                // fields contains extra meta data about results, if available

                // If you execute same statement again, it will be picked from a LRU cache
                // which will save query preparation time and give better performance
            });
        res.json({ confirm: "Student Profile  Updated" });
        console.log("Student Profile Updated");
    }

    next();
};

exports.tutor_profile = async function(req, res, next) {
    //console.log(req.params);

    const email = req.params.email;

    const [rows] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        {
            res.json({ tutor: rows });
            console.log(rows);
        }
    } else {
        res.json({ status: "Email address or password is invalid" });
        console.log("Email address is invalid");
    }
    //res.json({status:response_err});
    next();

};
exports.student_profile = async function(req, res, next) {
    // console.log(req.body);

    const email = req.params.email;

    const [rows] = await db.query("SELECT * FROM student WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        {
            res.json({ student: rows });
            console.log(rows);
        }
    } else {
        res.json({ status: "Email address or password is invalid" });
        console.log("Email address is invalid");
    }
    //res.json({status:response_err});
    next();

};