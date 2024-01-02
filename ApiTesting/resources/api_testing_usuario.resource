*** Settings ***
Library   RequestsLibrary
Library   String
Library    Collections

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}   Generate Random String  length=4  chars=[LETTERS]
    ${palavra_aleatoria}   Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable     ${EMAIL_TESTE}  ${palavra_aleatoria}@email.com 
    Log    ${EMAIL_TESTE}

Cadastrar o usuário criado na ServerRest
    [Arguments]  ${email}  ${status_code_desejado}
    ${body}  Create Dictionary  
    ...  nome=Fulano da Silva  
    ...  email=${EMAIL_TESTE}  
    ...  password=1234  
    ...  administrador=true
    
    Criar Sessão na ServerRest
    ${Resposta}  POST On Session  alias=ServerRest   url=/usuarios  json=${body}  expected_status=${status_code_desejado}  #expected status valida o retorno da minha api
    Log    ${Resposta.json()}
    Set Test Variable    ${RESPOSTA}   ${Resposta.json()}
    
Criar Sessão na ServerRest 
    ${headers}  Create Dictionary  accept=application/json   Content-Type=application/json
    Create Session    alias=ServerRest    url=https://serverest.dev  headers=${headers}

Conferir se o usuário foi cadastrado corretamente
  
    Dictionary Should Contain Item  ${RESPOSTA}   message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}    _id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServerRest   email=${EMAIL_TESTE}  status_code_desejado=400
Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item  ${RESPOSTA}  message  Este email já está sendo usado