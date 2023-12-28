*** Settings ***
Documentation   Exericio proposto IF e For
*** Variables ***
@{Numeros}   1  2  3  4  5  6  7  8  9  10

*** Test Case ***
Lista com For
    UsandoFor


*** Keywords ***
UsandoFor
  FOR    ${n}    IN   @{Numeros}
      IF  ${n} == 5
          Log To Console    Eu sou o número 5!
      ELSE IF  ${n} == 10
          Log To Console    Eu sou o número 10!
      ELSE
          Log To Console    Eu não sou o número 5 e nem o 10!
      END
  END
