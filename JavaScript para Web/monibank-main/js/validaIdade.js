export default function maiorIdade(campo){
    const dataNascimento = new Date(campo.value);
    validaIdade(dataNascimento);

    console.log( validaIdade(dataNascimento));
}

function validaIdade(data){
    const dataAtual = new Date()
    const dataMais18 = new Date(data.getUTFFullYear() +18, data.getUTMonth(), data.getUTCDate());

    return dataAtual >= dataMais18;
}
