import 'package:easy_tutor/screens/models/usermodel.dart';

//polymorphism in dart
// Tutor class is a child class of the parent class User Model

class Tutor extends User {
  String age;
  String subject;
  //constructor for the Tutor class
  Tutor(
      {this.age,
      this.subject,
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
