*** Settings ***
Documentation     Ações da Funcionalidade de Registro

Library    Browser
Library    RequestsLibrary
Library    Collections
Library    ../../fixtures/Product.py   # Biblioteca Python que gera os dados aleatórios

Resource          ../../support/base.robot

*** Variables ***
${a_cadastro_produto}    [data-testid="cadastrar-produtos"]
${inp_product}        [data-testid="nome"]
${inp_preco}          [data-testid="preco"]
${inp_descricao}      [data-testid="descricao"]
${inp_quantidade}     [data-testid="quantity"]
${btn_cad_product}    [data-testid="cadastarProdutos"]


*** Keywords ***
Clicar na área de cadastro do produto
    Click    ${a_cadastro_produto}
Preencher formulário do produto
    ${product}=    generate_random_product
    Log            ${product}    # Log dos dados gerados para depuração
    Fill Text      ${inp_product}         ${product['nome']}
    Fill Text      ${inp_preco}        ${product['preco']}
    Fill Text      ${inp_descricao}     ${product['descricao']}
    Fill Text      ${inp_quantidade}     ${product['quantidade']}

Submeter o formulário
    Click          ${btn_cad_product}
