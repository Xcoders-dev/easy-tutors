import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// user model class
class User {
  String email;
  String firstName;
  String lastName;
  String phone;
  String address;
  String city;
  String state;
  String country;
  String zip;
  String password;
  String confirmPassword;
  User({
     this.email,
     this.firstName,
     this.lastName,
     this.phone,
     this.address,
     this.city,
     this.state,
     this.country,
     this.zip,
     this.password,
     this.confirmPassword,
  });


  User copyWith({
    String email,
    String firstName,
    String lastName,
    String phone,
    String address,
    String city,
    String state,
    String country,
    String zip,
    String password,
    String confirmPassword,
  }) {
    return User(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zip: zip ?? this.zip,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'zip': zip,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      zip: map['zip'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address, city: $city, state: $state, country: $country, zip: $zip, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.phone == phone &&
      other.address == address &&
      other.city == city &&
      other.state == state &&
      other.country == country &&
      other.zip == zip &&
      other.password == password &&
      other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phone.hashCode ^
      address.hashCode ^
      city.hashCode ^
      state.hashCode ^
      country.hashCode ^
      zip.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode;
  }
}
