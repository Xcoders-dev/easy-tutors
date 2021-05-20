import 'dart:ui';

import 'package:flutter/material.dart';

//! For Category sort
class Category {
  String title;
  String value;

  Category(this.title, this.value);
}

// list of class Category
List<Category> categories = [
  Category('Empty', ''),
  Category('Online', 'online'),
  Category('Face-to-Face', 'facetoface')
];

//! For DaysPerWeek sort
class DaysPerWeek {
  String title;
  String value;

  DaysPerWeek(this.title, this.value);
}

// List of class DaysPerWeek
List<DaysPerWeek> daysPerWeekList = [
  DaysPerWeek('Empty', ''),
  DaysPerWeek('1 day', '1day'),
  DaysPerWeek('2 days', '2days'),
  DaysPerWeek('3 days', '3days'),
  DaysPerWeek('4 days', '4days'),
  DaysPerWeek('5 days', '5days'),
  DaysPerWeek('6 days', '6days'),
  DaysPerWeek('7 days', '7days'),
];

//! For City sort
class City {
  String title;
  String value;

  City(this.title, this.value);
}

// List of class City
List<City> cities = [
  City('Empty', ''),
  City('Johor Bahru', 'jb'),
  City('Melacca City', 'mc'),
  City('Kuala Lampur', 'kl'),
  City('George Town', 'gt'),
  City('Kota Kinabalu', 'kk'),
  City('Alor Setar', 'as'),
  City('Shah Alam', 'sa'),
];

//! For Subject sort
class Subject {
  String title;
  String value;

  Subject(this.title, this.value);
}

// List of class Subject
List<Subject> subjects = [
  Subject('Empty', ''),
  Subject('Physics', 'phy'),
  Subject('Chemistry', 'chem'),
  Subject('Biology', 'bio'),
  Subject('Mathematics', 'math'),
  Subject('Computing', 'com'),
  Subject('Engineering', 'eng'),
  Subject('Ielts', 'ielts'),
  Subject('SAT', 'sat'),
];

class Class {
  String title;
  String value;

  Class(this.title, this.value);
}

// List of class City
List<Class> class_level = [
  Class('Empty', ''),
  Class('Kindergarten', 'KG'),
  Class('Class 1', 'C1'),
  Class('Class 2', 'C2'),
  Class('Class 3', 'C3'),
  Class('Class 4', 'C4'),
  Class('Class 5', 'C5'),
  Class('Class 6', 'C6'),
  Class('Class 7', 'C7'),
  Class('Class 8', 'C8'),
  Class('Class 9', 'C9'),
  Class('O-Level', 'O-L'),
  Class('A-Level', 'A-L'),
  Class('College', 'Colg'),
];

class tutor_request extends StatefulWidget {
  @override
  _tutor_requestState createState() => _tutor_requestState();
}

class _tutor_requestState extends State<tutor_request> {
  //! variables locally declared
  //? will be substituted by database
  String categoryValue = '';
  String daysPerWeekValue = '';
  String cityValue = '';
  String subjectValue = '';
  String classValue = '';

  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Request Tutor',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
                    child: Text(
                      'Category',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
                      elevation: 2.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(90.0, 2.0, 80.0, 2.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: categoryValue,
                          //? used to construct dropdown menu
                          items: categories
                              .map((Category category) => DropdownMenuItem(
                                    child: Text(category.title),
                                    value: category.value,
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              categoryValue = newValue;
                            });
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
                    child: Text(
                      'Days per Week',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
                      elevation: 2.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: daysPerWeekValue,
                          items: daysPerWeekList
                              .map(
                                  (DaysPerWeek daysPerWeek) => DropdownMenuItem(
                                        child: Text(daysPerWeek.title),
                                        value: daysPerWeek.value,
                                      ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              daysPerWeekValue = newValue;
                            });
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
                    child: Text(
                      'City',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
                      elevation: 2.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: cityValue,
                          items: cities
                              .map((City city) => DropdownMenuItem(
                                    child: Text(city.title),
                                    value: city.value,
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              cityValue = newValue;
                            });
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
                    child: Text(
                      'Subject',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
                      elevation: 2.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: subjectValue,
                          items: subjects
                              .map((Subject subject) => DropdownMenuItem(
                                    child: Text(subject.title),
                                    value: subject.value,
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              subjectValue = newValue;
                            });
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
                    child: Text(
                      'Class',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
                      elevation: 2.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: classValue,
                          items: class_level
                              .map((Class class_level) => DropdownMenuItem(
                                    child: Text(class_level.title),
                                    value: class_level.value,
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              classValue = newValue;
                            });
                          },
                        ),
                      )),
                  Card(
                    margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: _selectTime,
                              child: Text(
                                'Select Time',
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(height: 8),
                          Text(
                            'Selected time: ${_time.format(context)}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Container(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Salary here',
                                  hintText: 'RM 0.00',
                                ),
                                autofocus: false,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FloatingActionButton.extended(
                        onPressed: () => Navigator.pop(context),
                        label: Text('Upload Request'),
                        backgroundColor: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 1),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink400,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
