*** Settings ***
Documentation   Cenários de Lista de Compras

Resource        ../resources/actions/autenticacao/login.actions.robot
Resource        ../resources/actions/produtos/shopping.actions.robot
Resource        ../resources/actions/produtos/search.actions.robot

Resource        ../resources/support/base.robot
Resource        ../resources/support/common_keywords.robot

Suite Setup     Carregar dados de usuários estáticos

Test Setup      Start application
Test Teardown   Take Screenshot

*** Test Cases ***
Direcionamento da tela de lista de compras
    [Documentation]    Esse teste valida a tela se estão visíveis
    Fazer login com       ${static_users["teste"]["email"]}       ${static_users["teste"]["senha"]}
    Apontamento do lista de compra

Direcionamento da lista de comprar para página principal e adicionar
    [Documentation]    Esse teste valida para págian inicial e adicionar
    Fazer login com       ${static_users["teste"]["email"]}       ${static_users["teste"]["senha"]}
    Apontamento do lista de compra
    Validação de pagina inicial para adicionar
    Limpa lista da compra
    