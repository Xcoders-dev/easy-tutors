import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditStudentProfile extends StatefulWidget {
  final List<Student> student;
  EditStudentProfile([this.student]);

  @override
  _EditStudentProfileState createState() => _EditStudentProfileState();
}

class _EditStudentProfileState extends State<EditStudentProfile> {
  TextEditingController FNameController = TextEditingController();
  TextEditingController LNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String response_err = "";
  String response_success = "";
  editStudent() async {
    var result = await http_post("update-student", {
      "FName": FNameController.text,
      "LName": LNameController.text,
      "email": widget.student[0].email, // need to change
      "password": passwordController.text,
      "phone_Num": phoneController.text,
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
                      image: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg'),
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
                  // SizedBox(
                  //   height: 45,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: ListTile(
                  //         leading: Icon(
                  //           Icons.pageview_rounded,
                  //         ),
                  //         title: Transform.translate(
                  //           offset: Offset(-16, 0),
                  //           child: Text('St ID: 0531568'),
                  //         )),
                  //   ),
                  // ),
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
                            controller: FNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person_pin_outlined),
                              labelText: "First Name:*",
                              labelStyle: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
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
                            controller: LNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person_pin_outlined),
                              labelText: "Last Name:*",
                              labelStyle: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
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
                  // Column(
                  //   children: [
                  //     SizedBox(
                  //       height: 1.0,
                  //     ),
                  //     Padding(
                  //       padding:
                  //           const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: TextField(
                  //            //controller: emailController,
                  //           keyboardType: TextInputType.emailAddress,
                  //           decoration: InputDecoration(
                  //             icon: Icon(Icons.email_outlined),
                  //             labelText: "Email Address:*",
                  //             labelStyle: TextStyle(
                  //               fontSize: 12.0,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //             hintStyle: TextStyle(
                  //               color: Colors.grey,
                  //               fontSize: 10.0,
                  //             ),
                  //           ),
                  //           style: TextStyle(fontSize: 13.0),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
                editStudent(),
              },
          label: Text('Edit Profile'),
          backgroundColor: Colors.indigo,
          icon: Icon(
            Icons.edit_rounded,
          )),
    );
  }
}
