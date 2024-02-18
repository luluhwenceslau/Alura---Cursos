import 'transporte_lista.dart';

class Viagem{
  static String codigo = "DJGEG45";
  double dinheiro = 1500;
  Transporte locomocao;
  Set<String> registrosVisitados = <String>{};
  Map<String, dynamic> registrarPrecos = {};

  int _totalVisitados = 0;

  Viagem({required this.locomocao});

  printCodigo(){
    print(codigo);
  }

  void escolherTransporte(Transporte locomocao){
    switch (locomocao){
      case Transporte.carro:
        print('Vou de Carro para a aventura!');
        break;
      case Transporte.bike:
        print('Vou de Bike para a aventura!');
        break;
      case Transporte.patins:
        print('Vou de Patins para a aventura!');
        break;
      case Transporte.trem:
        print('Vou de Trem para a aventura!');
        break;
      default:
        print('Estou indo para a aventura, e é o que importa');
    }
  }

  void visitar(String localVisita){
      registrosVisitados.add(localVisita);
      _totalVisitados += 1;
    }

  void registrarPrecoVisita(String local, dynamic preco){
    registrarPrecos[local] = preco;
  }

  int get consultaTotalLocais{
    return _totalVisitados;
  }

  void set alterarVisitados(int novaQtn){
   if(novaQtn < 10){
     _totalVisitados = novaQtn;
   }else{
    print('Não é possível visitar tantos lugares!');
   }
  }
}
