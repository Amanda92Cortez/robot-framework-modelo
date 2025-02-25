*** Settings ***

Documentation    Página principal como Administrador

Resource        ../resources/actions/autenticacao/login.actions.robot
Resource        ../resources/actions/page_admin/admin_users.actions.robot
Resource        ../resources/actions/autenticacao/api_autenticacao.actions.robot

Test Setup      Start application
Test Teardown   Take Screenshot


*** Test Cases ***
Acessar página Administrador
    [Documentation]    Esse teste valida a tela login administrador
    Buscar usuario cadastrado na base
    Fazer login com       ${user_data["email"]}       ${user_data["password"]}


Cadastrar usuario pelo administrador pela tela
    [Documentation]    Esse teste cadastrar usuario
    Buscar usuario cadastrado na base
    Fazer login com       ${user_data["email"]}       ${user_data["password"]}
    Cadastrar usuario pelo administrador
    Preencher Formulário com dados aleatórios
    Submeter o formulário
    Excluir usuario