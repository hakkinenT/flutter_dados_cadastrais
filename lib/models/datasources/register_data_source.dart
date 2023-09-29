import 'package:flutter_dados_cadastrais/db/db.dart';

class RegisterDataSource {
  Future<void> save(Map<String, dynamic> data) async {
    final db = await DB.instance.database;

    await db.put(data['id'], data);
  }

  Future<Map<String, dynamic>> get(dynamic id) async {
    final db = await DB.instance.database;

    final data = await db.get(id);

    return _convertDynamicToMap(data);
  }

  Map<String, dynamic> _convertDynamicToMap(dynamic data) {
    return {
      'id': data['id'],
      'name': data['name'],
      'birthDate': data['birthDate'],
      'level': data['level'],
      'preferredLanguage': data['preferredLanguage'],
      'experienceTime': data['experienceTime'],
      'salary': data['salary']
    };
  }

  Future<void> delete(dynamic id) async {
    final db = await DB.instance.database;
    await db.delete(id);
  }
}
