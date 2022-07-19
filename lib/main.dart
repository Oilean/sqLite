import 'package:flutter/material.dart';
import 'crud/incluir.dart';
import 'crud/atualizar.dart';
import 'crud/listar.dart';
import 'crud/excluir.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD SQLite',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(), // Rota de inicialização do APP
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,// Quantidade de abas a serem criadas,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('CRUD SQLite'),
            bottom: const TabBar(tabs: 
            [
              Tab(icon: Icon(Icons.add), text: 'Incluir',),
              Tab(icon: Icon(Icons.list), text: 'Listar',),
              Tab(icon: Icon(Icons.update), text: 'Atualizar',),
              Tab(icon: Icon(Icons.delete), text: 'Deletar',),
            ]),
          ),
          body: TabBarView(
            children: [ // Montagem da chamada das Tabs(Conteudo)
              // Classes que teram os comportamentos desejados
              TabIncluir(),
              TabListar(),
              TabAtualizar(),
              TabExcluir(),
            ]
          ),
        ),
      ),
    );
  }
}

