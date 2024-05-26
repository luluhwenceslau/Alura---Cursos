import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text(
            'Tarefas',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 2000),
          child: ListView(
            children: [
              const Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              const Task('Ir para faculdade',
                  'https://pbs.twimg.com/media/FL43sqlXwAAfkVb.jpg', 4),
              const Task(
                  'Comprar presente',
                  'https://images-americanas.b2w.io/produtos/7358332309/imagens/coracao-com-trufas-100g-cacau-show-dia-das-maes-namorados/7358332325_1_large.jpg',
                  2),
              const Task(
                  'Configurar Note para Flutter',
                  'https://i.dell.com/is/image/DellContent/content/dam/ss2/page-specific/category-pages/inspiron-5330-categorypage-rf-800x620.png?fmt=png-alpha&wid=800&hei=620',
                  3),
              const Task(
                  'Estudar final de semana',
                  'https://assets-global.website-files.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png',
                  5),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: const Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:
      Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blueAccent,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white70,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(widget.foto, fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 230,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 25,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 1)
                                    ? Colors.indigo
                                    : Colors.blue),
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 2)
                                    ? Colors.indigo
                                    : Colors.blue),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldade >= 3)
                                  ? Colors.indigo
                                  : Colors.blue,
                            ),
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 4)
                                    ? Colors.indigo
                                    : Colors.blue),
                            Icon(Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 5)
                                    ? Colors.indigo
                                    : Colors.blue),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 61,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            //print(nivel);
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_upward, size: 25),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.deepPurpleAccent,
                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nivel: $nivel',
                      style: const TextStyle(color: Colors.white70, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
