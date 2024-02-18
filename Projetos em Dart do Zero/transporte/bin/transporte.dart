import 'transporte_lista.dart';
import 'viagem.dart';

void main(){
  Viagem viagemMaio = Viagem(locomocao: Transporte.aviao);
  print(viagemMaio.consultaTotalLocais);
  viagemMaio.visitar("Museu");
  print(viagemMaio.consultaTotalLocais);
  viagemMaio.alterarVisitados = 10;
  print(viagemMaio.consultaTotalLocais);
  
}
