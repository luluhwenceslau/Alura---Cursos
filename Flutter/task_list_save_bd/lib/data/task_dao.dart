import 'package:sqflite/sqflite.dart';

import '../components/task.dart';
import 'database.dart';

class TaskDao{

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async{
    print('Iniciando o Save:');
    final Database bancoDedados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if(itemExists.isEmpty ){
      print('Tarefa não existe!');
      return await bancoDedados.insert(_tablename, taskMap);
    } else {
      print('Tarefa já existe!');
      return await bancoDedados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome],);
    }
  }

  Map<String, dynamic> toMap(Task tarefa){
    print('Convertendo a tarefa');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }
  
  
  Future<List<Task>> findAll() async{
    print('Acessando o FindAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String,dynamic>> result = await bancoDeDados.query(_tablename);
    return toList(result);
  }
  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas){
    print('ToList');
    final List<Task> tarefas = [];
    for(Map<String, dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }


  Future<List<Task>> find(String nomeTarefa) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );
    print('tarefa encontrada ${toList(result)}');
    return toList(result);
  }


  delete(String nomeTarefa) async {
    print('Deletando a tarefa: $nomeTarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeTarefa],);
  }
}
