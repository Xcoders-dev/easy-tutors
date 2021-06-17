var express = require('express');
var router = express.Router();
var nawaz = require('../controller/nawaz');
var jamee = require('../controller/jamee');
var ayaz = require('../controller/ayaz');
var shoaib = require('../controller/shoaib');
var shadman = require('../controller/shadman');

//!Caution: DO NOT VIOALTE LINE RESITRICTIONS//
//--------Shadman--------//
router.post('/register-tutor', shadman.register_tutor);
router.post('/login-tutor', shadman.login_tutor);
router.get('/showTuitionReq', shadman.showTuitionReq);







//--------Shadman--------//
//--------Jamee--------//
router.post('/add-tutorRequest', jamee.add_tutorRequest);








//--------Jamee--------//
//--------Ayaz--------//
router.post('/register-guardian', ayaz.register_guardian);
router.post('/login-guardian', ayaz.login_guardian);







//--------Ayaz--------//
//--------Shoaib--------//
router.post('/register-tutor', shadman.register_tutor);







//--------Shoaib--------//
//--------Newaz--------//
router.post('/register-tutor', nawaz.update_tutor);
router.post('/update-student', nawaz.update_student);
router.get('/tutor-profile/:email', nawaz.tutor_profile);
router.get('/student-profile/:email', nawaz.student_profile);







//--------Newaz--------//
module.exports = router;