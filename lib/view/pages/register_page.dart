import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/models/register_data.dart';

import '../../utils/spaces.dart';
import '../widgets/register_data_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RegisterData?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: _RegisterPageBody(
        child: RegisterDataForm(
          data: args,
        ),
      ),
    );
  }
}

class _RegisterPageBody extends StatelessWidget {
  const _RegisterPageBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(paddingSpace),
      child: child,
    );
  }
}
