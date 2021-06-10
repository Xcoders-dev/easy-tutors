import 'package:easy_tutor/screens/tutor_profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tutorProfile extends StatefulWidget {
  tutorProfile({Key key}) : super(key: key);

  @override
  _tutorProfileState createState() => _tutorProfileState();
}

class _tutorProfileState extends State<tutorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue[50],
          child: Column(
            children: [
              Card(
                child: Container(
                  color: Colors.blue[50],
                  padding: EdgeInsets.only(top: 30.0),
                  height: 300,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
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
                            height: 30,
                            child: ListTile(
                                leading: Icon(Icons.person_pin_outlined),
                                title: Transform.translate(
                                  offset: Offset(-16, 0),
                                  child: Text('Nur Hanifa'),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              leading: Icon(Icons.email_outlined),
                              title: Transform.translate(
                                offset: Offset(-16, 0),
                                child: Text('NurHanifa@gmail.com'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                                leading: Icon(
                                  Icons.pageview_rounded,
                                ),
                                title: Transform.translate(
                                  offset: Offset(-16, 0),
                                  child: Text('ID:0531568'),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  color: Colors.blue[50],
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "About Me",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Text(
                          "My greatest passion in life is teaching. I was born and raised in Sydney, and experienced great success at school and at university due to amazing and unforgettable teachers. This is the foundation of my commitment to helping out my students, whatever their abilities may be. Currently, I am studying a masters degree specializing in teaching elementary students with Autism Spectrum Disorders, rounding out my undergraduate background in primary education. I have been tutoring and teaching for 8 years in various settings – tutoring small and large groups, private individual tutoring, and teaching in rural, suburban, and urban classroom and home settings.\n\nI charge 30 per hour.\n\nI only tutor students at primary school level."),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Availablity",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Column(
                        children: [
                          availablity("Avilable Days         :",
                              "Sun,Mon,Tues,Wed,Thurs"),
                          availablity("Avilable Time From    :", "4.00 PM"),
                          availablity("Avilable Time To      :", "6.00 PM"),
                          availablity(
                              "Expected Salary        :", "20 RM Per hour"),
                          availablity(
                              "Location               :", "Skudai,Johor"),
                          availablity(
                              "Prefered Location      :", "Skudai,Johor"),
                          availablity("Tution Method             :",
                              "Online,Face-To-Face"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                  child: Text('Edit Profile'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTutorProfile())),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container availablity(lead, trail) {
    return Container(
        child: ListTile(
      leading: Icon(Icons.adjust_sharp),
      title: Text(lead),
      trailing: Text(trail),
    )
        // Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(lead),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(trail),
        //     )
        //   ],
        // ),
        );
  }
}
