*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://as.com/resultados/futbol/bolivia_apertura/calendario/
${browser}    chrome
${OUTPUT_JSON}    partidos.json
*** Test Cases ***
loggin correct
    Open Browser    ${url}    ${browser}
    maximize browser window
    click element    xpath://button/span[contains(text(), "Disagree and close")]
    sleep    5
    ${number_match}   Get Text     xpath://div[contains(@class,'cont-modulo resultados')]/h2/a
    ${match_date}   Get Text     xpath://div[contains(@class,'cont-modulo resultados')]/h2/span
    ${elementos}    Get WebElements    xpath://span[contains(@class,'nombre-equipo')]
    FOR    ${elemento}    IN    @{elementos}
        ${nombreequipo}=   Get Text    ${elemento}
        Log     ${nombreequipo}
        Log     "--------"
    END
    close browser

#username
#    Open Browser    ${url}    ${browser}
#    maximize browser window
#    sleep    3
#    input text    id:username    error
#    input text    id:password    error
#    click element    id:submit
#    sleep    2
#    ${error}    Get Text    id:error
#    should be equal     ${error}     Your username is invalid!
#
#    close browser
#
#error password
#    Open Browser    ${url}    ${browser}
#    maximize browser window
#    sleep    3
#    input text    id:username    student
#    input text    id:password    error
#    click element    id:submit
#    sleep    2
#    ${error}    Get Text    id:error
#    should be equal     ${error}     Your password is invalid!
#
#    close browser
#

*** Keywords ***

