*** Settings ***
### relação com confirgurações
Library    SeleniumLibrary

*** Variables ***
${Variavel1}    teste 
${Variavel2}    1111 

*** Keywords ***
abrir site da globo
    Open Browser  https://www.google.com.br/  chrome
fechar navegador
    Close Browser
*** Test Cases ***
#sprint de testes

Cenário 1: Abrir navegador
    abrir site da globo
    fechar navegador


Cenário 2: Site Globo
    Open Browser  https://www.globo.com/  chrome
    Close Browser