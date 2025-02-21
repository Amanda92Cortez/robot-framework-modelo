*** Settings ***
Documentation     Ações da Funcionalidade de Registro

Library    Browser
Library    RequestsLibrary
Library    Collections
Library    fixtures/Users.py    # Biblioteca Python que gera os dados aleatórios

Resource   support/base.robot

*** Variables ***
${BROWSER}           chromium
${HEADLESS}          ${false}
${SITE_SERVE_REST}   https://front.serverest.dev/


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
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    New Context    viewport={'width': 1200, 'height': 800}

Ir para o site Serve Rest Front
    New Page       url=${SITE_SERVE_REST}
    ${title}       Get Title  ==  Front - ServeRest
    Log  ${title}



# Clicar no botão de login
#     Click                       ${btn_create}

Preencher os dados do novo usuário e cadastrar
    Click       css=a[data-testid='cadastrar']
    ${usuario}=    Generate Random User
    Log            ${usuario}    # Log dos dados gerados para depuração
    Fill Text      ${inp_nome}         ${usuario['nome']}
    Fill Text      ${inp_email}        ${usuario['email']}
    Fill Text      ${inp_password}     ${usuario['password']}
    Check Checkbox  css=input[data-testid='checkbox']
    Click   xpath=//*[@id="root"]//button >> text="Cadastrar"

Conferir usuário cadastrado com sucesso
    Wait For Elements State    h1   visible
    # Get Text    h1  ==  Bem Vindo Mayara Fernandes
    # Captura o texto do elemento h1
    ${texto_h1}=    Get Text    h1
    # Verifica se o texto começa com "Bem Vindo"
    Should Start With    ${texto_h1}    Bem Vindo
    # Get Element States    css=button[data-testid='logout']  validate  value & visible

Cadastrar novo usuário
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar
    Conferir usuário cadastrado com sucesso

Acessar a Lista de usuários
    Click        css=a[data-testid='listarUsuarios']

# Conferir que o usuário aparece na listagem
    Get Text    ==    Fulano da Silva
    # ${elemento}      Get Table Cell Element    css=table    "Nome"    "${EMAIL}"
    # ${usuario_nome}  Get Text  ${elemento}  ==  Mayara Fernandes
    # Highlight Elements    ${elemento}
    # Take Screenshot       fullPage=${true}      


# Deslogar do site do registro
#     Click        ${btn_logout}
#     Get Text     ${txt_login}    contains    Login
