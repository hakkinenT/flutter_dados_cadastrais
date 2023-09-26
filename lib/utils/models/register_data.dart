import 'package:hive/hive.dart';

part 'register_data.g.dart';

@HiveType(typeId: 0)
class RegisterData extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime birthDate;

  @HiveField(2)
  final List<String> experienceLevel;

  @HiveField(3)
  final List<String> preferredLanguage;

  @HiveField(4)
  final int experienceTime;

  @HiveField(5)
  final double salary;

  RegisterData(
      {required this.name,
      required this.birthDate,
      required this.experienceLevel,
      required this.preferredLanguage,
      required this.experienceTime,
      required this.salary});
}
