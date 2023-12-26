*** Settings ***
Documentation  Essa suite testa o site da Amazon
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

Suite Setup


*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu Eletrônicos do site Amazon.
    ...              e verifica a categoria Computadores e Informática.
    [Tags]           menus  categoria
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página



Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de produto
    [Tags]           busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

  