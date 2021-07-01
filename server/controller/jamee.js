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

exports.add_tutorRequest = async function(req, res, next) {
    const category = req.body.category;
    const daysWeekly = req.body.daysWeekly;
    const city = req.body.city;
    const subject = req.body.subject;
    const studentClass = req.body.studentClass;
    const time = req.body.time;
    const salary = req.body.salary;
    const studentEmail = req.body.studentEmail;


    db.query("INSERT INTO tuitionrequest (category,daysWeekly,city,subject,studentClass,time,salary,studentEmail) VALUES (?,?,?,?,?,?,?,?);", [category, daysWeekly, city, subject, studentClass, time, salary, studentEmail]);
    //response_conf = "Tutor registered successfully";
    res.json({ confirm: "Tutor request successful" });
    console.log("Tutor request successful");

    //res.json({status:response_err});
    next();
};




exports.display_Tuition_Requests = async function(req, res, next) {
    console.log("\n\nstudentTuitionRequest Api reached");
    console.log(req.body);
    const studEmail = req.body.studEmail;
    const [rows] = await db.query("SELECT * FROM tuitionrequest WHERE studentEmail = ? and tutorEmail IS NULL; ", [studEmail]);
    // const [rows] = await db.query("SELECT * FROM tuitionrequest WHERE studentEmail = 'fahid@gmail.com';");
    if (rows.length > 0) {

        console.log("PendingTuition requests found : " + rows.length + "");
        console.log(rows);
        res.json({ success: rows });
    } else {
        res.json({ fail: "Sorry, you have no pending tution requsts." });
        console.log("No pending tution requsts");
    }
    next();

};

exports.delete_Tuition_Request = async function(req, res, next) {
    console.log("\n\ndeleteTuitionRequest Api reached");
    console.log(req.body);
    const stEmail = req.body.stEmail;
    const tutionReqID = req.body.tutionReqID;
    await db.query("DELETE FROM tuitionrequest WHERE studentEmail = ? and id = ?; ", [stEmail, tutionReqID]);
    await db.query("DELETE FROM tuitionrequest_temp WHERE studentEmail = ? and tuitionRequest_ID = ?; ", [stEmail, tutionReqID]);
    res.json({ confirmation: "Tution Request Deleted" });
    console.log("deleted");
    next();

};


exports.appoint_tutor = async function(req, res, next) {
    console.log("\n\n appoint tutor Api reached");
    const studEmail = req.body.studEmail;
    console.log(req.body);
    // const [rows] = await db.query("SELECT tuitionrequest.id, tuitionrequest.category,tuitionrequest.salary,tuitionrequest.subject,tuitionrequest.tutorEmail, tuitionrequest_temp.id ,tutor.id,tutor.email,tutor.FName,tutor.LName,tutor.P_Num, tutor.pref_city, tutor.expected_Sal, tutor.about_me, tutor.avail_time_from, tutor.avail_time_to, tutor.gender FROM tuitionrequest_temp INNER JOIN tutor ON tuitionrequest_temp.tutorEmail=tutor.email INNER JOIN tuitionrequest ON tuitionrequest_temp.tuitionRequest_ID=tuitionrequest.id ");
    // const [rows] = await db.query("SELECT tuitionrequest.id, tuitionrequest.category,tuitionrequest.salary,tuitionrequest.subject, tuitionrequest_temp.tutorEmail FROM tuitionrequest_temp INNER JOIN tuitionrequest ON tuitionrequest_temp.tuitionRequest_ID=tuitionrequest.id WHERE tuitionrequest_temp.studentEmail = ?; ", [studEmail]);
    const [rows] = await db.query("SELECT tuitionRequest_ID, tutorEmail FROM tuitionrequest_temp WHERE studentEmail = ?; ", [studEmail]);
    var temp1 = [];
    var temp2 = [];
    if (rows.length != 0) {
        console.log("Applied Tutors found : " + rows.length + "");
        for (var i = 0; i < rows.length; i++) {

            var [cols1] = await db.query("SELECT  id, category, salary, subject FROM tuitionrequest WHERE id = ?", [rows[i].tuitionRequest_ID]);
            if (cols1.length != 0) {
                temp1[i] = cols1[0];
            } else {

                console.log("issues in cols 1");
            }

            var [cols2] = await db.query("SELECT  id, email, FName, LName, P_Num, pref_city, expected_Sal, about_me, avail_time_from, avail_time_to FROM tutor WHERE email = ?", [rows[i].tutorEmail]);
            if (cols2.length != 0) {
                temp2[i] = cols2[0];
            } else {

                console.log("isuues in cols 2");
            }
            cols1 = [];
            cols2 = [];

        }
        if (temp1.length != 0 && temp2.length != 0) {
            console.log("Applied tutors found : " + temp1.length + " " + temp2.length + "");
            console.log(temp1);
            console.log(temp2);
            res.json({ success1: temp1, success2: temp2 });
        } else {

            console.log("No applied tutors");
        }


        next();
    } else {
        res.json({ fail: "Sorry, no tutors have applied at the moment." });
        console.log("No applied tutors");
    }

};

exports.appoint = async function(req, res, next) {
    console.log("\n\nappoint Api reached");
    console.log(req.body);
    const stEmail = req.body.stEmail;
    const tutionReqID = req.body.tutionReqID;
    const tEmail = req.body.tEmail;

    await db.query("UPDATE tuitionrequest SET tutorEmail =? WHERE id = ?;", [tEmail, tutionReqID]);
    await db.query("DELETE FROM tuitionrequest_temp WHERE studentEmail = ? and tuitionRequest_ID = ?; ", [stEmail, tutionReqID]);
    res.json({ status: "Tutor appointed and all other Tutor applications for the same subject removed" });
    next();

};

exports.delete = async function(req, res, next) {
    console.log("\n\ndelete Api reached");
    console.log(req.body);
    const stEmail = req.body.stEmail;
    const tutionReqID = req.body.tutionReqID;
    const tEmail = req.body.tEmail;

    await db.query("DELETE FROM tuitionrequest_temp WHERE studentEmail = ? and tuitionRequest_ID = ? and tutorEmail = ?; ", [stEmail, tutionReqID, tEmail]);
    res.json({ status: "Tutor Rejected" });
    next();

};