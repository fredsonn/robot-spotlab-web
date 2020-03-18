*** Settings ***
Resource           base.robot

*** Keywords ***

### Login Steps

Dado que "${email}" é o meu email

    Set Global Variable                 ${email}     

Quando entro com este email

    Input Text                          ${INPUT_EMAIL}                           ${email}
    Click Element                       ${BUTTON_LOGIN}

Então devo ver a área logada

    Page Should Contain Element         ${DIV_DASHBOARD}   
