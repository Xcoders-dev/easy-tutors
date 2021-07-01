import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:easy_tutor/screens/sievePage.dart';
import 'package:toast/toast.dart';

class JobBoardScreen extends StatefulWidget {
  List <Tutor> tutor;
  JobBoardScreen([this.tutor]);
  @override
  _JobBoardScreenState createState() => _JobBoardScreenState();
}

class _JobBoardScreenState extends State<JobBoardScreen> {
  List<TutionRequest> getTuitionReq = [];
  List<Student> getStudInfo = [];
  List in_ApplyStatusReq=[];
  List buttonName =[];
  List<Color>buttonClr =[];
  String studentEmail ="";
  int tuitionID;

  Future<void> showTuitionReq()async{
    var result = await http_post('showTuitionReq',{
      "email": widget.tutor[0].email,
    });
    if(result.data['success_1'] != null)
    {
      setState(() {
        getTuitionReq.clear();
        getStudInfo.clear();
        var in_Req = result.data['success_1'] as List<dynamic>;
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
     in_ApplyStatusReq = result.data['success_2'] as List<dynamic>;
     buttonName.clear();
     in_ApplyStatusReq.forEach((in_ApplyStatusReq)=>{
       if(in_ApplyStatusReq == 0){
         setState(()=>{
          buttonName.add("Apply"),
         }),
     }else{
         setState(()=>{
           buttonName.add("Applied"),
         }),
       }
     });
     buttonClr.clear();
    in_ApplyStatusReq.forEach((in_ApplyStatusReq)=>{
      if(in_ApplyStatusReq == 0){
        setState(()=>{
          buttonClr.add(Colors.lightBlue) ,
        }),
      }else{
        setState(()=>{
          buttonClr.add(Colors.pink),
        }),
      }
    });

      print(in_ApplyStatusReq);
      print(buttonName);
  }
    void applyTuitionReq()async{
    var result = await http_post('applyTuitionReq', {
      "studEmail": studentEmail,
      "tutorEmail": widget.tutor[0].email,
      "tuitionReq_ID": tuitionID,
    });
    if(result.data['success'] != null){
      Toast.show(result.data["success"],context,duration: 3,textColor: Colors.lightGreen);
      showTuitionReq();
    }else if(result.data["status"]!=null){
      Toast.show(result.data["status"],context,duration: 3,textColor: Colors.redAccent);
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
        body: RefreshIndicator(
          onRefresh: showTuitionReq,
          child:     ListView.separated(
              itemBuilder: (context, index) => Card(
                elevation: 2.0,
                child: ListTile(
                    title: Text('Student Name: ${getStudInfo[index].firstName} ${getStudInfo[index].lastName} '),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Category: ${getTuitionReq[index].category}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('City: ${getTuitionReq[index].city}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Salary: ${getTuitionReq[index].salary}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Days per week: ${getTuitionReq[index].daysWeekly}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Subject: ${getTuitionReq[index].subject}'),
                        ),
                      ],
                    ),
                    trailing: FlatButton(
                      onPressed:()=>{
                        if(in_ApplyStatusReq[index] == 0){
                          studentEmail=getTuitionReq[index].studentEmail,
                          tuitionID= getTuitionReq[index].id,
                          applyTuitionReq(),
                        }else{
                        Toast.show("You have already applied for this job",context,duration: 3,),
                        }

                      },
                      child: Text(
                        buttonName[index],
                        style: TextStyle(color: Colors.white),
                      ),
                      color: buttonClr[index] ,
                    )
                  //onTap: () {}
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: getTuitionReq.length),
        ),
        floatingActionButton: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: Colors.indigo,
              onPressed: () => Navigator.pop(context),
              label: Text("Back"),
              icon: Icon(
                Icons.west
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
