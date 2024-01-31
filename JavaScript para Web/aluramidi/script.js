/*
function tocaPom(){
    document.querySelector('#som_tecla_pom').play();
}
document.querySelector('.tecla_pom').onclick = tocaPom;

function tocaClap(){
    document.querySelector('#som_tecla_clap').play();
}
document.querySelector('.tecla_clap').onclick = tocaClap;

  ...

  CÓDIGO MAIS 'SIMPLES' PORÉM INCONVENIENTE PARA MUITAS TECLAS
  OPÇÃO, TRABALHAR COM LISTA DE EVENTOS, A NODE LIST, FUNCIONA COMO ARRAY
  */

function tocaSom(idAudioInstrumento){
    document.querySelector(idAudioInstrumento).play();
}
const listaTeclas = document.querySelectorAll('.tecla');

let contador = 0;
while(contador < listaTeclas.length){

    const tecla = listaTeclas[contador];
    const instrumento = tecla.classList[1];
    const idAudio = `#som_${instrumento}`;  //template String

    tecla.onclick = function (){
        tocaSom(idAudio);
}
    contador ++;
}
