import 'package:flutter/material.dart';

import '../widgets/register_data_form.dart';
import 'register_page.dart';

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
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('text $index'),
        );
      },
    );
  }
}
