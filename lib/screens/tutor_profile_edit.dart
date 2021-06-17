import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class EditTutorProfile extends StatefulWidget {
  final List<Tutor> tutor;

  const EditTutorProfile({this.tutor});

  @override
  State<StatefulWidget> createState() {
    return _EditTutorProfileState();
  }
}

class _EditTutorProfileState extends State<EditTutorProfile> {
  TextEditingController emailController = TextEditingController();

  TextEditingController FNameController = TextEditingController();
  TextEditingController LNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController pref_cityController = TextEditingController();
  TextEditingController expected_SalController = TextEditingController();
  TextEditingController about_meController = TextEditingController();
  TextEditingController avail_time_fromController = TextEditingController();
  TextEditingController avail_time_toController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController salarytoController = TextEditingController();
  TextEditingController prefController = TextEditingController();

  String response_err = "";
  String response_success = "";

  editTutor() async {
    var result = await http_post("update-tutor", {
      "FName": FNameController.text,
      "LName": LNameController.text,
      "email": widget.tutor[0].email, // need to change
      "password": passwordController.text,
      "phone_Num": phoneController.text,
      "pref_city": pref_cityController.text,
      "expected_Sal": salarytoController.text,
      "about_me": about_meController.text,
      "avail_time_from": avail_time_fromController.text,
      "avail_time_to": avail_time_toController.text,
      "gender": "undefined"
    });
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
                  height: 660,
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
                          // image: DecorationImage(
                          //     // image: NetworkImage(
                          //     //     'https://googleflutter.com/sample_image.jpg'),
                          //     fit: BoxFit.fill),
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
                          SizedBox(
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                  leading: Icon(
                                    Icons.pageview_rounded,
                                  ),
                                  title: Transform.translate(
                                    offset: Offset(-16, 0),
                                    child: Text('ID:0531568'),
                                  )),
                            ),
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
                                    controller: FNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person_pin_outlined),
                                      labelText: "First Name:*",
                                      labelStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
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
                                    controller: LNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person_pin_outlined),
                                      labelText: "Last Name:*",
                                      labelStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
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
                          )
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
                          availablity("Avilable Time From:*",
                              avail_time_fromController),
                          availablity(
                              "Avilable Time To:*", avail_time_toController),
                          availablity("Expected Salary:*", salarytoController),
                          availablity("Location:*", locationController),
                          availablity("Prefered Location:*", prefController),
                        ],
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
                                "Create Account",
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: "Brand Bold"),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(23.0),
                          ),
                          onPressed: () => {
                                editTutor(),
                              }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
