
class Tutor {
  int tutorID;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNo;
  String aboutMe;
  String availTimeFrom;
  String availTimeTo;
  String expectedSal;
  String prefLocation;

  Tutor([
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNo,
    this.aboutMe,
    this.availTimeFrom,
    this.availTimeTo,
    this.expectedSal,
    this.prefLocation,
  ]);

  Tutor.copy(Tutor from)
      : this(
          from.firstName,
          from.lastName,
          from.email,
          from.password,
          from.phoneNo,
          from.aboutMe,
          from.availTimeFrom,
          from.availTimeTo,
          from.expectedSal,
          from.prefLocation,
        );

  // void setTutorRegistration(String fn, String ln, String mail, String pas, String phone) {
  //   firstName = fn;
  //   lastName = ln;
  //   email = mail;
  //   password = pas;
  //   phoneNo = phone;
  // }

  // void setProfile(String f, String l, String mail, String phone, String pCity,
  //     String sal, String about, String timeFrom, String timeTo, String local) {
  //   firstName = f;
  //   lastName = l;
  //   email =mail;
  //   phoneNo = phone;
  //   prefCity = pCity;
  //   expectedSal = sal;
  //   aboutMe = about;
  //   availTimeFrom = timeFrom;
  //   availTimeTo = timeTo;
  //   location = local;
  // }

  // void setAll(
  //     String fn, String ln, String mail, String pas, String phone, String _gender,
  //     String pCity, String sal, String about, String timeFrom, String timeTo, String local) {
  //   firstName = fn;
  //   lastName = ln;
  //   email = mail;
  //   password = pas;
  //   phoneNo = phone;
  //   gender = _gender;
  //   prefCity = pCity;
  //   expectedSal = sal;
  //   aboutMe = about;
  //   availTimeFrom = timeFrom;
  //   availTimeTo = timeTo;
  //   location = local;
  // }

  // void registrationTutor(
  //     String fn, String ln, String mail, String pas, String phone) {
  //   //? dummy data
  //   String dbemail = "em@EM.com";
  //   if (dbemail == mail) {
  //     //Unsuccessful notification pop-up
  //   } else {
  //   }
  // }

  // void updateTutorProfile(String fn, String ln, String mail, String phone, String pCity, String sal,
  //     String about, String timeFrom, String timeTo, String local) {
  //   //? dummy data
  //   String dbemail = "em@EM.com"; // duplicate email in DB
  //   String dbphNUM = "01234"; // duplicate phone_Num in DB
  //   if (dbemail == mail) {
  //     //Unsuccess notification pop-up
  //   } else if (dbphNUM == phone) {
  //     //Unsuccess notification pop-up
  //   } else {
  //     setProfile(
  //         fn, ln, mail, phone, pCity, sal, about, timeFrom, timeTo, local);
  //   }
  // }

  // //! SQL command for retriving all data for login
  // Tutor loginTutor(String mail, String pass) {
  //   Tutor tempTutor;
  //    //? dummy data
  //   String dbmail = "em@EM";
  //   String dbpass = "PASS";
  //   //? store in temp Student obj
  //   if (mail == dbmail && pass == dbpass) {
  //     setAll('Shadman', 'Rahman', mail, pass, '234234243', 'male', 'Johor',
  //         '300', 'sadadasdaasdasd', '6:00', '10:00', 'Johor');
  //   }
  //   return tempTutor;
  // }
}
