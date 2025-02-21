*** Settings ***
Resource  ../resources/1aula.resource


*** Test Cases ***
# Login com sucesso Serve Rest Front
#     Abrir o navegador
#     Ir para o site Serve Rest Front
#     Preencher os dados do novo usuário e cadastrar
#     Conferir usuário cadastrado com sucesso
#     Sleep    5s

Desafio: Conferir se o novo usuário é mostrado na listagem de usuários
    Cadastrar novo usuário
    Acessar a Lista de usuários
    # Conferir que o usuário aparece na listagem
    Sleep    5s