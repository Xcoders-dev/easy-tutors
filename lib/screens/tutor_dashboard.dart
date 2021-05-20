import 'package:easy_tutor/screens/jobBoard.dart';
import 'package:easy_tutor/screens/tutionApplied.dart';
import 'package:easy_tutor/screens/tutorLoginScreen.dart';
import 'package:easy_tutor/screens/tutor_profile.dart';
import 'package:easy_tutor/screens/user_dashboard.dart';
import 'package:flutter/material.dart';

class tutor_dashboard extends StatefulWidget {
  @override
  _tutor_dashboardState createState() => _tutor_dashboardState();
}

class _tutor_dashboardState extends State<tutor_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          // actions: [
          //   Container(
          //     child: IconButton(
          //       icon: Icon(Icons.exit_to_app),
          //       onPressed: () {},
          //     ),
          //   ),
          // ],
        ),
        drawer: Drawer(
          child: Card(
            child: ListView(
              padding: EdgeInsets.all(1),
              children: <Widget>[
                Container(
                  height: 250,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                leading: Icon(Icons.person_pin_outlined),
                                title: Align(
                                  child: new Text("  Nur Fatima"),
                                  alignment: Alignment(-1.5, 0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                leading: Icon(Icons.email_outlined),
                                title: Align(
                                  child: new Text("Nurfatima@gmail.com"),
                                  alignment: Alignment(-1.95, 0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                leading: Icon(Icons.pageview_rounded),
                                title: Align(
                                  child: new Text("  ID:0531568"),
                                  alignment: Alignment(-1.5, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                buildListTiledrawer(
                    "Notification", Icons.notifications, context, 1),
                buildListTiledrawer(
                    "Job Board", Icons.group_add_sharp, context, 2),
                buildListTiledrawer(
                    "Edit Profile", Icons.edit_sharp, context, 3),
                buildListTiledrawer(
                    "About", Icons.info_outline_rounded, context, 4),
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: Text('Sign Out'),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TutorLoginScreen())),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6.0),
                        child: TextButton(
                            child: Text("Applied".toUpperCase(),
                                style: TextStyle(fontSize: 8)),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue[50]),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(0)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TutionAppliedScreen()),
                              );
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        child: TextButton(
                            child: Text("Confirmed".toUpperCase(),
                                style: TextStyle(fontSize: 8)),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue[50]),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(0)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))),
                            onPressed: () => null),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    "NoticeBoard",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  child: Card(
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.message),
                            title: Transform.translate(
                              offset: Offset(-16, 0),
                              child:
                                  Text('Nur Hafsa accepted your tutor request'),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.message),
                            title: Transform.translate(
                              offset: Offset(-16, 0),
                              child: Text('New jobs are posted'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      buildCardDashboard(
                          Icons.thumb_up, "1005", "Total Applied"),
                      buildCardDashboard(Icons.work, "2", "Live Tution Jobs"),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      buildCardDashboard(Icons.person_outline_outlined, "10",
                          "Happy Students"),
                      buildCardDashboard(Icons.rate_review_outlined, "4.75/5",
                          "Average Tutor Rating"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            heroTag: null,
            onPressed: () => Navigator.pop(context),
            label: Text('Back'),
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.keyboard_backspace,
            )));
  }

  Card buildCardDashboard(icon, first, second) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Icon(icon),
                Text(
                  '  ' + first,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Text("    " + second, style: TextStyle(fontSize: 10))
          ],
        ),
      ),
    );
  }

  ListTile buildListTiledrawer(text, icon, BuildContext context, num) {
    return ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: () {
          if (num == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobBoardScreen()),
            );
          }
        });
  }
}
