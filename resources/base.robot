*** Settings ***
Library             SeleniumLibrary

Library            ./libs/mongo.py
Resource            pages/elements.robot

*** Keywords ***
### Hooks

Abrir navegador

    Open Browser                        about:blank       headlesschrome        options=add_argument("no-sandbox"); add_argument("disable-dev-shm-usage")
    Set Window Size                     1440              900
    Set Selenium Implicit Wait          10
    Go To                               http://spotlab.herokuapp.com/

Fechar navegador

    Capture Page Screenshot
    Close Browser


### Steps compartilhados

Então devo ver o alerta "${alerta}"

    Element Text Should Be              ${DIV_ALERTA}                        ${alerta}