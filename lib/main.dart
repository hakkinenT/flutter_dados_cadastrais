import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/constants.dart';
import 'package:flutter_dados_cadastrais/utils/view/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
