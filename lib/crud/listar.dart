import 'package:app_sqlite/helper.dart';
import 'package:flutter/material.dart';

// Criar a classe TabIncluir, incluindo um Botão no meio da tela

class TabListar extends StatelessWidget {
  TabListar({Key? key}) : super(key: key);

  // Lógica
  final dbHelper = DatabaseHelper.instance;
  void _listar() async{
    final dados = await dbHelper.queryAll();
    print('Listando...');
    dados.forEach((row) => print(row));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              _listar();
            },
            child: const Text('Listar' , 
            style: TextStyle(fontSize: 30),),
          ),
        ],
      ),
    );
  }
}