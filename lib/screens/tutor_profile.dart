import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/tutor_profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class tutorProfile extends StatefulWidget {
  List<Tutor> tutor;
  tutorProfile([this.tutor]);
  @override
  _tutorProfileState createState() => _tutorProfileState();
}

class _tutorProfileState extends State<tutorProfile> {
  Tutor getTutor;

  Future<void> showTutor() async {
    var result = await http_get('tutor-profile/${widget.tutor[0].email}');
    if (result.data['tutor'] != null) {
      setState(() {
        var in_Req = result.data['tutor'][0];

        getTutor = Tutor(
          in_Req['FName'],
          in_Req['LName'],
          in_Req['email'],
          in_Req['password'],
          in_Req['P_Num'],
          in_Req['gender'],
          in_Req['pref_city'],
          in_Req['expected_Sal'],
          in_Req['about_me'],
          in_Req['avail_time_from'],
          in_Req['avail_time_to'],
        );
        print(in_Req);
        print(getTutor);
      });
      print('Data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("WidgetsBinding");
    // });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showTutor();
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.tutor[0].email);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: showTutor,
        child: SingleChildScrollView(
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
                                    child: Text(
                                        '${getTutor.firstName} ${getTutor.lastName}'),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListTile(
                                leading: Icon(Icons.email_outlined),
                                title: Transform.translate(
                                  offset: Offset(-16, 0),
                                  child: Text('${getTutor.email}'),
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
                                    child: Text('${getTutor.phoneNo}'),
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
                        Text("${getTutor.aboutMe}"),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     "Availablity",
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 20),
                        //   ),
                        // ),
                        Column(
                          children: [
                            availablity("Avilable Time From    :",
                                '${getTutor.availTimeFrom}'),
                            availablity("Avilable Time To      :",
                                '${getTutor.availTimeTo}'),
                            availablity("Expected Salary        :",
                                '${getTutor.expectedSal}'),
                            availablity("Prefered Location      :",
                                '${getTutor.prefCity}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
