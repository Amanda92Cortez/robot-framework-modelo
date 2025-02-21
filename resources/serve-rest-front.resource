*** Settings ***
Library  Browser
# ...      timeout=00:00:05
# ...      enable_presenter_mode=${true}
# Library  FakerLibrary
Library    fixtures/Users.py    # Biblioteca Python que gera os dados aleatórios
Library    fixtures/Product.py   # Biblioteca Python que gera os dados aleatórios

Library  DateTime

Resource          support/base.robot

*** Variables ***
${BROWSER}           chromium
${HEADLESS}          ${true}
${SITE_SERVE_REST}   https://front.serverest.dev/


${inp_nome}                 [data-testid="nome"]
${inp_email}                [data-testid="email"]
${inp_password}             [data-testid="password"]

${a_cadastro_produto}    [data-testid="cadastrar-produtos"]
${inp_product}        [data-testid="nome"]
${inp_preco}          [data-testid="preco"]
${inp_descricao}      [data-testid="descricao"]
${inp_quantidade}     [data-testid="quantity"]
${btn_cad_product}    [data-testid="cadastarProdutos"]

*** Keywords ***
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    # ${TRACE_NAME}  FakerLibrary.Uuid 4
    ${NOW}         Get Current Date  result_format=%d-%m-%Y_%H%M%S
    New Context    viewport={'width': 1200, 'height': 800}
    # ...            tracing=${OUTPUT_DIR}/evidencies/traces/${NOW}/${TRACE_NAME}.zip
    # ...            recordVideo={'dir':'${OUTPUT_DIR}/evidencies/videos/${NOW}'}

Ir para o site Serve Rest Front
    New Page       url=${SITE_SERVE_REST}
    ${title}       Get Title  ==  Front - ServeRest
    Log  ${title}

Preencher os dados do novo usuário e cadastrar
    Click       css=a[data-testid='cadastrar']
    ${usuario}=    Generate Random User
    Log            ${usuario}    # Log dos dados gerados para depuração
    Fill Text      ${inp_nome}         ${usuario['nome']}
    Fill Text      ${inp_email}        ${usuario['email']}
    Fill Text      ${inp_password}     ${usuario['password']}
    Check Checkbox  css=input[data-testid='checkbox']
    # Click    css=button[data-testid='cadastrar']
    Click   xpath=//*[@id="root"]//button >> text="Cadastrar"

Conferir usuário cadastrado com sucesso
    Wait For Elements State    h1   visible
    # Get Text    h1  ==  Bem Vindo Mayara Fernandes
    # Get Element States    css=button[data-testid='logout']  validate  value & visible

Cadastrar novo usuário
    Abrir o navegador
    Ir para o site Serve Rest Front
    Preencher os dados do novo usuário e cadastrar
    Conferir usuário cadastrado com sucesso

# Acessar a Lista de usuários
#     Click        css=a[data-testid='listarUsuarios']

# Conferir que o usuário aparece na listagem
#     ${elemento}      Get Table Cell Element    css=table    "Nome"    "${EMAIL}"
#     ${usuario_nome}  Get Text  ${elemento}  ==  Mayara Fernandes
#     Highlight Elements    ${elemento}
#     Take Screenshot       fullPage=${true}

Cadastrar um novo produto
    Click              css=a[data-testid='cadastrarProdutos']
    ${product}=    generate_random_product
    Log            ${product}    # Log dos dados gerados para depuração
    Fill Text      ${inp_product}         ${product['nome']}
    Fill Text      ${inp_preco}        ${product['preco']}
    Fill Text      ${inp_descricao}     ${product['descricao']}
    Fill Text      ${inp_quantidade}     ${product['quantidade']}
    Click              text="Cadastrar"

Conferir que o produto aparece na listagem
#   ${elemento}   Get Table Cell Element    css=table    "Descrição"    "${NOME_PRODUTO}"
#   ${descricao}  Get Text  ${elemento}  ==  Produto Teste Robot Framework
#   Highlight Elements    ${elemento}
  Take Screenshot       fullPage=${true}