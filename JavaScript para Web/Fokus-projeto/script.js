const html = document.querySelector('html');
const focoBtn = document.querySelector('.app__card-button--foco');
const curtoBtn = document.querySelector('.app__card-button--curto');
const longoBtn = document.querySelector('.app__card-button--longo');
const banner = document.querySelector('.app__image');
const titulo = document.querySelector('.app__title');
const btn = document.querySelectorAll('.app__card-button');
const startPause = document.querySelector('#start-pause');
const musicaInput = document.querySelector('#alternar-musica');
const iniciaPauseBtn = document.querySelector('#start-pause span');
const btnImg = document.querySelector('.app__card-primary-butto-icon');
const tempoTela = document.querySelector('#timer');

const musica = new Audio('/sons/luna-rise-part-one.mp3');
const audioPlay = new Audio('/sons/play.wav');
const audioPausa = new Audio('/sons/pause.mp3');
const audioTempoFinalizado = new Audio('/sons/beep.mp3')

let tempSegundos = 5;
let intervaloId = null;

musica.loop = true;
musicaInput.addEventListener('change', () => {
    if(musica.paused){
        musica.play();
    } else{
        musica.pause();
    }
})

focoBtn.addEventListener('click', () => {
    tempSegundos = 1800;
    alterarContexto('foco')
    focoBtn.classList.add('active')
})

curtoBtn.addEventListener('click', () => {
    tempSegundos = 300;
    alterarContexto('descanso-curto')
    curtoBtn.classList.add('active')
})

longoBtn.addEventListener('click', () => {
    tempSegundos = 900;
    alterarContexto('descanso-longo')
    longoBtn.classList.add('active')
})

function alterarContexto(contexto){
    mostrarTempo();
    btn.forEach(function (contexto){
        contexto.classList.remove('active');
    })
    html.setAttribute('data-contexto', contexto);
    banner.setAttribute('src', `/imagens/${contexto}.png`);
    switch(contexto){
        case "foco":
            titulo.innerHTML = `Otimize sua produtividade,<br>
            <strong class="app__title-strong">mergulhe no que importa.</strong>`
            break;
        case "descanso-curto": 
            titulo.innerHTML = `Que tal dar uma respirada? <br> <strong class="app__title-strong">Faça uma pausa curta.</strong>`
            break;
        case "descanso-longo":
            titulo.innerHTML = `Hora de voltar à superfície.<br> <strong class="app__title-strong">Faça uma pausa longa.</strong>`
        default:
            break;
    }
}

const contagemRegressiva = () => {
    if(tempSegundos <= 0) {
        audioTempoFinalizado.play()
        const focoAtivo = html.getAttribute('data-contexto') == 'foco';
        if(focoAtivo){
            const evento = new CustomEvent('focoFinalizado');
            document.dispatchEvent(evento);
        }
        zerarTempo()
        return
    }
    tempSegundos -= 1;
    mostrarTempo();
}

startPause.addEventListener('click', iniciarTempo);

function iniciarTempo(){
    if(intervaloId){
        audioPausa.play();
        zerarTempo();
        return;
    }
    audioPlay.play();
    intervaloId = setInterval(contagemRegressiva, 1000);
    iniciaPauseBtn.textContent = "Pausar";
    btnImg.setAttribute('src', '/imagens/pause.png');
}

function zerarTempo(){
    clearInterval(intervaloId);
    iniciaPauseBtn.textContent = "Começar";
    btnImg.setAttribute('src', '/imagens/play_arrow.png');
    intervaloId = null;
}

function mostrarTempo(){
    const tempo = new Date(tempSegundos * 1000);
    const tempFormatado = tempo.toLocaleTimeString('pt-Br', {minute: '2-digit', second: '2-digit'});
    tempoTela.innerHTML = `${tempFormatado}`;
}

mostrarTempo();
