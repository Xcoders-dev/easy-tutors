import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:easy_tutor/screens/sievePage.dart';

class JobBoardScreen extends StatefulWidget {
  List <Tutor> tutor;
  JobBoardScreen([this.tutor]);
  @override
  _JobBoardScreenState createState() => _JobBoardScreenState();
}

class _JobBoardScreenState extends State<JobBoardScreen> {
  List<TutionRequest> getTuitionReq = [];
  List<Student> getStudInfo = [];
  Future<void> showTuitionReq()async{
    var result = await http_get('showTuitionReq');
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
            in_Req['studentEmail'],
          ));
          getStudInfo.add(Student(
            in_Req['FName'],
            in_Req['LName'],
          ));
        });
      });
      print(getTuitionReq[0].studentEmail);
      print(getStudInfo[0].firstName);
    }
  }
  @override
  Widget build(BuildContext context) {
    print(widget.tutor[0].email);
    return Scaffold(
        appBar: AppBar(
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
                      onPressed: () {},
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SieveScreen())),
              label: Text("Filter"),
              icon: Icon(
                Icons.search,
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
