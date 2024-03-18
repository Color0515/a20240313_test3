class LecturerMenu {
  int? id;
  String? pic;
  String? profession;
  String? name;
  List<CourseContent>? courseContent;

  LecturerMenu(
      {this.id, this.pic, this.profession, this.name, this.courseContent});

  LecturerMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pic = json['pic'];
    profession = json['profession'];
    name = json['name'];
    if (json['courseContent'] != null) {
      courseContent = <CourseContent>[];
      json['courseContent'].forEach((v) {
        courseContent!.add(new CourseContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['profession'] = this.profession;
    data['name'] = this.name;
    if (this.courseContent != null) {
      data['courseContent'] =
          this.courseContent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseContent {
  String? courseName;
  String? courseTime;

  CourseContent({this.courseName, this.courseTime});

  CourseContent.fromJson(Map<String, dynamic> json) {
    courseName = json['courseName'];
    courseTime = json['courseTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseName'] = this.courseName;
    data['courseTime'] = this.courseTime;
    return data;
  }
}
