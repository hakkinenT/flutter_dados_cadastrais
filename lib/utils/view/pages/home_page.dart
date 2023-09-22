import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(paddingSpace),
        child: Column(
          children: [
            Center(
              child: Text('Home Page'),
            )
          ],
        ),
      ),
    );
  }
}
