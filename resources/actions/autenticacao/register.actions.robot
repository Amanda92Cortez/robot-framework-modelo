*** Settings ***
Documentation     Ações da Funcionalidade de Registro

Library    Browser
Library    RequestsLibrary
Library    Collections
Library    ../../fixtures/Users.py    # Biblioteca Python que gera os dados aleatórios

Resource          ../../support/base.robot

*** Variables ***
${btn_create}               [data-testid="cadastrar"]

${inp_nome}                 [data-testid="nome"]
${inp_email}                [data-testid="email"]
${inp_password}             [data-testid="password"]
${btn_submit_account}       [data-testid="cadastrar"]

${btn_logout}               [data-testid="logout"]
${txt_login}            //h1[@class='font-robot'][contains(.,'Login')]


${chck_admin}               [data-testid="checkbox"]
${txt_error}                css=button[data-dismiss="alert"]
${btn_logout}               [data-testid="logout"]
${alert_cadastro}           //div[@class='alert alert-dismissible alert-primary'][contains(.,'×Cadastro realizado com sucesso')]


* Keywords *
Clicar no botão de login
    Click                       ${btn_create}

Preencher formulário com dados aleatórios
    ${usuario}=    Generate Random User
    Log            ${usuario}    # Log dos dados gerados para depuração
    Fill Text      ${inp_nome}         ${usuario['nome']}
    Fill Text      ${inp_email}        ${usuario['email']}
    Fill Text      ${inp_password}     ${usuario['password']}

Submeter o formulário
    Click          ${btn_submit_account}

Deslogar do site do registro
    Click        ${btn_logout}
    Get Text     ${txt_login}    contains    Login
    
Marcar a opção de administrador
    Check Checkbox        ${chck_admin}
    Get Checkbox State    ${chck_admin}

# Quando executa vai muito rápido essa rotina 
# Verificar se o cadastro foi bem-sucedido
#     Wait For Elements State      ${alert_cadastro}    visible    ${IMPLICIT_TIMEOUT}
#     Get Text                     ${alert_cadastro}
#     Should Contain               ${alert_cadastro}    "Cadastro realizado com sucesso"

