import 'package:easy_tutor/screens/student_profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({Key key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          child: Text('Nur Hanifa'),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      leading: Icon(Icons.email_outlined),
                      title: Transform.translate(
                        offset: Offset(-16, 0),
                        child: Text('NurHanifa@gmail.com'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                        leading: Icon(
                          Icons.pageview_rounded,
                        ),
                        title: Transform.translate(
                          offset: Offset(-16, 0),
                          child: Text('ID:0531568'),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      leading: Icon(Icons.phone_callback_outlined,
                          color: Color.fromRGBO(230, 92, 0, 100)),
                      title: Transform.translate(
                        offset: Offset(-16, 0),
                        child: Text('0234242342234'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditStudentProfile())),
          label: Text('Edit Profile'),
          backgroundColor: Colors.indigo,
          icon: Icon(
            Icons.edit_rounded,
          )),
    );
  }
}
