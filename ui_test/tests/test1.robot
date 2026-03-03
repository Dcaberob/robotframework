*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://todo.ly/
${browser}    chrome
*** Test Cases ***
Google
    Open Browser    ${url}    ${browser}
    maximize browser window
    sleep    3
    click element    class:HPHeaderLogin
    sleep    2
    input text    id:ctl00_MainContent_LoginControl1_TextBoxEmail    test@mod4.com
    input text    id:ctl00_MainContent_LoginControl1_TextBoxPassword    P@ssw0rd
    click element    id:ctl00_MainContent_LoginControl1_ButtonLogin
    sleep    2
    ${filters}    Get Text    id:TitleFilters
    click element    xpath://*[@id="ProjectListPlaceHolder"]/ul/li/div[@class="LiDiv BaseProjectLiDiv LeftLiDiv ProjectSelected"]/div

    should be equal     ${filters}     Filters
    close browser

*** Keywords ***

