*** Settings ***

Resource           base.robot
Resource           ../resources/services.robot

*** Variables ***

${valor}                                ${EMPTY}

*** Keywords ***

### Spot steps

Dado que estou logado como ${email}

    base.Abrir navegador
    Input Text                          ${INPUT_EMAIL}                            ${email}
    Click Element                       ${BUTTON_LOGIN} 
    Page Should Contain Element         ${DIV_DASHBOARD}

E que eu tenho um spot disponível na empresa "${empresa}"

    Set Test Variable                   ${empresa}
    Remove Company                      ${empresa}

E este spot possui a imagem "${imagem}"

    Set Test Variable                   ${imagem}

E usamos as seguintes tecnologias "${tecnologias}"

    Set Test Variable                   ${tecnologias}

E o valor da diária é de "${valor}" reais

    Set Test Variable                   ${valor}

Quando eu faço o cadastro deste spot

    Click Link                          /new   
    Run Keyword if                      "${imagem}"                        
    ...                                 Choose file                         ${INPUT_FOTO}                ${CURDIR}/images/${imagem}
    
    Input Text                          ${INPUT_EMPRESA}                    ${empresa}
    Input Text                          ${INPUT_TECNOLOGIAS}                ${tecnologias}
    Input Text                          ${INPUT_VALOR}                      ${valor}
    Click Element                       ${BUTTON_CADASTRAR}

Quando eu faço o cadastro deste spot sem foto

    Click Link                          /new              
    Input Text                          ${INPUT_EMPRESA}                    ${empresa}
    Input Text                          ${INPUT_TECNOLOGIAS}                ${tecnologias}
    Input Text                          ${INPUT_VALOR}                      ${valor}
    Click Element                       ${BUTTON_CADASTRAR}


Então devo ver o spot no dashboard

    Wait Until Element Is Visible       ${LI_SPOT_ITEM}   
    Element Should Contain              ${UL_SPOT_LIST}                     ${empresa}

E o valor da diária "${valor}"

    Element Should Contain              ${UL_SPOT_LIST}                     ${valor}

Dado que a conta "${email}" possui 4 spots 

    Set Suite Variable                  ${email}
    Set Token                           ${email}
    Save spot list                      full_spots.json

Quando eu acesso o dashboard

    Dado que estou logado como ${email}

Então devo ver a seguinte mensagem "${expect_message}"

    Page Should Contain Element             //button[contains(text(),'${expect_message}')]
    

