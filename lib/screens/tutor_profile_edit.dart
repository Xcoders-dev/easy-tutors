import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditTutorProfile extends StatefulWidget {
  EditTutorProfile({Key key}) : super(key: key);

  @override
  _EditTutorProfileState createState() => _EditTutorProfileState();
}

class _EditTutorProfileState extends State<EditTutorProfile> {
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
                  height: 660,
                  alignment: Alignment.center,
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
                      Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                  leading: Icon(
                                    Icons.pageview_rounded,
                                  ),
                                  title: Transform.translate(
                                    offset: Offset(-16, 0),
                                    child: Text('ID:0531568'),
                                  )),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 1.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person_pin_outlined),
                                      labelText: "Full Name:*",
                                      labelStyle: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 1.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.email_outlined),
                                      labelText: "Email Address:*",
                                      labelStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 1.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.phone_callback_outlined),
                                      labelText: "Phone no:*",
                                      labelStyle: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 300,
                  color: Colors.blue[50],
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              "About Me",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "(Write a short description about your pasion, educational background and tutor qualifications.)",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "(Enter all the necessary info)",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12.0),
                        ),
                      ),
                      Column(
                        children: [
                          availablity("Avilable Day:*"),
                          availablity("Avilable Time From:*"),
                          availablity("Avilable Time To:*"),
                          availablity("Expected Salary:*"),
                          availablity("Location:*"),
                          availablity("Prefered Location:*"),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container availablity(lead) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "${lead}",
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
              ),
              style: TextStyle(fontSize: 13.0),
            ),
          ),
        ],
      ),
    );
  }
}
