let livros = [];
const endPointDaAPI = 'https://guilhermeonrails.github.io/casadocodigo/livros.json'
getBuscarLivrosAPI()

async function getBuscarLivrosAPI(){
    const resp = await fetch(endPointDaAPI)
    livros = await resp.json();
    let livrosComDesconto = aplicarDesconto(livros)
    exibirLivros(livrosComDesconto)
}

