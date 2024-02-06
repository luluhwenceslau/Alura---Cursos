const menorValor = 0;
const maiorValor = 100;
const numeroSecreto = gerarNumeroAleatorio();

function gerarNumeroAleatorio(){
    return parseInt(Math.random() * maiorValor + 1);
}

const elementoMenor = document.getElementById('menor-valor');
    elementoMenor.innerHTML = menorValor;

const elementoMaior = document.getElementById('maior-valor');
    elementoMaior.innerHTML = maiorValor;

console.log(numeroSecreto);
