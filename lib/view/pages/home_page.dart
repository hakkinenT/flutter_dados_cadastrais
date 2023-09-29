import 'package:flutter/material.dart';

import '../../utils/spaces.dart';
import '../widgets/register_data_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(paddingSpace),
      child: child,
    );
  }
}
