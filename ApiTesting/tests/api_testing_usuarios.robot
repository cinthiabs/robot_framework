*** Settings ***
Resource  ../resources/api_testing_usuario.resource

*** Variables ***


*** Test Cases ***
Cenário 01: Cadastrar novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServerRest   email=${EMAIL_TESTE}  status_code_desejado=201
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário já existente
    Criar um usuário novo
    Cadastrar o usuário criado na ServerRest  email=${EMAIL_TESTE}  status_code_desejado=201
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repetido