import 'package:flutter_dados_cadastrais/models/register_data.dart';

sealed class RegisterDataState {}

class EmptyDataState extends RegisterDataState {}

class LoadingDataState extends RegisterDataState {}

class SuccessDataState extends RegisterDataState {}

class GettedDataState extends RegisterDataState {
  final List<RegisterData> datas;

  GettedDataState({required this.datas});
}

//class ErrorDataState extends RegisterDataState {}
