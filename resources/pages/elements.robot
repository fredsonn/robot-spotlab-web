*** Variables ***

### Login page
${INPUT_EMAIL}                id:email
${BUTTON_LOGIN}               css:button[type=submit]
${DIV_ALERTA}                 class:alert

### Spot page
${DIV_DASHBOARD}              class:dashboard
${INPUT_FOTO}                 css:#thumbnail input
${INPUT_EMPRESA}              css:input[placeholder*=empresa]
${INPUT_TECNOLOGIAS}          id:techs
${INPUT_VALOR}                css:input[placeholder^=Valor]
${BUTTON_CADASTRAR}           //button[contains(text(),'Cadastrar')]
${LI_SPOT_ITEM}               css:.spot-list li 
${UL_SPOT_LIST}               css:.spot-list