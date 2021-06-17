import 'package:easy_tutor/model/student.dart';
import 'package:flutter/material.dart';

class Confiremd_tutor_request extends StatefulWidget {
  @override
  final List <Student> student;
  Confiremd_tutor_request([this.student]);
  _Confiremd_tutor_requestState createState() => _Confiremd_tutor_requestState();
}

class _Confiremd_tutor_requestState extends State<Confiremd_tutor_request> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Confirmed Tutor Requests',
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
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Tutor name: Katherine '),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'View Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.deepPurpleAccent[700],
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0,top:4.0 ,
                        bottom:2.0, right: 2.0),
                    child: Text('Job ID: 5023'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('Category: Face to face'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('City: Johor Bahru'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('Salary: RM300'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('Time: 7:00 - 9:00'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('Subject:  Biology'),
                  ),
                ],
              ),
              //onTap: () {}
            ),
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5),
    );
  }
}