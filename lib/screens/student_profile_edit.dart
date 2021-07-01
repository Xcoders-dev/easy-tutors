import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';

class EditStudentProfile extends StatefulWidget {
  final List<Student> student;
  EditStudentProfile([this.student]);

  @override
  _EditStudentProfileState createState() => _EditStudentProfileState();
}

class _EditStudentProfileState extends State<EditStudentProfile> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController conf_passController = TextEditingController();
  String response_err = "";
  String response_success = "";


  List<Student> getStudentInfo = [Student("", "", "","","")];

  Future <void> editStudent() async {
    var result = await http_post("update-student", {
      "FName": fNameController.text,
      "LName": lNameController.text,
      "email": widget.student[0].email,
      "updatedEmail": emailController.text,
      "password": passwordController.text,
      "phone_Num": phoneController.text,
    });

    if(result.data['success'] != null) {
      int i=0;
      setState(() {
        //getStudentInfo.clear() ;
        var in_users = result.data['success'] as List<dynamic>;

         in_users.forEach((in_user){
        //   getStudentInfo.add(Student(
        //     in_user['FName'],in_user['LName'],in_user['email'],
        //     in_user['password'],in_user['P_Num'],
        //   ));

           getStudentInfo[i].firstName =  in_user['FName'];
           getStudentInfo[i].lastName = in_user['LName'];
           getStudentInfo[i].email = in_user['email'];
           getStudentInfo[i].password =  in_user['password'];
           getStudentInfo[i].phoneNo = in_user['P_Num'];
           i++;

         });
      });
      print(getStudentInfo[0].email);
    }

    if (result.data['confirm'] != null) {
      setState(() {
        response_success = result.data['confirm'];
      });
    }
    if (result.data['status'] != null) {
      setState(() {
        print("setstate called");
        response_err = result.data['status'];
      });
    }
   if(response_success!="" && getStudentInfo[0].email != ""){
     Toast.show(response_success,context,duration: 3,textColor: Colors.lightGreen);
   Navigator.pop(context, getStudentInfo[0]);
    }else if(response_err!=""){
    Toast.show(response_err,context,duration: 3,textColor: Colors.redAccent);
    }else{
    Toast.show("Unresolved error",context,duration: 3,textColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.student[0].email);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("images/user.png"),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: fNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person_pin_outlined),
                              labelText: "First Name:*",
                              labelStyle: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                              hintText: '${widget.student[0].firstName}',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: lNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person_pin_outlined),
                              labelText: "Last Name:*",
                              labelStyle: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                              hintText: '${widget.student[0].lastName}',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              icon: Icon(Icons.phone_android_outlined),
                              labelText: "Phone:*",
                              labelStyle: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: '${widget.student[0].phoneNo}',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              icon: Icon(Icons.mail_outline),
                              labelText: "Email:*",
                              labelStyle: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: '${widget.student[0].email}',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              icon: Icon(Icons.security),
                              labelText: "Password:*",
                              labelStyle: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: '${widget.student[0].password}',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: conf_passController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              icon: Icon(Icons.security),
                              labelText: "Confirm Password:*",
                              labelStyle: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: '${widget.student[0].password}',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                              ),
                            ),
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(" "),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () => {
            if((fNameController.text == "")||(lNameController.text == "")||
                (emailController.text == "")||(passwordController.text == "")||
                (phoneController.text == "")){
              //Toast notific
              Toast.show("Please complete the form", context,duration: 3,textColor: Colors.redAccent),
            }else if(passwordController.text != conf_passController.text){
              //Toast notific
              Toast.show("Passwords do not match", context,duration: 3,textColor: Colors.redAccent),
            }else if(passwordController.text.length < 8){
              //Toast notific
              Toast.show("Password length should be at least 8 characters or more", context,duration: 3,textColor: Colors.redAccent),
            }else if(!(EmailValidator.validate(emailController.text))){
              Toast.show("Email address invalid", context,duration: 3,textColor: Colors.redAccent),
            }else if(phoneController.text.length < 11||phoneController.text.length > 11){
              Toast.show("Invalid phone number", context,duration: 3,textColor: Colors.redAccent),
            }else if((phoneController.text.contains("0",0)&&
                phoneController.text.contains("1",1)&&
                phoneController.text.contains("1",2)) == false){
              Toast.show("Invalid phone number\nValid format: 01123455432 ", context,duration: 3,textColor: Colors.redAccent),
            } else{
              editStudent(),
            }
          },
          label: Text('Edit Profile'),
          backgroundColor: Colors.indigo,
          icon: Icon(
            Icons.edit_rounded,
          )),
    );
  }
}
