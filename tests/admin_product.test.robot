*** Settings ***

Documentation    Página principal como Administrador

Resource        ../resources/actions/autenticacao/login.actions.robot
Resource        ../resources/actions/page_admin/admin_product.actions.robot
Resource        ../resources/actions/autenticacao/api_autenticacao.actions.robot

Test Setup      Start application
Test Teardown   Take Screenshot


*** Test Cases ***
Acessar página Administrador
    [Documentation]    Esse teste valida a tela login administrador
    Buscar usuario cadastrado na base
    Fazer login com       ${user_data["email"]}       ${user_data["password"]}
    Clicar na área de cadastro do produto
    Preencher formulário do produto
    Submeter o formulário
