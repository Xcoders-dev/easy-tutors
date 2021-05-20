import 'package:flutter/material.dart';

class TutionAppliedScreen extends StatefulWidget {
  @override
  _TutionAppliedScreenState createState() => _TutionAppliedScreenState();
}

class _TutionAppliedScreenState extends State<TutionAppliedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Jobs Applied',
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
                    title: Text('Student Name: Sam Smith'),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Category: Online tutoring'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Location: 25/11/A TouchStone'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Salary: 300 RM'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Days per week: 3'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Subject: Online tutoring'),
                        ),
                      ],
                    ),
                    trailing: FlatButton(
                      onPressed: () {},
                      child: Text('Undo Apply', style: TextStyle(color: Colors.white),),
                      color: Colors.deepPurpleAccent[700],
                    )
                    //onTap: () {}
                    ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5),
          
      
    );
  }
}