import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/controllers/register_data_controller.dart';

import 'package:intl/intl.dart';

import '../../models/register_data.dart';
import '../../utils/extensions/date_time_extension.dart';
import 'form_input_body.dart';
import '../../utils/spaces.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';
import 'experience_time_dropdown_button.dart';
import 'form_label.dart';
import 'languages_checkbox_list.dart';
import 'level_radio_list.dart';
import 'salary_slider.dart';

class RegisterDataForm extends StatefulWidget {
  final RegisterData? data;

  const RegisterDataForm({super.key, this.data});

  @override
  State<RegisterDataForm> createState() => _RegisterDataFormState();
}

class _RegisterDataFormState extends State<RegisterDataForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  String selectedLevel = 'Iniciante';
  List<String> languagesSelected = [];
  int experienceTime = 0;
  double salary = 0.0;
  DateTime birthDate = DateTime.now();
  bool hasError = false;
  String? errorMessage;
  late RegisterDataController controller;

  @override
  void initState() {
    super.initState();

    if (widget.data != null) {
      setState(() {
        nameController.text = widget.data!.name;
        birthController.text = widget.data!.birthDate.asDayMonthYear();
        selectedLevel = widget.data!.experienceLevel;
        experienceTime = widget.data!.experienceTime;
        salary = widget.data!.salary;
        languagesSelected = widget.data!.preferredLanguage;
      });
    }

    controller = RegisterDataController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NameInput(
          controller: nameController,
          onChanged: (value) {
            setState(() {
              nameController.text = value;
            });
          },
        ),
        heightSpace,
        _BirthDateInput(
          controller: birthController,
          onTap: () => _showDatePicker(context),
        ),
        heightSpace,
        _ExperienceLevelInput(
          selected: selectedLevel,
          groupValue: selectedLevel,
          onChanged: (value) {
            setState(() {
              selectedLevel = value!;
            });
          },
        ),
        heightSpace,
        _PreferredLanguagesInput(
          languagesSelected: languagesSelected,
        ),
        heightSpace,
        _ExperienceTimeInput(
          value: experienceTime,
          onChanged: (value) {
            setState(() {
              experienceTime = value!;
            });
          },
        ),
        heightSpace,
        _SalaryInput(
          value: salary,
          onChanged: (value) {
            setState(() {
              salary = value;
            });
          },
        ),
        heightSpace,
        CustomTextButton(
          onPressed: () async {
            await controller.addData(
              RegisterData(
                  name: nameController.text,
                  birthDate:
                      DateFormat('dd/MM/yyyy').parse(birthController.text),
                  experienceLevel: selectedLevel,
                  preferredLanguage: languagesSelected,
                  experienceTime: experienceTime,
                  salary: salary),
            );

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Dados cadastrados com sucesso!'),
                ),
              );
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }

  _showDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 5, 20),
      lastDate: DateTime(2023, 12, 31),
    );

    if (date != null) {
      setState(() {
        birthController.text = date.asDayMonthYear();
        birthDate = date;
      });
    }
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput({required this.controller, this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormInputBody(
      children: [
        const FormLabel(label: 'Nome'),
        halfHeightSpace,
        CustomTextFormField(
          hintText: 'John Doe',
          controller: controller,
          onChanged: onChanged,
        )
      ],
    );
  }
}

class _BirthDateInput extends StatelessWidget {
  const _BirthDateInput({this.onTap, required this.controller});

  final TextEditingController controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FormInputBody(
      children: [
        const FormLabel(label: 'Data de Nascimento'),
        halfHeightSpace,
        CustomTextFormField(
          controller: controller,
          hintText: '21/09/2023',
          readOnly: true,
          onTap: onTap,
        )
      ],
    );
  }
}

class _ExperienceLevelInput extends StatelessWidget {
  const _ExperienceLevelInput(
      {required this.selected, required this.groupValue, this.onChanged});

  final String selected;
  final String groupValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormInputBody(
      children: [
        const FormLabel(label: 'Nível de Experiência'),
        halfHeightSpace,
        LevelRadioList(
          selected: selected,
          groupValue: groupValue,
          onChanged: onChanged,
        )
      ],
    );
  }
}

class _PreferredLanguagesInput extends StatelessWidget {
  const _PreferredLanguagesInput({required this.languagesSelected});

  final List<String> languagesSelected;

  @override
  Widget build(BuildContext context) {
    return FormInputBody(
      children: [
        const FormLabel(label: 'Linguagens Preferidas'),
        halfHeightSpace,
        LanguagesCheckboxList(
          languagesSelected: languagesSelected,
        ),
      ],
    );
  }
}

class _ExperienceTimeInput extends StatelessWidget {
  const _ExperienceTimeInput({required this.value, this.onChanged});

  final int value;
  final ValueChanged<int?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormInputBody(
      children: [
        const FormLabel(label: 'Tempo de Experiência'),
        halfHeightSpace,
        ExperienceTimeDropdownButton(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _SalaryInput extends StatelessWidget {
  const _SalaryInput({required this.value, required this.onChanged});

  final double value;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormInputBody(children: [
      FormLabel(label: 'Pretenção Salarial R\$ ${value.toStringAsFixed(2)}'),
      halfHeightSpace,
      SalarySlider(
        value: value,
        onChanged: onChanged,
      )
    ]);
  }
}
