import 'package:flutter/material.dart';

class AboutDeveloper extends StatefulWidget {
  const AboutDeveloper({Key key}) : super(key: key);

  @override
  _AboutDeveloperState createState() => _AboutDeveloperState();
}

Widget shoaib = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          "Shoaib Hossain",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blueGrey[800],
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Age : 22  |  Gender : Male  |  Location : Dhaka",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    ),
  ),
);

Widget jamee = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          "Jamee Shariyar",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blueGrey[800],
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Age : 23  |  Gender : Male  |  Location : Dhaka",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    ),
  ),
);

Widget ayaz = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          "Ayaz Rahman",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blueGrey[800],
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Age : 23  |  Gender : Male  |  Location : Dhaka",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    ),
  ),
);

Widget sadman = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          "Shadman Rahman",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blueGrey[800],
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Age : 22  |  Gender : Obscure  |  Location : Dhaka",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    ),
  ),
);
Widget newaz = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          "Newaz Alam",
          style: TextStyle(
            fontSize: 28,
            color: Colors.blueGrey[800],
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Age : 23  |  Gender : Male  |  Location : Dhaka",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    ),
  ),
);

class _AboutDeveloperState extends State<AboutDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("About Developers"),
        centerTitle: true,
      ),
      body: (Column(
        children: <Widget>[shoaib, jamee, ayaz, sadman, newaz],
      )),
    );
  }
}
