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
    ${body}  Create Dictionary  
    ...  nome=Fulano da Silva  
    ...  email=${EMAIL_TESTE}  
    ...  password=1234  
    ...  administrador=true
    
    Criar Sessão na ServerRest
    ${Resposta}  POST On Session  alias=ServerRest   url=/usuarios  json=${body}
    Log    ${Resposta.json()}
    Set Test Variable    ${RESPOSTA}   ${Resposta.json()}
    
Criar Sessão na ServerRest 
    ${headers}  Create Dictionary  accept=application/json   Content-Type=application/json
    Create Session    alias=ServerRest    url=https://serverest.dev  headers=${headers}

Conferir se o usuário foi cadastrado corretamente
  
    Dictionary Should Contain Item  ${RESPOSTA}   message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}    _id