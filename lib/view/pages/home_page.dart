import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/spaces.dart';

import '../../models/datasources/register_data_source.dart';
import '../../models/register_data.dart';
import '../../models/repositories/register_repository.dart';
import '../widgets/empty_register_list.dart';
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
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatefulWidget {
  const _HomePageBody();

  @override
  State<_HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<_HomePageBody> {
  bool loading = false;
  bool empty = true;
  List<RegisterData> datas = [];
  late RegisterRepository repository;

  @override
  void initState() {
    super.initState();
    repository = RegisterRepository(registerDataSource: RegisterDataSource());

    _getData();
  }

  _getData() async {
    _showLoadingProgress();

    final list = await repository.getAllData();
    setState(() {
      datas = list;
    });

    if (datas.isEmpty) {
      _showEmptyWidget();
    } else {
      _hideEmptyWidget();
    }

    _hideLoadingProgress();
  }

  void _hideEmptyWidget() {
    setState(() {
      empty = false;
    });
  }

  void _showEmptyWidget() {
    setState(() {
      empty = true;
    });
  }

  void _hideLoadingProgress() {
    setState(() {
      loading = false;
    });
  }

  void _showLoadingProgress() {
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const LinearProgressIndicator();
    } else if (empty) {
      return const EmptyRegisterList();
    }
    return RegisterDataList(datas: datas);
  }
}

class RegisterDataList extends StatelessWidget {
  const RegisterDataList({
    super.key,
    required this.datas,
  });

  final List<RegisterData> datas;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(paddingSpace),
      itemCount: datas.length,
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      itemBuilder: (context, index) {
        final data = datas[index];
        return _RegisterDataItem(data: data);
      },
    );
  }
}

class _RegisterDataItem extends StatelessWidget {
  const _RegisterDataItem({
    required this.data,
  });

  final RegisterData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            data.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const RegisterPage(),
                  settings: RouteSettings(arguments: data)),
            );
          },
        ),
      ),
    );
  }
}
