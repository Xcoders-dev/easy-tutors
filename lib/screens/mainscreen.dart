import 'package:flutter/material.dart';
import 'package:easy_tutor/Screens/userLoginTypeScreen.dart';

import 'guardianRegistrationScreen.dart';
import 'tutorRegistrationScreen.dart';

class MainScreen extends StatelessWidget {
  static const String idScreen = "mainScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 350.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                "Hire the right tutor today!",
                style: TextStyle(
                  fontSize: 23.0,
                  fontFamily: "Brand Bold",
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),

                    SizedBox(
                      height: 25.0,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Hire a Tutor",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    GuardianRegistrationScreen()),
                          );
                        }),

                    SizedBox(
                      height: 25.0,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Become a Tutor",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    TutorRegistrationScreen()),
                          );
                        })
                  ],
                ),
              ),

              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => UserLoginTypeScreen()),
                  );
                },
                child: Text(
                  "Already have an Account? Login here.",
                  style: TextStyle(fontSize: 16.0, fontFamily: "Brand Bold"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
