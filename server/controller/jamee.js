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
    console.log("Mysql connected-Jamee");



}
main();

exports.add_tutorRequest = async function(req, res, next) {
    const category = req.body.category;
    const daysWeekly = req.body.daysWeekly;
    const city = req.body.city;
    const subject = req.body.subject;
    const studentClass = req.body.studentClass;
    const time = req.body.time;
    const salary = req.body.salary;
    const studentEmail = req.body.studentEmail;
    
    
    db.query("INSERT INTO tuitionrequest (category,daysWeekly,city,subject,studentClass,time,salary,studentEmail) VALUES (?,?,?,?,?,?,?,?);", [category, daysWeekly,city, subject, studentClass, time, salary, studentEmail]);
        //response_conf = "Tutor registered successfully";
        res.json({ confirm: "Tutor request successful" });
        console.log("Tutor request successful");
    
    //res.json({status:response_err});
    next();

}; 