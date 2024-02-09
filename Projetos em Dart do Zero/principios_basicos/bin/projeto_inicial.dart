void main() {

  
  int idade = 21;
  double altura = 1.68;
  const String nome = 'Luana';
  bool geek = true;
  List <dynamic> pessoa = [idade, altura, geek, nome];
  
  bool maiorIdade;
  if(idade >= 18){
    maiorIdade = true;
  } else{
    maiorIdade = false;
  }

  for(int i = 1; i<5; i++){
    print('Conclui $i voltas');
  }

  String frase = '\nMeu nome é ${pessoa[3]}\n'
    'Minha idade é: ${pessoa[0]} anos. A minha altura é ${pessoa[1]} cm \n'
    'Sou geek? ${pessoa[2]} \n'
    'Sou maior de idade? $maiorIdade';

  //List <String> listaNomes = ['Igor', 'Lari', 'Gustavo', 'Ricardo', 'André'];

  print(frase);

}
