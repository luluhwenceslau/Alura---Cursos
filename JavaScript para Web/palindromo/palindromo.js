palindromoCheck()

function palindromoCheck (){
    var palavra = 'rever';
    var separador = palavra.split("");
    var invertida = separador.reverse();
    invertida = invertida.join("")
    if(palavra == invertida){
        console.log(`A palavra "${palavra}" é um palindromo!`)
    } else{
        console.log(`A palavra "${palavra}" NÃO um palindromo!`)
    }
}
