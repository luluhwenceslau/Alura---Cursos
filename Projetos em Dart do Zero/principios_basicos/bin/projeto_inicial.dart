//TODO: Biblioteca para Input e Output
import 'dart:io'; 

void main() {

  int idade = 21;
  double altura = 1.68;
  const String nome = 'Luana';
  bool geek = true;
  List <dynamic> pessoa = [idade, altura, geek, nome];
  //List <String> listaNomes = ['Igor', 'Lari', 'Gustavo', 'Ricardo', 'André'];
  int energia = 100;

  /*
  print('Qual é a sua idade?');
  String? input = stdin.readLineSync();
  if(input != null){
    print('Sua idade $input .');
  }
  */

  bool maiorIdade;
  if(idade >= 18){
    maiorIdade = true;
  } else{
    maiorIdade = false;
  }

  for(int i = 1; i<5; i++){
    print('Conclui $i voltas \n');
  }

  while(energia > 0){  //sem certeza do número de repetições, contar no começo
    print('Mais uma Repetição, tenho $energia de energia!');
    energia = energia - 10;
  }

  /*
  do{    conta após o laço
    print('Mais uma Repetição, tenho $energia de energia!');
    energia = energia - 10;
  } while(energia > 0);
  */

  String frase = '\nMeu nome é ${pessoa[3]}\n'
    'Minha idade é: ${pessoa[0]} anos. A minha altura é ${pessoa[1]} cm \n'
    'Sou geek? ${pessoa[2]} \n'
    'Sou maior de idade? $maiorIdade';

  print(frase);
  
  //TODO:Comentário com destaque
  //Converter Numero para String para concatenar, .toString() ou usar Interpolação $
}
