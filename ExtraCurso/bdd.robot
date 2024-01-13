*** Settings ***
Library   SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
#dados do teste
${NomeDaMusica}    Ariana Grande - positions
#variaveis de condiguração
${url}  https://www.youtube.com/
${Browser}  chrome
#elementos
${inputPesquisa}    //input[contains(@autocapitalize,'none')]
${buttonPesquisa}   //button[@class='style-scope ytd-searchbox'][contains(.,'Pesquisar')]
${video}           //yt-formatted-string[@class='style-scope ytd-video-renderer'][contains(.,'${NomeDaMusica}')]
${videoExe}        //yt-formatted-string[@class='style-scope ytd-watch-metadata'][contains(.,'${NomeDaMusica}')]
*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser  ${url}  ${Browser}
Quando digito o nome da musica 
    Input Text    locator=${inputPesquisa}     text=${NomeDaMusica}
E clico no botão buscar
    Click Element    locator=${buttonPesquisa}  
E clico na primeira opção da Lista
    Wait Until Element Is Visible    locator=${video} 
    Click Element    locator=${video}
Então o video é executado
    Wait Until Element Is Visible   locator=${videoExe}  
    Element Should Be Visible  locator=${videoExe}  
    Sleep   1s
    Close Browser

*** Test Cases ***
Cenário 1: Executar video no site do youtube
    Dado que eu acesso o site do youtube
    Quando digito o nome da musica
    E clico no botão buscar
    E clico na primeira opção da Lista
    Então o video é executado