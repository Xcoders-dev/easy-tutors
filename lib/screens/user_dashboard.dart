import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/screens/Tutor_request.dart';
import 'package:easy_tutor/screens/about_developer.dart';
import 'package:easy_tutor/screens/appointTutor.dart';
import 'package:easy_tutor/screens/confirmed_tutor_request.dart';
import 'package:easy_tutor/screens/ManageTutionRequest.dart';
import 'package:easy_tutor/screens/student_profile.dart';
import 'package:easy_tutor/screens/student_profile_edit.dart';
import 'package:flutter/material.dart';

class user_dashboard extends StatefulWidget {
  @override
  List <Student> student;
  user_dashboard([this.student]);

  _user_dashboardState createState() => _user_dashboardState();
}

class _user_dashboardState extends State<user_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Dashboard', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        centerTitle: true,
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
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/user.png"),
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
                                child: new Text(" ${widget.student[0].firstName} ${widget.student[0].lastName}"),
                                alignment: Alignment(-1.5, 0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              leading: Icon(Icons.email_outlined),
                              title: Align(
                                child: new Text("  ${widget.student[0].email}"),
                                alignment: Alignment(-1.95, 0),
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
                  "Tutor Request", Icons.group_add_sharp, context, 2),
              buildListTiledrawer("View Profile", Icons.edit_sharp, context, 3),
              buildListTiledrawer("Edit Profile", Icons.edit_sharp, context, 4),
              buildListTiledrawer(
                  "About", Icons.info_outline_rounded, context, 5),

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
                  onPressed: () => Navigator.popUntil(context,
                      ModalRoute.withName('ULogType')),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Welcome to Easy Tuition",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                  ),
                ),
              ),

              SizedBox(
                height: 60.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 350.0,
                height: 200.0,
                alignment: Alignment.center,
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => manageTutionRequest(widget.student)),
                          );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF002FFF), Color(0xFF74D0F7)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 55,
                            ),
                            alignment: Alignment.center,
                            child: Text("Manage  Requests".toUpperCase(),
                                style: TextStyle(fontSize: 21, color: Colors.white)),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointTutor(widget.student)),
                          );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF002FFF), Color(0xFF74D0F7)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 55,
                            ),
                            alignment: Alignment.center,
                            child: Text("Appoint".toUpperCase(),
                                style: TextStyle(fontSize: 21, color: Colors.white)),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Confiremd_tutor_request(widget.student))),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF002FFF), Color(0xFF74D0F7)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 55,
                            ),
                            alignment: Alignment.center,
                            child: Text("Confirmed".toUpperCase(),
                                style: TextStyle(fontSize: 21, color: Colors.white)),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  ListTile buildListTiledrawer(text, icon, BuildContext context, num) {
    return ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: () async {
          if (num == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tutor_request(widget.student)),
            );
          }
          if (num == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentProfile(widget.student)),
            );

          }
          if (num == 4) {
            Student returnData = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditStudentProfile(widget.student)),
            );
            if(returnData != null){
              setState(() => widget.student[0]  = returnData);
            }
          }
          if (num == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutDeveloper()),
            );
          }
        });
  }
}
