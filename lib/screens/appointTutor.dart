import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/screens/tutor_profile.dart';
import 'package:flutter/material.dart';

class AppointTutor extends StatefulWidget {
  @override
final List <Student> student;
  AppointTutor([this.student]);

  _AppointTutorState createState() => _AppointTutorState();
}

class _AppointTutorState extends State<AppointTutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Appoint Tutor',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Card(
                elevation: 2.0,
                child: ListTile(
                  title: Text('Tutor name: John Doe'),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text('Category: Face to Face'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text('City: Johor'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text('Phone: +06234242422'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Reject',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.red,
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Accept',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.green,
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: FlatButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tutorProfile())),
                    child: Text(
                      'View Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurpleAccent[700],
                  ),
                  //onTap: () {}
                ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5),
    );
  }
}
