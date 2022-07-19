import 'package:app_sqlite/helper.dart';
import 'package:flutter/material.dart';

// Criar a classe TabIncluir, incluindo um Botão no meio da tela

class TabIncluir extends StatelessWidget {
  TabIncluir({Key? key}) : super(key: key);

  // Impelementação da lógica para a inclusão de registros
  final dbHelper = DatabaseHelper.instance;
  void _inserir() async{
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'William Santos',
      DatabaseHelper.columnAge: 22 
    };
    final id = await dbHelper.insert(row);
    print('Registro inserido com sucesso, ID: $id');
  }

  // Alterar o APP para receber dados de entrada e inclusão no banco via tela
  // Criar os campos de entreda!!

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
              _inserir();
            },
            child: const Text('Incluir' , 
            style: TextStyle(fontSize: 30),),
          ),
        ],
      ),
    );
  }
}