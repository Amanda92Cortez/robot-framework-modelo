*** Settings ***
Documentation           Ações da Funcionalidade da tela de Administrador


Library         Browser
Library         ../../fixtures/Users.py   # Biblioteca Python que gera os dados aleatórios
Resource        ../../support/base.robot


*** Variables ***
#Navbar
${a_home}                [data-testid="home"]
${a_cadastro_usuario}    [data-testid="cadastrar-usuarios"]
${a_lista_usuario}       [data-testid="listar-usuarios"] 
${a_cadastro_produto}    [data-testid="cadastrar-produtos"]
${a_lista_produto}       [data-testid="listar-produtos"]
${a_relatorio}           [data-testid="link-relatorios"]

${p_page_admin}          //p[@class='lead'][contains(.,'Este é seu sistema para administrar seu ecommerce.')]

${inp_nome_user}               [data-testid="nome"]
${inp_email_user}              [data-testid="email"]
${inp_password_ser}           [data-testid="password"]
${inp_check_admin}        [data-testid="checkbox"]
${btn_create_user}        [data-testid="cadastrarUsuario"]

#Segundo Usuário da lista, pra fazer simulação de exclusão do usuário
${btn_excluir_user}       (//button[@type='button'][contains(.,'Excluir')])[2] 


*** Keywords ***

Cadastrar usuario pelo administrador
    Click    ${a_cadastro_usuario}

Preencher Formulário com dados aleatórios
    ${usuario}=    Generate Random User
    Log            ${usuario}    # Log dos dados gerados para depuração
    Fill Text      ${inp_nome_user}         ${usuario['nome']}
    Fill Text      ${inp_email_user}        ${usuario['email']}
    Fill Text      ${inp_password_ser}     ${usuario['password']}

Submeter o formulário
    Click          ${btn_create_user}

Excluir usuario
    Click    ${btn_excluir_user}
