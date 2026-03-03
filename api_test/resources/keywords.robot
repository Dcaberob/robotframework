*** Settings ***
Library           Collections

*** Keywords ***
Get Request
    [Arguments]    ${url}
    ${response}=   Get Request    ${url}
    [Return]       ${response}
