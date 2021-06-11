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








//--------Shadman--------//
//--------Jamee--------//
router.post('/register-tutor', shadman.register_tutor);







//--------Jamee--------//
//--------Ayaz--------//
router.post('/register-tutor', shadman.register_tutor);







//--------Ayaz--------//
//--------Shoaib--------//
router.post('/register-tutor', shadman.register_tutor);







//--------Shoaib--------//
//--------Newaz--------//
router.post('/register-tutor', shadman.register_tutor);







//--------Newaz--------//
module.exports = router;