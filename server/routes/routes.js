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
router.post('/showTuitionReq', shadman.showTuitionReq);
router.post('/applyTuitionReq', shadman.applyTuitionReq);
router.post('/showAppliedTuitionReq', shadman.showAppliedTuitionReq);
router.post('/undoAppliedTuitionReq', shadman.undoAppliedTuitionReq);
router.post('/showConfirmedTuitionReq', shadman.showConfirmedTuitionReq);
router.post('/showAppointedTuitionReq', shadman.showAppointedTuitionReq);
//--------Shadman--------//
//--------Jamee--------//
router.post('/add-tutorRequest', jamee.add_tutorRequest);
router.post('/display-Tuition-Requests', jamee.display_Tuition_Requests);
router.post('/delete-Tuition-Request', jamee.delete_Tuition_Request);
router.post('/appoint-tutor', jamee.appoint_tutor);
router.post('/appoint', jamee.appoint);
router.post('/delete', jamee.delete);



//--------Jamee--------//
//--------Ayaz--------//
router.post('/register-guardian', ayaz.register_guardian);
router.post('/login-guardian', ayaz.login_guardian);







//--------Ayaz--------//
//--------Shoaib--------//
router.post('/register-tutor', shadman.register_tutor);







//--------Shoaib--------//
//--------Newaz--------//
router.post('/update-student', nawaz.update_student);
router.post('/update-tutor', nawaz.update_tutor);







//--------Newaz--------//
module.exports = router;