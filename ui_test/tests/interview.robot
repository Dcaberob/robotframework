*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://todo.ly/api
${USERNAME}    test010788@gmail.com
${PASSWORD}    das123

*** Test Cases ***
Get Projects List
    &{headers}=     Create dictionary   Content-Type=application/json
    &{body}=        Create dictionary   email=${USERNAME}            password=${PASSWORD}
    Create Session    todo    ${BASE_URL}    auth=${body}
    ${response}=    GET    https://todo.ly/api/projects.json
    Should Be Equal As Strings    ${response.status_code}    200
    BuiltIn.log to console    ${response}