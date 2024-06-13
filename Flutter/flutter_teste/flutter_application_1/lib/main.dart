import 'package:flutter/material.dart';

void main() {
  runApp(TodoListApp());
}

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blueAccent, 
          centerTitle: true, 
          titleTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255), 
          fontSize: 25)
        ),
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Map<String, dynamic>> _tasks = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _newTask = '';

  void _addTask(String task) {
    setState(() {
      _tasks.add({'task': task, 'completed': false});
    });
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adcionar tarefa'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              onChanged: (value) {
                _newTask = value;
              },
              decoration: InputDecoration(
                hintText: 'Nome da tarefa',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, inserir nome da tarefa';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addTask(_newTask);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 143, 174, 194),
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: _tasks.isEmpty
          ? Center(
              child: Text(
                'Você não possui tarefas :(',
                style: TextStyle(fontSize: 22),
              ),
            )
          : ListView.builder(
            padding: EdgeInsets.all(10),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(
                    task['task'],
                    style: TextStyle(
                      decoration: task['completed'] ? TextDecoration.lineThrough : null,
                      fontSize: 28,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: task['completed'],
                        onChanged: (bool? value) {
                          _toggleTaskCompletion(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _removeTask(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
