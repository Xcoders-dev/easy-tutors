import 'package:easy_tutor/model/tutionRequest.dart';


class Student {
  int studentID;
  String firstName;
  String lastName;
  //authentication
  String email;
  String password;

  String phoneNo;

  //TutionRequest request;

  Student(
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNo,

  );

  Student.copy(Student from)
      : this(from.firstName, from.lastName, from.email, from.password,
            from.phoneNo);

//   void setProfile(String fn, String ln, String mail, String phone){
//     firstName= fn;
//     lastName = ln;
//     email = mail;
//     phoneNo = phone;
//   }

//   void setAll(String fn, String ln, String mail, String pas, String phone) {
//     firstName = fn;
//     lastName = ln;
//     email = mail;
//     password = pas;
//     phoneNo = phone;
//   }

//   //! SQL command for registration
//   void registrationStudent(
//       String fn, String ln, String mail, String pas, String phone) {
//       //? dummy data
//       String dbemail = "em@EM.com";
//       if(dbemail == mail ){

//       }else{
//       }
//   }

//   //! SQL command for LogIn and retriving all data for login
//   Student loginStudent(String mail, String pass) {
//     Student tempStud;
//     //? dummy data
//     String dbmail = "em@EM";
//     String dbpass = "PASS";
//     //? store in temp Student obj

//     if (mail == dbmail && pass == dbpass) {
//     setAll('jamee', 'shahriyar', mail, pass, "012324456");
//     }
//     return tempStud;
//   }

// //! SQL command for updating student profile

//  void updateStudentProfile(String fn, String ln, String mail, String phone){

//    //? dummy data
//     String dbemail = "em@EM.com"; // duplicate email in DB
//     String dbphNUM = "01234"; // duplicate phone_Num in DB

//     if (dbemail == mail) {
//       //Unsuccess notification pop-up
//     } else if (dbphNUM == phone) {
//       //Unsuccess notification pop-up
//     } else {

//       setProfile(fn, ln, mail, phone);
//     }

//  }
}
