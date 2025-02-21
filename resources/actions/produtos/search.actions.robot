*** Settings ***
Documentation     Ações Envolvendo a Funcionalidade de Busca

Resource        ../../support/base.robot


*** Variables ***
#Página Principal
${txt_principal}                Serverest Store
${inp_search}                   [data-testid="pesquisar"]
${btn_search}                   [data-testid="botaoPesquisar"]

#Navbar
${a_home}                       [data-testid="home"]
${a_lista_compras}              [data-testid="lista-de-compras"]
${a_carrinho}                   [data-testid="carrinho"]
${img_logo}                     //*[@id="navbarTogglerDemo01"]/img

#Nenhum produto foi encontrado, lista de produtos e adicionar
${msg_not_found}                //*[@id="root"]/div/div/div[2]/div/section/div/div/div/p
${box_products}                //*[@id="root"]/div/div/div[2]/div/section
${btn_adicionar}                [data-testid="adicionarNaLista"]

${btn_increase_quantity}        [data-testid="product-increase-quantity"]
${btn_decrease_quantity}        [data-testid="product-decrease-quantity"]

#Página Lista de Compras
${btn_pagina_inicial}            [data-testid="paginaInicial"]



*** Keywords ***
Apontamento do home
    Click    ${a_home}

Procurar por
    [Arguments]     ${query}
    Apontamento do home
    Fill Text                 ${inp_search}               ${query}
    Click                     ${btn_search}

Produtos deverão estar visíveis
    ${prev_mode}              Set Strict Mode             False
    Wait For Elements State   ${box_products}             visible     ${IMPLICIT_TIMEOUT}
    Get Element Count         ${box_products}             >=          1
    Set Strict Mode           ${prev_mode}

Mensagem nenhum produto encontrado deve estar visível
    Wait For Elements State   ${msg_not_found}     visible     ${IMPLICIT_TIMEOUT}
    Get Text                  ${msg_not_found}     contains    Nenhum produto foi encontrado

Adicionar no Carrinho
    Click    ${btn_adicionar}

Aumentar quantidade de produto selecionado
    FOR    ${i}    IN RANGE    4
        Click    ${btn_increase_quantity}
    END

Diminuir quqntidade de produto selecionado
    FOR    ${i}    IN RANGE    2
        Click    ${btn_decrease_quantity}
    END

#VERIFICAR POR QUE DÁ ERRO
Validar tela visíveis
    Get Text     ${txt_principal}    contains     Serverest Store
    Wait For Elements State     ${a_home}       visible     ${IMPLICIT_TIMEOUT}
    Wait For Elements State     ${a_lista_compras}       visible     ${IMPLICIT_TIMEOUT}
    Wait For Elements State     ${a_carrinho}       visible     ${IMPLICIT_TIMEOUT}
    