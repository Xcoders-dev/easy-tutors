class TutionRequest{
  int id;
  String category;
  String daysWeekly;
  String city;
  String subject;
  String studentClass;
  String time;
  String salary;
  String tutorEmail;
  String studentEmail;
  bool statusStudent;
  
  

  TutionRequest(
    [this.id,this.category, this.daysWeekly, this.city,
    this.subject, this.salary,this.studentEmail,this.studentClass, this.time,
    this.tutorEmail, this.statusStudent,]
   );

  TutionRequest.copy(TutionRequest from): this(from.id, from.category, from.daysWeekly,
   from.city, from.subject, from.studentClass, from.time, from.salary,
   from.tutorEmail, from.studentEmail, from.statusStudent,);
   

  //  setTutionRequest(String id, String cat, String days, String _city, Str         ing sub,String studClass, String _time, String sal ){
  //     requestID = id;
  //     category = cat;
  //     daysWeekly = days;
  //     city= _city;
  //     subject = sub;
  //     studentClass = studClass;
  //     time  = _time;
  //     salary = sal;
  //  }

  //  void setTutorEmail(String e){
  //         tutorEmail = e;
  //         // might have to access sql command to enter into database
  //  }
    
  //  void setStudentEmail(String e){
  //    studentEmail = e;
  //         // might have to access sql command to enter into database
  //  } 

  //  void createTutionRequest(String id, String cat, String days, String _city,
  //  String sub,String studClass, String _time, String sal ){
  //       // SQL command to insert into TutionRequest table
  //       // ps.executeUpdate();
  //       setTutionRequest(id, cat, days, _city, sub, studClass, _time, sal);
  //  }

  //  List<TutionRequest> displayAllTutionRequest(){
  //    List<TutionRequest> tempArrayList ;
  //   return tempArrayList;
  //  }
   

}