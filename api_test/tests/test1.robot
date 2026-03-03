*** Settings ***
Library           RequestsLibrary
Library           Collections
Resource          ../resources/keywords.robot

*** Test Cases ***
Get Posts
    Get Posts Should Return 200

*** Keywords ***
Get Posts Should Return 200
    [Arguments]    ${url}=https://jsonplaceholder.typicode.com/posts
    ${response}    RequestsLibrary.GET    ${url}
    Should Be Equal As Numbers  ${response.status_code}  200
    Log  ${response.json()}
