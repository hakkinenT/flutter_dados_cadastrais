import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/view/pages/register_page.dart';

import '../widgets/register_data_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const RegisterPage(),
                ),
              );
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
      body: const _HomePageBody(child: RegisterDataForm()),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home'),
    );
  }
}
