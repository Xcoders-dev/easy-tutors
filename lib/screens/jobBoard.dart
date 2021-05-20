import 'package:flutter/material.dart';
import 'package:easy_tutor/screens/sievePage.dart';

class JobBoardScreen extends StatefulWidget {
  @override
  _JobBoardScreenState createState() => _JobBoardScreenState();
}

class _JobBoardScreenState extends State<JobBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text(
                'Job Board',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'List of available jobs',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                            child: Text('City: Johor Bahru'),
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
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      )
                      //onTap: () {}
                      ),
                ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 7),
        floatingActionButton: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: Colors.indigo,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SieveScreen())),
              label: Text("Filter"),
              icon: Icon(
                Icons.search,
              ),
            ),
            // FloatingActionButton.extended(
            //     heroTag: null,
            //     onPressed: () => Navigator.pop(context),
            //     label: Text('Back'),
            //     backgroundColor: Colors.indigo,
            //     icon: Icon(
            //       Icons.keyboard_backspace,
            //     ))
          ],
        ));
  }
}
