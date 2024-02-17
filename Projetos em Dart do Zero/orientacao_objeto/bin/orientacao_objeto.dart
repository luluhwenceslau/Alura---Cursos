void main() {

  mostrarMadura("Uva", 35, cor: "Roxa");

  Fruta fruta01 = Fruta("Uva", 40, "Roxa", "Doce", 20);
  
  fruta01.estaMadura(60);

  Legumes mandioca = Legumes('Macaxeira', 1200, 'Marrom', true);
  Fruta banana = Fruta('Banana', 75, 'Amarela', 'Doce', 12);

  mandioca.printAlimento();
  banana.fazerSuco();
  banana.fazerMassa();
}

funcDiasMadura(int dias){
  int diasParaMadurar = 30;
  int quantosDiasFaltam = diasParaMadurar - dias;
  return quantosDiasFaltam;
}

/*PARAMETROS
Posicionais Obrigatórios
Nomeados Opcionais
Parametros com "Padrão"
Modificador "required"*/
mostrarMadura(String nome, int dias,{String? cor = "sem cor definida"}){
  if(dias >= 30){
    print("A $nome está madura");
  }else{
    print("A $nome não está madura");
  }

  if(cor != null){
    print("A $nome é $cor");
  }
}

bool funcEstaMadura(int dias){
    if(dias >= 30){
      return true;
    }else{
      return false;
    }
}

//Conceito de Herança
class Alimento{
  String nome;
  double peso;
  String cor;
  Alimento(this.nome, this.peso, this.cor);

  void printAlimento(){
    print('Este $nome pesa $peso gramas e é $cor');
  }
}

class Fruta extends Alimento implements Bolo{
  String sabor;
  int diasColheita;
  bool? isMadura;

  Fruta(String nome, double peso, String cor, this.sabor, this.diasColheita, {this.isMadura})
    :super(nome, peso, cor); //Construtor
  estaMadura (int diasParaMadurar){
    isMadura = diasColheita >= diasParaMadurar;
    print("A sua $nome foi colhida a $diasColheita dias, e precisa de $diasParaMadurar para poder comer. Ela está madura? $isMadura.");
  }
  void fazerSuco(){
      print('Você fez um suco de $nome');
    }

  @override
  void separarIngredientes(){
    print('Pegar a $nome');
  }

  @override
    void fazerMassa(){
      print('Misturar os ingredientes');
    }

  @override
    void assar(){
      print('Colocar no forno');
    }
}

class Legumes extends Alimento implements Bolo{
  bool isPrecisaCozinhar;
  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
    :super(nome, peso, cor);

  void cozinhar(){
    if(isPrecisaCozinhar){
      print('Pronto, o $nome está cozinhando!');
    }else{
      print('Não precisa cozinhar');
    }
  }
  @override
  void assar(){}

  @override
    void fazerMassa(){}

  @override
    void separarIngredientes(){}
}

class Citricas extends Fruta{
  double nivelAzedo;
  Citricas(String nome, double peso, String cor, String sabor, int diasColheita, this.nivelAzedo)
    :super(nome, peso, cor, sabor, diasColheita);
}

class Nozes extends Fruta{
  double porcentagemOleo;
  Nozes(String nome, double peso, String cor, String sabor, int diasColheita, this.porcentagemOleo)
    :super(nome, peso, cor, sabor, diasColheita);

  @override
    void fazerMassa(){
      print('Tirar a casca');
      super.fazerMassa();
    }
}

//conceito classe abstrata
abstract class Bolo{
  void separarIngredientes();
  void fazerMassa();
  void assar();
}
