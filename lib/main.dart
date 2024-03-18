import 'package:flutter/material.dart';
import 'AModel/lecturerMenu.dart';
import 'CourseDetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '講師清單',
      home: LecturerCardList(),
    );
  }
}

class LecturerCardList extends StatelessWidget {
  final List<Map<String, dynamic>> _items = [
    {
      "id": 0,
      "pic":"https://pic1.zhimg.com/v2-76d69d4852f1b33b72e8fa4aa64f048b_720w.jpg?source=172ae18b",
      "profession": "Demonstrator",
      "name": "Floyd Miles",
      "courseContent": [
        {"courseName": "基礎程式設計", "courseTime": "每周二,10:00~12:00"},
        {"courseName": "人工智慧總整與實作", "courseTime": "每周四,14:00~16:00"},
        {"courseName": "訊號與系統", "courseTime": "每周五,10:00~12:00"}
      ]
    },
    {
      "id": 1,
      "pic":"https://pic1.zhimg.com/v2-76d69d4852f1b33b72e8fa4aa64f048b_720w.jpg?source=172ae18b",
      "profession": "Lecturer",
      "name": "John Doe",
      "courseContent": [
        {"courseName": "課程1", "courseTime": "每周二,10:00~12:00"},
        {"courseName": "課程2", "courseTime": "每周三,14:00~16:00"},
        {"courseName": "課程3", "courseTime": "每周四,10:00~12:00"}
      ]
    },
    {
      "id": 2,
      "pic":"https://pic1.zhimg.com/v2-76d69d4852f1b33b72e8fa4aa64f048b_720w.jpg?source=172ae18b",
      "profession": "Senior Lecturer",
      "name": "Jane Smith",
      "courseContent": [
        {"courseName": "課程1", "courseTime": "每周一,9:00~11:00"},
        {"courseName": "課程2", "courseTime": "每周二,15:00~17:00"}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecturer Cards'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final lecturerData = _items[index];
          final lecturer = LecturerMenu.fromJson(lecturerData);
          return LecturerCard(lecturer: lecturer);
        },
      ),
    );
  }
}

class LecturerCard extends StatelessWidget {
  final LecturerMenu lecturer;

  const LecturerCard({super.key, required this.lecturer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87), // 設置邊框顏色為黑色
          borderRadius: BorderRadius.circular(5), // 設置圓角半徑
        ),
        child: ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(lecturer.pic ?? ""),
          ),
          title: Text(lecturer.profession ?? '',style: TextStyle(color: Colors.grey),),
          subtitle: Text(lecturer.name ?? ''),
          childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          expandedCrossAxisAlignment: CrossAxisAlignment.end,
          maintainState: true,
          children: lecturer.courseContent!.map((course) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CourseDetailPage(
                      teacherName: lecturer.name??"",
                      courseName: course.courseName ?? '',
                      courseTime: course.courseTime ?? '',
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.calendar_today, size: 20,),
                trailing: Icon(Icons.arrow_forward_ios, size: 20,),
                title: Text(course.courseName ?? ''),
                subtitle: Text(course.courseTime ?? ''),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
