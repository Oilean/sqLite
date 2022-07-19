import 'dart:html';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  // Especificações do banco
  static const _databaseName = 'ExemploDB.db';
  static const _databaseVersion = 1;

  // Especificação da tabela/campos
  static const table = 'contato';
  static const columnId = '_id';
  static const columnName = 'nome';
  static const columnAge = 'idade';

  // Construtor utilizando o Design Pattern Singleton
  DatabaseHelper._privateContructor();
  static final DatabaseHelper instance = DatabaseHelper._privateContructor();

  // Testando a existência de uma conexão
  static Database? _database;
  Future<Database?> get database async{
    if (_database != null) return _database; // O banco existe

    // retorna a inicialização do banco
    _database = await _initDatabase();
    return _database;
  }

  // Método para incializar o banco de dados, caso não esteja incializado

  _initDatabase() async{
    Directory documentsDiretory = await getApplicationDocumentsDirectory();
    String path = join(documentsDiretory.path, _databaseName);
    return await openDatabase(path,
          version: _databaseVersion, onCreate: _onCreate);
  }

  // Método para a criação do banco fisicamente
  Future _onCreate(Database db, int version) async{
    await db.execute(
      '''
        CREATE TABLE $table (
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL,
          $columnAge INTEGER NOT NULL
        )
      ''');
  }

  // ### Métodos do CRUD ###

  // O metodo insert() irá incluir uma linha no BD onde o formato é uma Map()
  // O Map() conterá a chave (Coluna) e o valor (dado)
  // O valor retornado será sempre o ID criado na Primary Key

  Future<int> insert(Map<String, dynamic> row) async{
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  // Método que retorna todos os registros em ordem crecente (ID)
  Future<List<Map<String, dynamic>>> queryAll() async{
    Database? db = await instance.database;
    return await db!.query(table);
  }
}