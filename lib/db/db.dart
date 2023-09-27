import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DB {
  DB._();

  static final DB instance = DB._();

  static Box? _database;

  Future<Box> get database async {
    await _openDatabase();
    return _database!;
  }

  _openDatabase() async {
    await _initDatabase();

    if (Hive.isBoxOpen('registerData')) {
      _database = Hive.box('registerData');
    } else {
      _database = await Hive.openBox('registerData');
    }
  }

  _initDatabase() async {
    await _configPath();
  }

  Future<void> _configPath() async {
    var dir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
}
