function mostrarLivros(ciclo) {
    const secoes = document.querySelectorAll('.classe-titulo');

    secoes.forEach(secao => {
        secao.style.display = 'none';
    });

    if (ciclo === 'todos') {
        secoes.forEach(secao => {
            secao.style.display = 'block';
        });
    } else {
        const selecionadas = document.querySelectorAll('.classe-titulo.' + ciclo);
        selecionadas.forEach(secao => {
            secao.style.display = 'block';
        });
    }
}


