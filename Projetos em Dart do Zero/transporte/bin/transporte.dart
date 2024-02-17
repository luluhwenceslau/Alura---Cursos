void main(){
  escolherTransporte(Transporte.patins);


  Set<String> registrosVisitados = <String>{};
  registrosVisitados = registrarDestino("São Paulo", registrosVisitados);
  registrosVisitados = registrarDestino("Recife", registrosVisitados);
  registrosVisitados = registrarDestino("Rio de Janeiro", registrosVisitados);
  registrosVisitados = registrarDestino("São Paulo", registrosVisitados);
  print(registrosVisitados);
}

/*
void escolherTransporteEnum(Transporte locomocao){
  if(locomocao == Transporte.carro){
     print('Vou de Carro para a aventura!');
  }else if(locomocao == Transporte.bike){
    print('Vou de Bike para a aventura!');
  }else{
    print('Vou para a aventura!');
  }
}
*/
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

enum Transporte{
  carro,
  bike,
  patins,
  trem;
}

Set<String> registrarDestino(String destino, Set<String> banco){
  banco.add(destino);
  return banco;
}
