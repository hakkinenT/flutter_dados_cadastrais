import 'package:flutter_dados_cadastrais/models/register_data.dart';

import '../datasources/register_data_source.dart';

class RegisterRepository {
  final RegisterDataSource registerDataSource;

  const RegisterRepository({required this.registerDataSource});

  Future<void> addData(RegisterData registerData) async {
    await registerDataSource.save(registerData.toJson());
  }

  Future<RegisterData> getData(String id) async {
    final result = await registerDataSource.get(id);
    return RegisterData.fromJson(result);
  }

  Future<void> deleteData(String id) async {
    return registerDataSource.delete(id);
  }
}
