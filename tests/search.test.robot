*** Settings ***
Documentation   Cenários de Busca por Produtos

Resource        ../resources/actions/autenticacao/login.actions.robot
Resource        ../resources/actions/autenticacao/api_autenticacao.actions.robot
Resource        ../resources/actions/produtos/search.actions.robot
Resource        ../resources/support/base.robot


Test Setup      Start application
Test Teardown   Take Screenshot


*** Test Cases ***
Validação de tela principal
    [Documentation]    Esse teste valida a tela se estão visíveis
    #Executar para criar o usuario geral para fazer teste de pesquisa do produto
    Buscar usuario cadastrado na base usuario simples
    Fazer login com       ${user_data["email"]}       ${user_data["password"]}

Deve buscar por produtos e adição no carrinho
    [Documentation]    Esse teste localiza o produto e validando os produtos estão visíveis
    #Executar para criar o usuario geral para fazer teste de pesquisa do produto
    Buscar usuario cadastrado na base usuario simples
    Fazer login com       ${user_data["email"]}       ${user_data["password"]}
    Procurar por    Logitec
    Produtos deverão estar visíveis
    Adicionar no carrinho
    Aumentar quantidade de produto selecionado
    Diminuir quqntidade de produto selecionado


Deve trazer mensagem de produtos não encontrados
    [Documentation]    Esse teste localiza o produto não existe  e validando produtos estão visiveis
    #Executar para criar o usuario geral para fazer teste de pesquisa do produto
    Buscar usuario cadastrado na base usuario simples
    Fazer login com       ${user_data["email"]}       ${user_data["password"]}
    Procurar por    não existe
    Produtos deverão estar visíveis
