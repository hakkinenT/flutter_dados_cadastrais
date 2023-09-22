import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/constants.dart';
import 'package:flutter_dados_cadastrais/utils/view/widgets/custom_text_form_field.dart';
import 'package:flutter_dados_cadastrais/utils/view/widgets/form_label.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(paddingSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormLabel(label: 'Nome'),
            SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              hintText: 'John Doe',
            )
          ],
        ),
      ),
    );
  }
}
