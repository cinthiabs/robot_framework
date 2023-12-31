*** Setting ***
Library  SeleniumLibrary
Library    XML

*** Variables ***
${BROWSER}               chrome
${URL}                   https://www.amazon.com.br
${MENU_ELETRONICOS}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
*** Keywords ***
Abrir o navegador 
    Open Browser  browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go to    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS} 
Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS} 

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE} 
    Wait Until Element Is Enabled   locator=${MENU_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}" 
    Element Should Be Visible  locator=//a[@aria-label='${NOME_CATEGORIA}']
                            

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible   locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]

# Exercio Prosposto 

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=//img[@alt="${PRODUTO}"]
    Wait Until Element Is Visible    locator=//input[@name='submit.add-to-cart']
    Click Element    locator=//input[@name='submit.add-to-cart']

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
   # Click Element    locator=//a[contains(.,'Carrinho')]
   # Wait Until Element Is Visible   locator=//input[contains(@name,'proceedToRetailCheckout')]
   # Element Should Be Visible    locator= (//span[@class='a-truncate-cut'])[1]
    
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Carrinho de compras')]
    Element Should Be Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]


Remover o produto "Console Xbox Series S" do carrinho
    Click Element   locator=//input[contains(@name,'submit.delete.2f9cef66-9508-4e91-9dba-d92db30a81f6')]
    
Verificar se o carrinho fica vazio
    Element Should Be Visible    locator=//div[@class='a-padding-medium'][contains(.,'foi removido de Carrinho de compras.')]
# Exercio Prosposto

# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se aparece a frase "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S" 

# GHERKIN STEPS

# GHERKIN STEPS Pratica
Quando adicionar o produto "${PRODUTO}" no carrinho
    Adicionar o produto "${PRODUTO}" no carrinho    

Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

E existe o produto "${PRODUTO}" no carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho
Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
# GHERKIN STEPS Pratica
