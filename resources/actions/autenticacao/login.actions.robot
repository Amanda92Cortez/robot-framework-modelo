*** Settings ***
Documentation           Ações da Funcionalidade de Login

Resource        ../../support/base.robot

Library    Browser

*** Variables ***
${inp_email}            [data-testid="email"]
${inp_password}         [data-testid="senha"]
${btn_submit_login}     [data-testid="entrar"]
${btn_register}         [data-testid="cadastrar"]
${img_logo}             xpath=//*[@id="root"]/div/div/form/img
${txt_error}            //*[@id="root"]/div/div/form/div[1]
${btn_logout}           [data-testid="logout"]
${txt_login}            //h1[@class='font-robot'][contains(.,'Login')]

${h1_user_name}         css=h1

*** Keywords ***
Acessar login
    Go To    ${BASE_URL}/login    ${IMPLICIT_TIMEOUT}
    
Fazer login com
    [Arguments]     ${email}          ${password}
    Fill Text       ${inp_email}      ${email}
    Fill Text       ${inp_password}   ${password}
    Click           ${btn_submit_login}

Validar login com sucesso
    [Arguments]    ${message}
    Wait For Elements State     ${btn_logout}       visible     ${IMPLICIT_TIMEOUT}
    ${element_text}=    Get Text                    ${h1_user_name}
    Should Contain    ${element_text}    ${message}


Deslogar do site
    Click        ${btn_logout}
    Get Text     ${txt_login}    contains    Login


# FAZER TESTE DE LOGIN INVÁLIDO
# Validar login com falha
#     Wait For Elements State     ${txt_error}        visible         ${IMPLICIT_TIMEOUT}
#     Get Text    selector=${txt_error}    contains    error

# Realizar login inválido
#     [Arguments]     ${email}    ${password}
#     Fazer login Com          ${email}     ${password}
#     Validar login com falha
