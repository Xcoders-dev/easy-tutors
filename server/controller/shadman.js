const bcrypt = require('bcryptjs');
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




exports.register_tutor = async function(req, res, next) {
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
        let hashedPassword = await bcrypt.hash(password, 8)
        console.log(hashedPassword);
        db.query("INSERT INTO tutor (email,password,FName,LName,P_Num) VALUES (?,?,?,?,?);", [email, hashedPassword, FName, LName, phone_Num]);
        res.json({ confirm: "Tutor registered successfully" });
        console.log("Tutor registered successfully");
    }
    next();
};



exports.login_tutor = async function(req, res, next) {
    console.log(req.body);

    const email = req.body.email;
    const password = req.body.password;
    const [rows] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [email]);
    if (rows.length > 0) {
        if (await bcrypt.compare(password, rows[0].password)) {
            const [tutorInfo] = await db.query("SELECT * FROM tutor WHERE email = ? ;", [email]);
            res.json({ success: tutorInfo });
            console.log(tutorInfo);
        } else {
            res.json({ status: "Email address or password is invalid" });
            console.log("Password is invalid");
        }
    } else {
        res.json({ status: "Email address or password is invalid" });
        console.log("Email address is invalid");
    }
    next();

};

exports.showTuitionReq = async function(req, res, next) {
    console.log("\n\nshowTuitionReq Api reached");
    var apply_status = [];
    const email = req.body.email;
    console.log(req.body);
    const [rows] = await db.query("SELECT tuitionrequest.id, tuitionrequest.category, tuitionrequest.daysWeekly,tuitionrequest.city,tuitionrequest.salary,tuitionrequest.subject,tuitionrequest.studentEmail, student.FName,student.LName FROM tuitionrequest INNER JOIN student ON tuitionrequest.studentEmail=student.email WHERE tuitionrequest.tutorEmail IS NULL;");
    if (rows.length != 0) {
        console.log("Tuition request jobs found : " + rows.length + "");
        for (var i = 0; i < rows.length; i++) {
            var [status_row] = await db.query("SELECT tuitionRequest_ID FROM tuitionrequest_temp WHERE tuitionRequest_ID = ? AND tutorEmail = ? ;", [rows[i].id, email]);
            if (status_row.length != 0) {
                apply_status[i] = 1;
            } else {
                apply_status[i] = 0;
            }
            [status_row] = [];
        }
        console.log("Applied status length:" + apply_status.length + "\n");
        console.log("Apply status : ", apply_status);
        console.log(rows);
        res.json({ success_1: rows, success_2: apply_status });
    } else {
        res.json({ fail: "Sorry, we have no jobs at this moment." });
        console.log("No job found");
    }
    next();

};

exports.applyTuitionReq = async function(req, res, next) {
    console.log("applyTuition api reached");
    console.log(req.body);

    const tuitionRequest_ID = req.body.tuitionReq_ID;
    const tutorEmail = req.body.tutorEmail;
    const studentEmail = req.body.studEmail;

    db.query("INSERT INTO tuitionrequest_temp (tuitionRequest_ID,tutorEmail,studentEmail) VALUES (?,?,?);", [tuitionRequest_ID, tutorEmail, studentEmail]);
    res.json({ success: "Application successful" });
    console.log("Application successful");
    next();
};

exports.showAppliedTuitionReq = async function(req, res, next) {
    console.log("\nshowAppliedTuitionReq api reached");
    console.log(req.body);

    var row = [];
    const tutorEmail = req.body.tutorEmail;
    const [temp] = await db.query("SELECT tuitionRequest_ID, studentEmail FROM tuitionrequest_temp WHERE tutorEmail = ? ;", [tutorEmail]);

    if (temp.length != 0) {
        console.log("Applied Tuition jobs found : " + temp.length + "");
        for (var i = 0; i < temp.length; i++) {
            var [tuitionReq] = await db.query("SELECT tuitionrequest.id, tuitionrequest.category, tuitionrequest.daysWeekly,tuitionrequest.city,tuitionrequest.salary,tuitionrequest.subject,tuitionrequest.studentEmail, student.FName,student.LName FROM tuitionrequest INNER JOIN student ON tuitionrequest.studentEmail=student.email WHERE tuitionrequest.tutorEmail IS NULL AND tuitionrequest.id = ? ;", [temp[i].tuitionRequest_ID]);
            if (tuitionReq.length != 0) {
                row[i] = tuitionReq[0];
            }
            tuitionReq = [];
        }
        console.log("Related rows in tuitionrequest table  : ", row.length);
        console.log(temp);
        console.log(row);
        res.json({ success: row });

    } else {
        res.json({ status: "You have not applied for a job." });
        console.log("Tutor has not applied for a job");
    }

    next();
};

exports.undoAppliedTuitionReq = async function(req, res, next) {
    console.log("\n undoAppliedTuitionReq api reached");
    console.log(req.body);

    tutorEmail = req.body.tutorEmail;
    tuitionRequest_ID = req.body.tuitionReqID;

    db.query('DELETE FROM tuitionrequest_temp WHERE tuitionRequest_ID = ? AND tutorEmail = ? ;', [tuitionRequest_ID, tutorEmail], async(error, results) => {
        if (error) {
            console.log(error);
        }
    });
    console.log("Undo successful");
    res.json({ success: 1 });
    next();
};


exports.showConfirmedTuitionReq = async function(req, res, next) {
    console.log("\nshowConfirmedTuitionReq api reached");
    console.log(req.body);
    const tutorEmail = req.body.tutorEmail;
    const [tuitionReq] = await db.query("SELECT tuitionrequest.id, tuitionrequest.category, tuitionrequest.daysWeekly,tuitionrequest.city,tuitionrequest.salary,tuitionrequest.subject,tuitionrequest.studentEmail, student.FName,student.LName FROM tuitionrequest INNER JOIN student ON tuitionrequest.studentEmail=student.email WHERE tuitionrequest.tutorEmail = ? ;", [tutorEmail]);

    if (tuitionReq.length != 0) {
        console.log("Confirmed Tuition jobs found : " + tuitionReq.length);
        console.log(tuitionReq);
        res.json({ success: tuitionReq });

    } else {
        res.json({ status: "You have no confirmed job." });
        console.log("Tutor has no confirmed job");
    }

    next();
};

exports.showAppointedTuitionReq = async function(req, res, next) {
    console.log("\nshowAppointedTuitionReq api reached");
    console.log(req.body);
    const studentEmail = req.body.studentEmail;
    const [tuitionReq] = await db.query("SELECT tuitionrequest.id, tuitionrequest.category, tuitionrequest.daysWeekly,tuitionrequest.city,tuitionrequest.salary,tuitionrequest.subject,tuitionrequest.studentEmail, tutor.FName,tutor.LName FROM tuitionrequest INNER JOIN tutor ON tuitionrequest.tutorEmail=tutor.email WHERE tuitionrequest.tutorEmail IS NOT NULL AND tuitionrequest.studentEmail = ? ;", [studentEmail]);

    if (tuitionReq.length != 0) {
        console.log("Appointed Tuition jobs found : " + tuitionReq.length);
        console.log(tuitionReq);
        res.json({ success: tuitionReq });

    } else {
        res.json({ status: "You have not appointed any tutor." });
        console.log("Student has not appointed any tutor");
    }

    next();
};