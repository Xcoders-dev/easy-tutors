import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils{
  static Future openLink({String url}) => _launchUrl(url);

  static Future _launchUrl(String url)async {
    if(await canLaunch(url)){
      await launch(url);
    }
  }
}

class Confiremd_tutor_request extends StatefulWidget {
  @override
  final List <Student> student;
  Confiremd_tutor_request([this.student]);
  _Confiremd_tutor_requestState createState() => _Confiremd_tutor_requestState();
}

class _Confiremd_tutor_requestState extends State<Confiremd_tutor_request> {
  List<TutionRequest> getTuitionReq = [];
  List<Tutor> getTutorInfo = [];
  String status_text = "";

  Future<void> showAppointedTuitionReq()async{
    var result = await http_post('showAppointedTuitionReq',{
      "studentEmail": widget.student[0].email,
    });
    if(result.data['success'] != null)
    {
      setState(() {
        getTuitionReq.clear();
        getTutorInfo.clear();
        var in_Req = result.data['success'] as List<dynamic>;
        in_Req.forEach((in_Req){
          getTuitionReq.add(TutionRequest(
            in_Req['id'],
            in_Req['category'],
            in_Req['daysWeekly'],
            in_Req['city'],
            in_Req['subject'],
            in_Req['salary'],
            in_Req['studentEmail'],
          ));
          getTutorInfo.add(Tutor(
            in_Req['FName'],
            in_Req['LName'],
          ));
        });
      });
      print(getTuitionReq.length);
      print(getTuitionReq[0].studentEmail);
      print(getTutorInfo.length);
      print(getTutorInfo[0].firstName);

    }else if(result.data["status"] != null){
      setState(() {
        status_text= result.data["status"];
        getTuitionReq.clear();
        getTutorInfo.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    print(widget.student[0].email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Column(
          children: <Widget>[
            Text(
              'Confirmed Jobs',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                status_text,
                style: TextStyle(fontSize: 12,),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: showAppointedTuitionReq,
        child:
        ListView.separated(
            itemBuilder: (context, index) => Card(
              elevation: 2.0,
              child: ListTile(
                title: Text('Tutor Name: ${getTutorInfo[getTutorInfo.length-(index+1)].firstName} ${getTutorInfo[getTutorInfo.length-(index+1)].lastName}'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Category: ${getTuitionReq[getTuitionReq.length-(index+1)].category}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Category: ${getTuitionReq[getTuitionReq.length-(index+1)].city}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Salary: ${getTuitionReq[getTuitionReq.length-(index+1)].salary}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Days per week: ${getTuitionReq[getTuitionReq.length-(index+1)].daysWeekly}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Subject: ${getTuitionReq[getTuitionReq.length-(index+1)].subject}'),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(

                        onPressed: ()=>{
                          Utils.openLink(url:'https://pages.razorpay.com/pl_HSSqMabuDvlLSS/view'),
                        },
                        child: Text('Proceed to payment', style: TextStyle(color: Colors.white),),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                //onTap: () {}
              ),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: getTuitionReq.length),
      ),
    );
  }
}