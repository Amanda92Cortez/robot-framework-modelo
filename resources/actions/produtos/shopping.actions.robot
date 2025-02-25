*** Settings ***
Documentation     Ações Envolvendo a funcionalidade de lista de compras

Resource        ../../support/base.robot
Resource        ../produtos/search.actions.robot

Library        Browser

*** Variables ***
#Página Principal
${txt_principal}                //h1[contains(.,'Lista de Compras')]
${txt_carrinho_vazio}           [data-testid="shopping-cart-empty-message"]

${a_lista_compras}               [data-testid="lista-de-compras"]
${btn_pagina_inicial}            [data-testid="paginaInicial"]
${btn_limpa_lista}               [data-testid="limparLista"]


*** Keywords ***
Apontamento do lista de compra
    Click    ${a_lista_compras}

Validação da tela de lista de compras
    Get Text     ${txt_principal}    contains     Lista de Compras
    Get Text     ${txt_carrinho_vazio}    contains    Seu carrinho está vazio    

Validação de pagina inicial para adicionar
    Click    ${btn_pagina_inicial}
    Procurar por    Samsung
    Produtos deverão estar visíveis
    Adicionar no carrinho

Limpa lista da compra
    Click    ${btn_limpa_lista}