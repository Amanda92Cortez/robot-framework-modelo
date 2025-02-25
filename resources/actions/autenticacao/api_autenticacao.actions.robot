* Settings *
Documentation     Ações da Funcionalidade de Registro

Library           RequestsLibrary
Library           Collections


Resource          ../../support/base.robot

* Keywords *
Cadastrar usuário válido
    [Documentation]     Cria usuário API após registrar usuário
    [Arguments]     ${email}    ${password}
    ${response}=    Post Request    ${BASE_URL}    /usuarios    json={"email": "${email}", "password": "${password}"}
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal As Strings    ${status_code}    201

    ${token}=    Get From Dictionary    ${response.json()}    token
    Log    Token obtido: ${token}
    Set Global Variable    ${token}


Buscar usuario cadastrado na base
    [Documentation]     BUsca o primeiro usuario na rota /usuarios
    ${response}=    GET    ${BASE_URL_API}/usuarios    expected_status=200
    ${users_list}=     Get From Dictionary    ${response.json()}    usuarios
    ${quantity}=     Get From Dictionary    ${response.json()}    quantidade
    Should Be True    ${quantity} > 0
    ${first_user}=    Get From List      ${users_list}    0
    Set Global Variable   ${user_data}    ${first_user}

Buscar usuario cadastrado na base usuario simples
    [Documentation]     BUsca o primeiro usuario na rota /usuarios
    ${response}=    GET    ${BASE_URL_API}/usuarios    expected_status=200
    ${users_list}=     Get From Dictionary    ${response.json()}    usuarios
    ${quantity}=     Get From Dictionary    ${response.json()}    quantidade
    Should Be True    ${quantity} > 0
    ${first_user}=    Get From List      ${users_list}    1
    Set Global Variable   ${user_data}    ${first_user}