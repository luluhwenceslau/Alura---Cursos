const elementoInserirLivros = document.getElementById('livros');
const elementosDisponiveisTotal = document.getElementById('valor_total_livros_disponiveis')

function exibirLivros(listaDeLivros){
    elementosDisponiveisTotal.innerHTML = ''
    elementoInserirLivros.innerHTML = ''
    listaDeLivros.forEach(livro => {
        //let disponibilidade = verificarLivrosDisponiveis(livro)
        let disponibilidade = livro.quantidade > 0 ? 'livro__imagens' : 'livro__imagens indisponivel'
        elementoInserirLivros.innerHTML += `
        <div class="livro">
            <img class="${disponibilidade}" src="${livro.imagem}" 
                alt="${livro.alt}"/>
            <h2 class="livro__titulo">
                ${livro.titulo}
            </h2>
            <p class="livro__descricao">${livro.autor}</p>
            <p class="livro__preco" id="preco">${livro.preco.toFixed(2)}</p>
            <div class="tags">
                <span class="tag">${livro.categoria}</span>
            </div>
        </div>`
    });
}

/*
function verificarLivrosDisponiveis(livro){
    if (livro.quantidade > 0){
        return 'livro__imagens'
    }else{
        return 'livro__imagens indisponivel'
    }
}
*/