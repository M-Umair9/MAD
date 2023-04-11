import 'package:flutter/material.dart';
import 'package:resume2/education_screen.dart';
import 'package:resume2/home_screen.dart';
import 'package:resume2/work_experience_screen.dart';
import 'package:resume2/skills_screen.dart';
import 'package:resume2/work_experience_screen.dart';

import 'education_screen.dart';
import 'home_screen.dart';
/*import 'package:resume_app/screens/education_screen.dart';
import 'package:resume_app/screens/home_screen.dart';
import 'package:resume_app/screens/skills_screen.dart';
import 'package:resume_app/screens/work_experience_screen.dart';*/

void main() {
  runApp(ResumeApp());
}

class ResumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/education': (BuildContext context) => EducationScreen(),
        '/work_experience': (BuildContext context) => WorkExperienceScreen(),
        '/skills': (BuildContext context) => SkillsScreen(),
      },
    );
  }
}

