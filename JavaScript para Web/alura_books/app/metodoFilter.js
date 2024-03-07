const botoes = document.querySelectorAll('.btn');
botoes.forEach(btn => btn.addEventListener('click', filtrarLivros));

function filtrarLivros(){
    const elementoBtn = document.getElementById(this.id)
    const categoria = elementoBtn.value;
    let livrosFiltrados = categoria == 'disponivel' ? 
        filtrarDisponiveis() : filtrarCategoria(categoria);
    exibirLivros(livrosFiltrados);
    if(categoria == 'disponivel'){
        const valorTotal = calcularTotalDisponiveis(livrosFiltrados)
        exibirValorTotalDisponiveis(valorTotal)
    }
}

function filtrarCategoria(categoria) {
    return livros.filter(livro => livro.categoria == categoria);
}

function filtrarDisponiveis() {
    return livros.filter(livro => livro.quantidade > 0);
}

function exibirValorTotalDisponiveis(valorTotal){
    elementosDisponiveisTotal.innerHTML = `
    <div class="livros__disponiveis">
        <p>Todos os livros disponíveis por R$ <span id="valor">${valorTotal}</span></p>
    </div>
    `
}

