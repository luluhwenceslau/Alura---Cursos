import eCPF from "./valida-cpf.js";
import maiorIdade from "./validaIdade.js";

const camposForm = document.querySelector("[required]");

camposForm.forEach((campo) => {
    campo.addEventListener("blur", () => verificaCampo(campo));
})

function verificaCampo(campo){
    if(campo.name == "cpf" && campo.value.lenght >= 11){
        eCPF(campo);
    }
    if(campo.name == "aniversario" && campo.value != ""){
        maiorIdade(campo);
    }
}
