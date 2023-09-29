import 'package:uuid/uuid.dart';

class RegisterData {
  final String id;

  final String name;

  final DateTime birthDate;

  final String experienceLevel;

  final List<String> preferredLanguage;

  final int experienceTime;

  final double salary;

  RegisterData(
      {String? id,
      required this.name,
      required this.birthDate,
      required this.experienceLevel,
      required this.preferredLanguage,
      required this.experienceTime,
      required this.salary})
      : id = id ?? const Uuid().v4();

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      id: json['id'],
      name: json['name'],
      birthDate: DateTime.fromMillisecondsSinceEpoch(json['birthDate']),
      experienceLevel: json['level'],
      preferredLanguage: json['preferredLanguage'].cast<String>(),
      experienceTime: json['experienceTime'],
      salary: json['salary'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'birthDate': birthDate.millisecondsSinceEpoch,
        'level': experienceLevel,
        'preferredLanguage': preferredLanguage,
        'experienceTime': experienceTime,
        'salary': salary
      };

  @override
  String toString() {
    final length = preferredLanguage.length;

    StringBuffer buffer = StringBuffer();
    buffer.write('Id: $id, ');
    buffer.write('Name: $name, ');
    buffer.write('Birth Date: ');
    buffer.write('${birthDate.toIso8601String()}, ');
    buffer.write('Experience Level: $experienceLevel, ');

    buffer.write('Preferred Languages: [ ');
    for (var i = 0; i < length - 1; i++) {
      buffer.write('${preferredLanguage[i]}, ');
    }
    buffer.write('${preferredLanguage[length - 1]} ], ');

    buffer.write('Experience Time: $experienceTime, ');
    buffer.write('Salary: $salary');

    return buffer.toString();
  }
}
