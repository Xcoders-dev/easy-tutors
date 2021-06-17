import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/student_profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class StudentProfile extends StatefulWidget {
  final List<Student> student;
  StudentProfile([this.student]);
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Student getStudent;

  Future<void> showStudent() async {
    var result = await http_get('student-profile/${widget.student[0].email}');
    if (result.data['student'] != null) {
      setState(() {
        var in_Req = result.data['student'][0];

        getStudent = Student(
          in_Req['FName'],
          in_Req['LName'],
          in_Req['email'],
          in_Req['password'],
          in_Req['P_Num'],
        );
        print(in_Req);
        print(getStudent);
      });
      print('Data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("WidgetsBinding");
    // });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: showStudent,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListTile(
                          leading: Icon(Icons.person_pin_outlined),
                          title: Transform.translate(
                            offset: Offset(-16, 0),
                            child: Text('${getStudent.firstName}'
                                ' ${getStudent.lastName}'),
                          )),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Transform.translate(
                          offset: Offset(-16, 0),
                          child: Text('${getStudent.email}'),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 50,
                    //   child: ListTile(
                    //       leading: Icon(
                    //         Icons.pageview_rounded,
                    //       ),
                    //       title: Transform.translate(
                    //         offset: Offset(-16, 0),
                    //         child: Text('ID:0531568'),
                    //       )),
                    // ),
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        leading: Icon(Icons.phone_callback_outlined,
                            color: Color.fromRGBO(230, 92, 0, 100)),
                        title: Transform.translate(
                          offset: Offset(-16, 0),
                          child: Text('${getStudent.phoneNo}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () => Navigator.pop(context),
          label: Text('Back'),
          backgroundColor: Colors.indigo,
          icon: Icon(
            Icons.edit_rounded,
          )),
    );
  }
}
