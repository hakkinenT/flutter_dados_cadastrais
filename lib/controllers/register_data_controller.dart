import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/controllers/register_data_state.dart';
import 'package:flutter_dados_cadastrais/models/datasources/register_data_source.dart';
import 'package:flutter_dados_cadastrais/models/register_data.dart';
import 'package:flutter_dados_cadastrais/models/repositories/register_repository.dart';

class RegisterDataController extends ChangeNotifier {
  final RegisterRepository repository = RegisterRepository(
    registerDataSource: RegisterDataSource(),
  );

  RegisterDataState state = EmptyDataState();

  Future<void> addData(RegisterData data) async {
    await repository.addData(data);
    /*state = SuccessDataState();
    notifyListeners();*/

    await getAllData();
  }

  Future<void> getAllData() async {
    state = LoadingDataState();
    notifyListeners();

    //await Future.delayed(const Duration(seconds: 2));

    final datas = await repository.getAllData();

    state = GettedDataState(datas: datas);
    notifyListeners();
  }
}
