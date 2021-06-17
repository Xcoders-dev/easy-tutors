import 'package:easy_tutor/model/tutor.dart';
import 'package:flutter/material.dart';

class Confirmed_jobs extends StatefulWidget {
  List <Tutor> tutor;
  Confirmed_jobs([this.tutor]);
  @override
  _Confirmed_jobsState createState() => _Confirmed_jobsState();
}

class _Confirmed_jobsState extends State<Confirmed_jobs> {
  @override
  Widget build(BuildContext context) {
    print(widget.tutor[0].email);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Confirmed Jobs',
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
                  title: Text('Student name: Abdul Hamid'),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 2.0, top: 4.0, bottom: 2.0, right: 2.0),
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
                        child: Text('Subject: Human Biology'),
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
