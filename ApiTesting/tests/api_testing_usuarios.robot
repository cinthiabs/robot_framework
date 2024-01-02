*** Settings ***
Resource  ../resources/api_testing_usuario.resource

*** Variables ***


*** Test Cases ***
Cenário 01: Cadastrar novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServerRest
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário já existente