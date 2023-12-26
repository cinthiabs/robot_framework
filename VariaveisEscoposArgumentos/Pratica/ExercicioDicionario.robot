*** Settings ***
Documentation   Exercício proposto
*** Variable ***
&{MES}   Janeiro=31  Fevereiro=29  Março=31  Abril=30  Maio=31  Junho=30  Julho=31   Agosto=31  Setembro=30  Outubro=31  Novembro=30  Dezembro=31 

*** Test Cases ***
Caso de teste
    Imprimir Ano

*** Keywords ***
Imprimir Ano
    Log To Console  Quantidade de dias Janeiro 2023: ${MES.Janeiro} 
    Log To Console  Quantidade de dias Fevereiro 2023: ${MES.Fevereiro} 
    Log To Console  Quantidade de dias Março 2023: ${MES.Março} 
    Log To Console  Quantidade de dias Abril 2023: ${MES.Abril} 
    Log To Console  Quantidade de dias Maio 2023: ${MES.Maio}  
    Log To Console  Quantidade de dias Junho 2023: ${MES.Junho} 
    Log To Console  Quantidade de dias Julho 2023: ${MES.Julho} 
    Log To Console  Quantidade de dias Agosto 2023: ${MES.Agosto} 
    Log To Console  Quantidade de dias Setembro 2023: ${MES.Setembro} 
    Log To Console  Quantidade de dias Outubro 2023: ${MES.Outubro} 
    Log To Console  Quantidade de dias Novembro 2023: ${MES.Novembro} 
    Log To Console  Quantidade de dias Dezembro 2023: ${MES.Dezembro} 
   