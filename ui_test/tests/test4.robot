*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem


*** Variables ***
${url}    https://as.com/resultados/futbol/bolivia_apertura/calendario/
${browser}    chrome
${output}    lista.json
*** Test Cases ***
Google
    Open Browser    ${url}    ${browser}
    maximize browser window
    click element    xpath://button/span[contains(text(), "Disagree and close")]
    ${main_path}=   set variable    //div[contains(@class,'cont-modulo resultados')]
    sleep    5
    ${main_div}=   Get WebElements    xpath:${main_path}
    ${fixture}=     create list
    FOR    ${elemento}    IN    ${main_div}
        ${number_match}   get text    xpath=${main_path}//h2/a
        ${date_match}  get text    xpath=${main_path}//h2/span
        log to console    ${date_match}
        ${table_path}   set variable    ${main_path}//div/table/tbody/tr
        ${table_match_rows}=   Get WebElements    xpath=${table_path}
        log to console    get length    ${table_match_rows}
        ${matches}  create list

            FOR    ${row}   IN     @{table_match_rows}

                ${team_a}=   get text    xpath=${table_path}//td[contains(@class,'col-equipo-local')]
                ${result_match}=   get text    xpath=${table_path}//td[contains(@class,'col-resultado')]
                ${team_b}=   get text    xpath=${table_path}//td[contains(@class,'col-equipo-visitante')]

                ${match}=    create dictionary    local=${team_a}   score=${result_match}  visita=${team_b}
                Append To List       ${matches}       ${match}
            END
        ${number_match}     create dictionary    number_match=${number_match}   date_match=${date_match} matches=${matches}
        Append To List     ${fixture}     ${number_match}

    END
    save to json    ${fixture}       ${output}

    close browser

*** Keywords ***

save to json
    [Arguments]    ${data}    ${filename}
    ${json}=    Evaluate    import json; json.dumps(${data}, indent=2, ensure_ascii=False)    modules=json
    Create File    ${filename}    ${json}