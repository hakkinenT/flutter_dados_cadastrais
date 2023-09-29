import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/constants.dart';
import 'package:flutter_dados_cadastrais/view/widgets/custom_text_form_field.dart';
import 'package:flutter_dados_cadastrais/view/widgets/form_label.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormLabel(label: 'Nome'),
            const SizedBox(
              height: heightSpace / 2,
            ),
            const CustomTextFormField(
              hintText: 'John Doe',
            ),
            const SizedBox(
              height: heightSpace,
            ),
            const FormLabel(label: 'Data de Nascimento'),
            const SizedBox(
              height: heightSpace / 2,
            ),
            CustomTextFormField(
              hintText: '21/09/2023',
              readOnly: true,
              onTap: () async {
                await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 5, 20),
                    lastDate: DateTime(2023, 12, 31),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.dark(
                              primary: Colors.teal.shade300,
                              onPrimary: Colors.black,
                              surface: surfaceColor,
                              onSurface: Colors.white,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                  foregroundColor: appColor),
                            )),
                        child: child!,
                      );
                    });
              },
            ),
            const SizedBox(
              height: heightSpace,
            ),
            const FormLabel(label: 'Nível de Experiência'),
            const SizedBox(
              height: heightSpace / 8,
            ),
            Column(
              children: levels
                  .map((level) => RadioListTile(
                        dense: true,
                        title: Text(
                          level.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        activeColor: Colors.teal.shade300,
                        contentPadding: const EdgeInsets.only(left: 0),
                        value: level.toString(),
                        groupValue: 'Iniciante',
                        selected: true,
                        onChanged: (value) {},
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: heightSpace,
            ),
            const FormLabel(label: 'Linguagens Preferidas'),
            const SizedBox(
              height: heightSpace / 2,
            ),
            Column(
              children: languages
                  .map(
                    (language) => CheckboxListTile(
                      dense: true,
                      activeColor: Colors.teal.shade300,
                      title: Text(
                        language,
                        style: const TextStyle(color: Colors.white),
                      ),
                      value: true,
                      onChanged: (value) {},
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: heightSpace,
            ),
            const FormLabel(label: 'Tempo de Experiência'),
            const SizedBox(
              height: heightSpace / 2,
            ),
            DropdownButtonFormField(
              dropdownColor: surfaceColor,
              isDense: true,
              style: const TextStyle(color: Colors.black),
              items: List<DropdownMenuItem<int>>.generate(
                50,
                (index) => DropdownMenuItem<int>(
                  value: index,
                  child: Text(
                    index.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderSide: BorderSide(color: appColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(borderRadius)),
              )),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: heightSpace,
            ),
            const FormLabel(label: 'Pretenção Salarial'),
            const SizedBox(
              height: heightSpace / 2,
            ),
            Slider(
              activeColor: Colors.teal.shade300,
              min: 0,
              max: 10000,
              value: 1000.0,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: heightSpace,
            ),
            SizedBox(
              width: double.maxFinite,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade300)),
                onPressed: () {},
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
