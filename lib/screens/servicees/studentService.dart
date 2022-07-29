import 'package:easy_tutor/screens/servicees/services.dart';

import '../../model/student.dart';
import '../../model/tutionRequest.dart';
import '../../modules/http.dart';

class StudentService extends Service{
     List<TutionRequest> getTuitionReq = [];
  List<Student> getStudInfo = [];
  int tuitionReqID;
  String studentFName="";
  String studentLName="";
  String status_text = "";

  Future<void> showAppliedTuitionReq()async{
    var result = await http_post('showAppliedTuitionReq',{
     // "tutorEmail": widget.tutor[0].email,
    });
    if(result.data['success'] != null)
    {
      (() {
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
         
        });
      });
      print(getTuitionReq.length);
      print(getTuitionReq[0].studentEmail);
      print(getStudInfo.length);
      print(getStudInfo[0].firstName);
    }
    else if(result.data['status'] != null){
     
        status_text = result.data['status'];
        getTuitionReq.clear();
        getStudInfo.clear();
   
    }
  }

  void undoAppliedTuitionReq()async{
    var result = await http_post('undoAppliedTuitionReq',{
    
      "tuitionReqID": tuitionReqID,
    });
    if(result.data['success'] != null){
    
      showAppliedTuitionReq();
    }else{
     
    }

  }

}