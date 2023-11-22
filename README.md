# sympla_tests_appium_robot
Grupo: Emerson Santiago, Geyzon Rodriguez e Marcello Fiusa.

Exercício da disciplina de Testes Mobile do curso de Especialização em Testes Ágeis do CESAR School.
Na pasta 'recordings' pode ser visto um GIF/gravação mostrando os testes que foram automatizados sendo executados.



CASOS DE TESTE

CT001


DADO QUE O USUÁRIO ACESSA A HOMEPAGE DO APLICATIVO SYMPLA
QUANDO O USUÁRIO FIZER UMA BUSCA DE EVENTOS DIGITANDO O NOME DA CIDADE 'RECIFE'
ENTÃO O APLICATIVO DEVE APRESENTAR UMA LISTA DE EVENTOS NA CIDADE BUSCADA

CT002


DADO QUE O USUÁRIO ACESSA A HOMEPAGE DO APLICATIVO SYMPLA
QUANDO O USUÁRIO FIZER UMA BUSCA DE EVENTOS DIGITANDO O TIPO DE EVENTO 'SHOW'
ENTÃO O APLICATIVO DEVE APRESENTAR UMA LISTA DE EVENTOS DO TIPO SHOW COMO RESULTADO DA BUSCA

CT003


DADO QUE O USUÁRIO ACESSA PÁGINA 'MAPA' NO APLICATIVO SYMPLA
QUANDO O USUÁRIO INSERIR MANUALMENTE A LOCALIZAÇÃO COMO SENDO A CIDADE 'RECIFE'
ENTÃO O APLICATIVO DEVE APRESENTAR UM MAPA DE EVENTOS NA CIDADE 'RECIFE'

CT004


DADO QUE O USUÁRIO ACESSA A HOMEPAGE DO APLICATIVO SYMPLA
QUANDO O USUÁRIO IDENTIFICAR O EVENTO MAIS VISTO NAS ÚLTIMAS 24H
E FAVORITAR SEGUIDO DO COMPORTAMENTO DE DESFAVORITAR O EVENTO
ENTÃO O APLICATIVO DEVE INSERIR O EVENTO NA LISTA DE FAVORITOS E EM SEGUIDA RETIRÁ-LO
