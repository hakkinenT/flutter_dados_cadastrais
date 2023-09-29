import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/view/widgets/form_input_body.dart';

import '../../utils/spaces.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';
import 'experience_time_dropdown_button.dart';
import 'form_label.dart';
import 'languages_checkbox_list.dart';
import 'level_radio_list.dart';
import 'salary_slider.dart';

class RegisterDataForm extends StatefulWidget {
  const RegisterDataForm({super.key});

  @override
  State<RegisterDataForm> createState() => _RegisterDataFormState();
}

class _RegisterDataFormState extends State<RegisterDataForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NameInput(
          controller: nameController,
          onChanged: (value) {},
        ),
        heightSpace,
        _BirthDateInput(
          controller: birthController,
          onTap: () => _showDatePicker(context),
        ),
        heightSpace,
        _ExperienceLevelInput(
          selected: true,
          groupValue: 'Iniciante',
          onChanged: (value) {},
        ),
        heightSpace,
        _PreferredLanguagesInput(
          value: true,
          onChanged: (value) {},
        ),
        heightSpace,
        _ExperienceTimeInput(
          value: 0,
          onChanged: (value) {},
        ),
        heightSpace,
        _SalaryInput(
          value: 2000.0,
          onChanged: (value) {},
        ),
        heightSpace,
        CustomTextButton(
          onPressed: () {},
        ),
      ],
    );
  }

  _showDatePicker(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900, 5, 20),
      lastDate: DateTime(2023, 12, 31),
    );
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

  final bool selected;
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
  const _PreferredLanguagesInput({this.onChanged, required this.value});

  final ValueChanged<bool?>? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return FormInputBody(
      children: [
        const FormLabel(label: 'Linguagens Preferidas'),
        halfHeightSpace,
        LanguagesCheckboxList(
          value: value,
          onChanged: onChanged,
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
      const FormLabel(label: 'Pretenção Salarial'),
      halfHeightSpace,
      SalarySlider(
        value: value,
        onChanged: onChanged,
      )
    ]);
  }
}
