*** Settings ***

Documentation    Página principal como Administrador

Resource        ../resources/actions/autenticacao/login.actions.robot
Resource        ../resources/actions/page_admin/home.admin.actions.robot

Resource        ../resources/support/common_keywords.robot

Suite Setup     Carregar dados de usuários estáticos

Test Setup      Start application
Test Teardown   Take Screenshot


*** Test Cases ***
Acessar página Administrador
    Fazer login com       ${static_users["valido"]["email"]}       ${static_users["valido"]["senha"]}
    Deslogar do site

Validando a tela de administrador
    Fazer login com       ${static_users["valido"]["email"]}       ${static_users["valido"]["senha"]}
    Validar textos estão visíveis