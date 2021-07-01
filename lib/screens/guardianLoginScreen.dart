import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:easy_tutor/Screens/guardianRegistrationScreen.dart';
import 'package:toast/toast.dart';

class GuardianLoginScreen extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  State<StatefulWidget> createState() {
    return GuardianLoginScreenState();
  }
}
class GuardianLoginScreenState extends State<GuardianLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String response_err = "";
  List<Student>response_success = [];

  // ignore: non_constant_identifier_names
  Future <void> LoginGuardian() async {
    var result = await http_post("login-guardian", {
      "email": emailController.text,
      "password": passController.text,
    });
    if(result.data['success'] != null) {
      setState(() {
        response_success.clear() ;
        var in_users = result.data['success'] as List<dynamic>;
        in_users.forEach((in_user){
          response_success.add(Student(
              in_user['FName'],in_user['LName'],in_user['email'],
            in_user['password'],in_user['P_Num'],
          ));
        });
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => user_dashboard(response_success)));
      print(response_success[0].email);
    }
    else if(result.data['status'] != null){
      setState((){
        response_err = result.data['status'];
      });
      Toast.show(response_err,context,duration: 3,textColor: Colors.redAccent);
      print(response_err);
    }
    else{
      Toast.show("Unresolved error",context,duration: 3,textColor: Colors.redAccent);
    }
    result = null;
  }

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
                height: 200.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                "Login as a Guardian",
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
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Brand Bold",
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Brand Bold",
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
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
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed:()=>{
                          if((emailController.text == "")||(passController.text == ""))
                          {
                            Toast.show("Please complete the form", context,duration: 3,textColor: Colors.redAccent),
                          }else {
                            LoginGuardian(),
                          }
                        }
                                )
                  ],
                ),
              ),

              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => GuardianRegistrationScreen()),
                  );
                },
                child: Text(
                  "Do not have an Account? Register Here.",
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
