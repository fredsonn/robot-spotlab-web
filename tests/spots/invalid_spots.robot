*** Settings ***
Documentation       Spots
...
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas

Resource            ../../resources/spot_steps.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador
Test Template       Spot inválido

*** Test Cases ***                  empresa                           foto              tecnologias          valor      alerta 

Spot sem foto da empresa            Empresa sem foto                  ${EMPTY}           react, node         15         Precisamos da foto da sua empresa!  

Spot sem nome da empresa            ${EMPTY}                          acme.jpg           node, python        15         O nome da sua empresa é obrigatório!

Spot sem tecnologias                Empresa sem tecnologias           default.jpg        ${EMPTY}            25         Informe pelo menos uma tecnologia :)

   
*** Keywords ***

Spot inválido

    [Arguments]         ${empresa}          ${imagem}           ${tecnologias}          ${valor}          ${alerta}

    Dado que estou logado como "1@1.com"
    E que eu tenho um spot disponível na empresa "${empresa}"
    E este spot possui a imagem "${imagem}"
    E usamos as seguintes tecnologias "${tecnologias}"
    E o valor da diária é de "${valor}" reais
    Quando eu faço o cadastro deste spot
    Então devo ver o alerta "${alerta}"
