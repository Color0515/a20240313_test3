import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  final String teacherName;
  final String courseName;
  final String courseTime;

  const CourseDetailPage({
    super.key,
    required this.teacherName,
    required this.courseName,
    required this.courseTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$teacherName Teacher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Course Name: $courseName'),
            Text('Course Time: $courseTime'),
          ],
        ),
      ),
    );
  }
}
