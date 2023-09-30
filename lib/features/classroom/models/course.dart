import 'dart:convert';

class Course {
  final String id;
  final String name;
  final String teacher;
  final String backgroud;
  final String code;
  Course({
    required this.id,
    required this.code,
    required this.name,
    required this.teacher,
    required this.backgroud,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'teacher': teacher,
      'backgroud': backgroud,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] as String,
      code: map['code'] as String,
      name: map['name'] as String,
      teacher: map['teacher'] as String,
      backgroud: map['backgroud'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);
}
