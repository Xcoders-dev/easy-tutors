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




exports.register_tutor = async function(req, res, next){
    const FName = req.body.FName;
    const LName = req.body.LName;
    const email = req.body.email;
    const password = req.body.password;
    const phone_Num = req.body.phone_Num;
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



exports.login_tutor = async function(req, res, next) {
    console.log(req.body);

    const email = req.body.email;
    const password = req.body.password;
    const [rows] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        if(password == rows[0].password){
        const [tutorInfo] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [email]);
        res.json({success:tutorInfo});
        //console.log("User: "+email +" successfully logged in"); 
        console.log(tutorInfo);
    }else{
        res.json({status:"Email address or password is invalid"});
        console.log("Password is invalid");
        }  
    }else{
        res.json({status:"Email address or password is invalid"});
        console.log("Email address is invalid");
    }
    //res.json({status:response_err});
    next();

};


exports.login_tutor = async function(req, res, next) {
    console.log(req.body);

    const email = req.body.email;
    const password = req.body.password;
    const [rows] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        if(password == rows[0].password){
        const [tutorInfo] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [email]);
        res.json({success:tutorInfo});
        //console.log("User: "+email +" successfully logged in"); 
        console.log(tutorInfo);
    }else{
        res.json({status:"Email address or password is invalid"});
        console.log("Password is invalid");
        }  
    }else{
        res.json({status:"Email address or password is invalid"});
        console.log("Email address is invalid");
    }
    //res.json({status:response_err});
    next();

};

exports.showTuitionReq = async function(req, res, next) {
    console.log("\n\nshowTuitionReq Api reached");

    const [rows] = await db.query("SELECT tuitionrequest.id, tuitionrequest.category, tuitionrequest.daysWeekly,tuitionrequest.city,tuitionrequest.salary,tuitionrequest.subject,tuitionrequest.studentEmail, student.FName,student.LName FROM tuitionrequest INNER JOIN student ON tuitionrequest.studentEmail=student.email WHERE tuitionrequest.tutorEmail IS NULL;");
    if (rows.length != 0) {

        console.log("Tuition request jobs found : "+rows.length+"");
        console.log(rows);
        res.json({success:rows});
    }else{
        res.json({fail:"Sorry, we have no jobs at this moment."});
        console.log("No job found");
    }
    next();

};