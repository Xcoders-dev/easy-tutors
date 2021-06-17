import 'package:easy_tutor/screens/mainscreen.dart';
import 'package:easy_tutor/screens/student_profile.dart';
import 'package:easy_tutor/screens/student_profile_edit.dart';
import 'package:easy_tutor/screens/tutor_dashboard.dart';
import 'package:easy_tutor/screens/tutor_profile.dart';
import 'package:easy_tutor/screens/user_dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "flutter_navigation_sample",
    theme: ThemeData(primarySwatch: Colors.pink),
    // home: user_dashboard()));
    home: tutorProfile()));
