*** Settings ***
Documentation   Cenário de Login na Aplicação

Resource        ../resources/actions/autenticacao/login.actions.robot
Resource        ../resources/actions/autenticacao/api_autenticacao.actions.robot
Resource        ../resources/support/base.robot
Resource        ../resources/support/axe-core.robot

Test Setup      Start application
Test Teardown   Take Screenshot


*** Test Cases ***
Deve realizar login com sucesso
    [Documentation]        Esse teste para realizar login e deslogar a aplicação
    Buscar usuario cadastrado na base 
    Fazer login com       ${user_data["email"]}       ${user_data["password"]}
    Validar login com sucesso     Bem Vindo ${user_data["nome"]}

    # Acessibilidade
    Generate Axe Results

    Deslogar do site
    
# VALIDAR NOVAMENTE, POR CAUSA DA CAIXA DE MENSAGEM DE "ERRO"
#  Não deve fazer login com dados inválidos
#     [Template]            Realizar login inválido
#     ${static_users["invalido"]["email"]}    ${static_users["invalido"]["senha"]} 
#     ${static_users["valido"]["email"]}      ${static_users["invalido"]["senha"]}
#     ${static_users["invalido"]["email"]}    ${static_users["valido"]["senha"]}
#     ${static_users["valido"]["email"]}      ${EMPTY}
#     ${EMPTY}                                ${static_users["valido"]["senha"]}