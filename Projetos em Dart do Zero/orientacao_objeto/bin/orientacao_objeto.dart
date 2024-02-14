void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasColheita = 40;
  bool isMadura = funcEstaMadura(diasColheita);

  mostrarMadura("Uva", 35, cor: "Roxa");

  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diasColheita);
  Fruta fruta02 = Fruta("Uva", 40, "Roxa", "Doce", 20);
  
  fruta02.estaMadura(60);
}

class Fruta {
  String nome;
  double peso;
  String cor;
  String sabor;
  int diasColheita;
  bool? isMadura;

  Fruta(this.nome, this.peso, this.cor, this.sabor, this.diasColheita, {this.isMadura}); //Construtor
  estaMadura (int diasParaMadurar){
    isMadura = diasColheita >= diasParaMadurar;
    print("A sua $nome foi colhida a $diasColheita dias, e precisa de $diasParaMadurar para poder comer. Ela está madura? $isMadura.");
  }
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
