import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class manageTutionRequest extends StatefulWidget {
  
final List <Student> student;
  manageTutionRequest([this.student]);
  @override
  _manageTutionRequestState createState() => _manageTutionRequestState();
}

class _manageTutionRequestState extends State<manageTutionRequest> {
   List<TutionRequest> getTuitionReq = [];
    Future<void> showTuitionReq() async {
    var result = await http_post("display-Tuition-Requests", {
      "studEmail": widget.student[0].email,      
    }
    );
    if(result.data['success'] != null)
    {
      setState(() {
        getTuitionReq.clear();
        var in_Req = result.data['success'] as List<dynamic>;
        in_Req.forEach((in_Req){
          getTuitionReq.add(TutionRequest(
            in_Req['id'],
            in_Req['category'],
            in_Req['daysWeekly'],
            in_Req['city'],
            in_Req['subject'],
            in_Req['salary'],
            in_Req[widget.student[0].email],   
            in_Req['studentClass'],
            in_Req['time'],
                      
          ));          
        });
      });      
    }
  }

  String response= "";
  Future<void> deleteTuitionReq(int id) async {
    var result = await http_post("delete-Tuition-Request", {
      "stEmail": widget.student[0].email,
      "tutionReqID" : id.toString(),      
    });

    if(result.data['confirmation'] != null){
      setState((){
        response = result.data['confirmation'];
      });
      print(response);
    }
    if(response !=""){
    Toast.show(response,context,duration: 3,textColor: Colors.lightGreen);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
          title: Column(
            children: <Widget>[
              Text(
                'Manage Tutor Request',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh:  showTuitionReq,
          child:     ListView.separated(
              itemBuilder: (context, index) => 
              Card(
                elevation: 2.0,
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  key: ObjectKey(getTuitionReq[index]),
                  onDismissed: (direction) {                     
                    deleteTuitionReq(getTuitionReq[index].id);
                    setState(() {
                       getTuitionReq.removeAt(index);
                    });
                    },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 30.0 , vertical: 30.0),
                    color: Colors.red,
                    child: Icon(Icons.delete_forever_sharp, color:  Colors.white, size: 35.0,)
                  
                  ),
                                  child: ListTile(
                      title: Text('Subject: ${getTuitionReq[index].subject} '),
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
                            child: Text('Days Weekly: ${getTuitionReq[index].daysWeekly}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('City: ${getTuitionReq[index].city}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('Student class: ${getTuitionReq[index].studentClass}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('Time: ${getTuitionReq[index].time}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('Salary: ${getTuitionReq[index].salary}'),
                          ),  
                          
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Text('Swipe to Delete'),
                          Icon(Icons.arrow_back_rounded,size: 30.0,)
                        ],
                      ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: getTuitionReq.length),
        ),        
    );
  }
}