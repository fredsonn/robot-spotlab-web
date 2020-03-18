*** Settings ***
Documentation       Spots
...
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas

Resource            ../../resources/spot_steps.robot 

Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***

Novo spot 

    Dado que estou logado como "1@1.com"
    E que eu tenho um spot disponível na empresa "Gauge"
    E este spot possui a imagem "google.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diária é de "10" reais
    Quando eu faço o cadastro deste spot
    Então devo ver o spot no dashboard
    E o valor da diária "R$10/dia"

Spot gratuito

    Dado que estou logado como "1@1.com"
    E que eu tenho um spot disponível na empresa "Gauge 2"
    E este spot possui a imagem "acme.jpg"
    E usamos as seguintes tecnologias "react"
    Quando eu faço o cadastro deste spot
    Então devo ver o spot no dashboard
    E o valor da diária "GRATUITO"

Limite de spots atingido

    [Tags]          limite

    Dado que a conta "2@2.com" possui 4 spots    
    Quando eu acesso o dashboard
    Então devo ver a seguinte mensagem "Você pode cadastrar até 4 spots"
