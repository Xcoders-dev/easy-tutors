import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class EditTutorProfile extends StatefulWidget {
  final List<Tutor> tutor;
  const EditTutorProfile([this.tutor]);

  @override
  State<StatefulWidget> createState() {
    return _EditTutorProfileState();
  }
}

class _EditTutorProfileState extends State<EditTutorProfile> {


  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conf_passController = TextEditingController();

  TextEditingController about_meController = TextEditingController();
  TextEditingController avail_time_fromController = TextEditingController();
  TextEditingController avail_time_toController = TextEditingController();
  TextEditingController expected_SalController = TextEditingController();
  TextEditingController preferredLocationController = TextEditingController();



  String response_err = "";
  String response_success = "";

  List<Tutor> getTutorInfo = [Tutor("","","","","","","","","","")];

  Future <void> editTutor() async {
    var result = await http_post("update-tutor", {
      "FName": fNameController.text,
      "LName": lNameController.text,
      "email": widget.tutor[0].email, // need to change
      "updatedEmail": emailController.text,
      "password": passwordController.text,
      "phone_Num": phoneController.text,
      "pref_city": (preferredLocationController.text!="")?preferredLocationController.text: widget.tutor[0].prefLocation,
      "expected_Sal": (expected_SalController.text!="")? expected_SalController.text: widget.tutor[0].expectedSal,
      "about_me": (about_meController.text!="")?about_meController.text : widget.tutor[0].aboutMe,
      "avail_time_from": (avail_time_fromController.text!="")?avail_time_fromController.text: widget.tutor[0].availTimeFrom,
      "avail_time_to": (avail_time_toController.text!="")?avail_time_toController.text: widget.tutor[0].availTimeTo,
      // "pref_city": preferredLocationController.text,
      // "expected_Sal": expected_SalController.text,
      // "about_me": about_meController.text,
      // "avail_time_from": avail_time_fromController.text,
      // "avail_time_to": avail_time_toController.text,
    });
    if(result.data['success'] != null) {
      int i=0;
      setState(() {
        //getStudentInfo.clear() ;
        var in_users = result.data['success'] as List<dynamic>;

        in_users.forEach((in_user){

          getTutorInfo[i].firstName =  in_user['FName'];
          getTutorInfo[i].lastName = in_user['LName'];
          getTutorInfo[i].email = in_user['email'];
          getTutorInfo[i].password =  in_user['password'];
          getTutorInfo[i].phoneNo = in_user['P_Num'];
          getTutorInfo[i].aboutMe = in_user['about_me'];
          getTutorInfo[i].availTimeFrom = in_user['avail_time_from'];
          getTutorInfo[i].availTimeTo = in_user['avail_time_to'];
          getTutorInfo[i].expectedSal = in_user['expected_Sal'];
          getTutorInfo[i].prefLocation = in_user['pref_city'];
          i++;

        });
      });
      print(getTutorInfo[0].email);
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
    if(response_success!="" && getTutorInfo[0].email != ""){
      Toast.show(response_success,context,duration: 3,textColor: Colors.lightGreen);
      Navigator.pop(context, getTutorInfo[0]);
    }else if(response_err!=""){
      Toast.show(response_err,context,duration: 3,textColor: Colors.redAccent);
    }else{
      Toast.show("Unresolved error",context,duration: 3,textColor: Colors.redAccent);
    }
    //print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue[50],
          child: Column(
            children: [
              Card(
                child: Container(
                  color: Colors.blue[50],
                  padding: EdgeInsets.only(top: 30.0),
                  height: 850,
                  alignment: Alignment.center,
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
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(

                                    controller: fNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person_pin_outlined),
                                      labelText: "First Name:*",
                                      labelStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                      hintText: '${widget.tutor[0].firstName}',
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
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: lNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person_pin_outlined),
                                      labelText: "Last Name:*",
                                      labelStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                      hintText: '${widget.tutor[0].lastName}',
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
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.phone_callback_outlined),
                                      labelText: "Phone no:*",
                                      labelStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintText: '${widget.tutor[0].phoneNo}',
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
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.email_outlined),
                                      labelText: "Email Address:*",
                                      labelStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintText: '${widget.tutor[0].email}',
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
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
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
                                      hintText: '${widget.tutor[0].password}',
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
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
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
                                      hintText: '${widget.tutor[0].password}',
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
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 300,
                  color: Colors.blue[50],
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              "About Me",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "(Write a short description about your pasion, educational background and tutor qualifications.)",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextField(
                          controller: about_meController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: '${widget.tutor[0].aboutMe}',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 350,
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Availablity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "(Enter all the necessary info)",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12.0),
                        ),
                      ),
                      Column(
                        children: [
                          availablity("Avilable Time From:",
                              avail_time_fromController),
                          availablity(
                              "Avilable Time To:", avail_time_toController),
                          availablity("Expected Salary:", expected_SalController),
                          availablity("Location:", preferredLocationController),

                        ],
                      ),
                    ],
                  ),
                ),
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
              Toast.show("Some required fields missing", context,duration: 3,textColor: Colors.redAccent),
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
              editTutor(),
            }
          },
          label: Text('Edit Profile'),
          backgroundColor: Colors.indigo,
          icon: Icon(
            Icons.edit_rounded,
          )),
    );
  }

  Container availablity(lead, controller) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "${lead}",
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
              ),
              style: TextStyle(fontSize: 13.0),
            ),
          ),
        ],
      ),
    );
  }
}
