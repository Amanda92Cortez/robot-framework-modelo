*** Settings ***
Documentation       Arquivo base do projeto

Library             Browser     timeout=30s
# Library             robotframework.JsonLibrary



*** Variables ***
${IMPLICIT_TIMEOUT}       30
${BASE_URL}               https://front.serverest.dev
${BASE_URL_API}           https://serverest.dev/
#http://automationpractice.com/index.php
# ${AUTH_HEADER}    Bearer ${token}



*** Keywords ***
Start application
    New Browser           chromium        false
    New Page              ${BASE_URL}       
   #Set Viewport Size       1920    1080Clear caches and restart

# URL para tratamento de API no registro de usuário
#     ${BASE_URL}/usuarios