*** Settings ***
Documentation   Exercício proposto
*** Variable ***
@{MES}   Janeiro  Fevereiro  Março  Abril  Maio  Junho  Julho   Agosto  Setembro  Outubro  Novembro  Dezembro 

*** Test Cases ***
Caso de teste
    Imprimir Ano

*** Keywords ***
Imprimir Ano
    Log To Console  MÊS ${MES[0]}
    Log To Console  MÊS ${MES[1]}
    Log To Console  MÊS ${MES[2]}
    Log To Console  MÊS ${MES[3]}
    Log To Console  MÊS ${MES[4]}
    Log To Console  MÊS ${MES[5]}
    Log To Console  MÊS ${MES[6]}
    Log To Console  MÊS ${MES[7]}
    Log To Console  MÊS ${MES[8]}
    Log To Console  MÊS ${MES[9]}
    Log To Console  MÊS ${MES[10]}
    Log To Console  MÊS ${MES[11]}
   