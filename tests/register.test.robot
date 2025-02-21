*** Settings ***
Documentation   Cenário de Registro na Aplicação do geral e administrador



Resource        ../resources/actions/autenticacao/register.actions.robot
Resource        ../resources/support/base.robot

Resource        ../resources/fixtures/Users.py

Test Setup      Start application
Test Teardown   Take Screenshot

*** Test Cases ***
Registrar usuário com dados aleatórios
    [Documentation]  Geral > Este teste preenche o formulário de registro com dados gerados aleatoriamente
    Clicar no botão de login    
    Preencher Formulário com Dados Aleatórios
    Submeter o Formulário
    # Verificar se o cadastro foi bem-sucedido
    Deslogar do site do registro

Registrar usuário com dados aleatórios administrador
    [Documentation]  Admin > Este teste preenche o formulário de registro com dados gerados aleatoriamente
    Clicar no botão de login    
    Preencher Formulário com Dados Aleatórios
    Marcar a opção de administrador
    Submeter o Formulário
    # Verificar se o cadastro foi bem-sucedido
    Deslogar do site do registro