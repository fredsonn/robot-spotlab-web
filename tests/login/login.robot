*** Settings ***
Documentation       Sessão
...
...     Para que eu possa ter acesso à interface de administração de spots
...     Sendo um usuário que possui um email
...     Quero poder iniciar uma nova sessão
Resource            ../../resources/login_steps.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***

Nova Sessão

    Dado que "1@1.com" é o meu email
    Quando entro com este email
    Então devo ver a área logada

Email incorreto

    [Template]      Tentativa de login
    1&1.com         Oops. Informe um email válido!    

Email não informado

    [Template]      Tentativa de login
    ${EMPTY}        Oops. Informe um email válido!
    
*** Keywords ***
Tentativa de login

    [Arguments]         ${email}            ${alerta}
    Dado que "${email}" é o meu email
    Quando entro com este email
    Então devo ver o alerta "${alerta}"
