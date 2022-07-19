import 'package:flutter/material.dart';

// Criar a classe TabIncluir, incluindo um Botão no meio da tela

class TabAtualizar extends StatelessWidget {
  const TabAtualizar({Key? key}) : super(key: key);

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
            onPressed: () {},
            child: const Text('Atualizar' , 
            style: TextStyle(fontSize: 30),),
          ),
        ],
      ),
    );
  }
}