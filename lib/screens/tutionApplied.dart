import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class TutionAppliedScreen extends StatefulWidget {
  List <Tutor> tutor;
  TutionAppliedScreen([this.tutor]);
  @override
  _TutionAppliedScreenState createState() => _TutionAppliedScreenState();
}

class _TutionAppliedScreenState extends State<TutionAppliedScreen> {
  List<TutionRequest> getTuitionReq = [];
  List<Student> getStudInfo = [];
  int tuitionReqID;
  String studentFName="";
  String studentLName="";
  String status_text = "";

  Future<void> showAppliedTuitionReq()async{
    var result = await http_post('showAppliedTuitionReq',{
      "tutorEmail": widget.tutor[0].email,
    });
    if(result.data['success'] != null)
    {
      setState(() {
        getTuitionReq.clear();
        getStudInfo.clear();
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
          getStudInfo.add(Student(
            in_Req['FName'],
            in_Req['LName'],
          ));
        });
      });
      print(getTuitionReq.length);
      print(getTuitionReq[0].studentEmail);
      print(getStudInfo.length);
      print(getStudInfo[0].firstName);
    }
    else if(result.data['status'] != null){
      setState(() {
        status_text = result.data['status'];
        getTuitionReq.clear();
        getStudInfo.clear();
      });
    }
  }

  void undoAppliedTuitionReq()async{
    var result = await http_post('undoAppliedTuitionReq',{
      "tutorEmail": widget.tutor[0].email,
      "tuitionReqID": tuitionReqID,
    });
    if(result.data['success'] != null){
      Toast.show("Application for "+studentFName+" "+studentLName+" removed",context,duration: 3,textColor: Colors.lightGreen);
      showAppliedTuitionReq();
    }else{
      Toast.show("Unresolved error",context,duration: 3,textColor: Colors.redAccent);
    }

  }

  @override
  Widget build(BuildContext context) {
    print(widget.tutor[0].email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Column(
          children: <Widget>[
            Text(
              'Jobs Applied',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                status_text,
                style: TextStyle(fontSize: 12,),
              ),
            )
            
          ],
        ),
        centerTitle: true,
      ),
      body:RefreshIndicator(
        onRefresh: showAppliedTuitionReq,
        child:
            ListView.separated(
                itemBuilder: (context, index) => Card(
                  elevation: 2.0,
                  child: ListTile(
                      title: Text('Student Name: ${getStudInfo[getStudInfo.length-(index+1)].firstName} ${getStudInfo[getStudInfo.length-(index+1)].lastName}'),
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
                        ],
                      ),
                      trailing: FlatButton(
                        onPressed: ()=>{
                          tuitionReqID = getTuitionReq[getTuitionReq.length-(index+1)].id,
                          studentFName  = getStudInfo[getStudInfo.length-(index+1)].firstName,
                          studentLName  = getStudInfo[getStudInfo.length-(index+1)].lastName,
                          undoAppliedTuitionReq(),
                        },
                        child: Text('Undo Apply', style: TextStyle(color: Colors.black),),
                        color: Colors.red,
                      )
                    //onTap: () {}
                  ),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: getTuitionReq.length),
      ),


    );
  }
}