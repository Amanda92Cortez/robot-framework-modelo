*** Settings ***
Documentation           Ações da Funcionalidade da tela de Administrador

Resource        ../../support/base.robot

Library    Browser

*** Variables ***
#Navbar
${a_home}                [data-testid="home"]
${a_cadastro_usuario}    [data-testid="cadastrar-usuarios"]
${a_lista_usuario}       [data-testid="listar-usuarios"] 
${a_cadastro_produto}    [data-testid="cadastrar-produtos"]
${a_lista_produto}       [data-testid="listar-produtos"]
${a_relatorio}           [data-testid="link-relatorios"]

${p_page_admin}          //p[@class='lead'][contains(.,'Este é seu sistema para administrar seu ecommerce.')]


#Box
${txt_cadastro_usuario}    //h5[@class='card-title'][contains(.,'Cadastrar Usuários')]
${txt_lista usuario}       //h5[@class='card-title'][contains(.,'Listar Usuários')]
${txt_cadastro_produto}    //h5[@class='card-title'][contains(.,'Cadastrar Produtos')]
${txt_lista_produto}       //h5[@class='card-title'][contains(.,'Listar Produtos')]


*** Keywords ***
Acessar login
    Go To    ${BASE_URL}/login    ${IMPLICIT_TIMEOUT}

Validar textos estão visíveis
    Wait For Elements State     ${txt_cadastro_usuario}     visible     ${IMPLICIT_TIMEOUT}
    Wait For Elements State     ${txt_lista usuario}     visible     ${IMPLICIT_TIMEOUT}
    Wait For Elements State     ${txt_cadastro_produto}     visible     ${IMPLICIT_TIMEOUT}
    Wait For Elements State     ${txt_lista_produto}     visible     ${IMPLICIT_TIMEOUT}
