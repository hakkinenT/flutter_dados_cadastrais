import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/constants.dart';
import 'package:flutter_dados_cadastrais/utils/view/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _hiveConfiguration();

  runApp(const MyApp());
}

_hiveConfiguration() async {
  var dir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
            backgroundColor: surfaceColor, foregroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
