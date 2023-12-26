*** Settings ***
Documentation   Exercicios com argumentos
Library   String
*** Variable ***
&{DADOS}    nome=Cinthia   sobrenome=Barbosa   email=@outlook.com


*** Test Cases ***
Recebendo argumentos
   ${EMAIL}  Recebendo Dados    ${DADOS.nome}   ${DADOS.sobrenome}
   Log To Console   ${EMAIL}


*** Keywords ***
Recebendo Dados 
    [Arguments]       ${NOME}  ${SOBRENOME}
    ${ALEATORIA}      Generate Random String
    ${EMAIL}    Set Variable    ${NOME}${SOBRENOME}${ALEATORIA}${DADOS.email}
    [Return]   ${EMAIL}
 




