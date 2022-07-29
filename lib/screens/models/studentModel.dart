// //polymorphism in dart
// Studnet class is a child class of the parent class User Model

import 'package:easy_tutor/screens/models/usermodel.dart';

class Student extends User {
  String grade;
  String subject;
  String salary;
  //constructor for the Student class
  Student(
      {this.grade,
      this.subject,
      this.salary,
      String email,
      String firstName,
      String lastName,
      String phone,
      String password,
      String address,
      String city,
      String state,
      String zip,
      String country,
      String image,
      String about,
      String status,
      String createdAt,
      String updatedAt,
      String id})
      : super(
            email: email,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            password: password,
            address: address,
            city: city,
            state: state,
            zip: zip,
            country: country,
            );

  @override
  String toJson() {
    return super.toJson();
  }

  
}
