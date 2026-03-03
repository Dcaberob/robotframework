*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://bugblog-kriy.vercel.app/
${browser}    chrome
*** Test Cases ***
loggin correct
    Open Browser    ${url}    ${browser}
    maximize browser window
    Execute JavaScript    window.scrollTo(0, 200)
    sleep    3
    click element    xpath: //a[contains(text(), 'Quiero ser Dev')]
#    reload page
#    Execute JavaScript    window.scrollTo(0, 500)
#    sleep    5
#    reload page
#    Execute JavaScript    window.scrollTo(0, 500)
#    sleep    10
#    reload page
#    Execute JavaScript    window.scrollTo(0, 500)
    sleep    10
#    input text    id:username    student
#    input text    id:password    Password123
#    click element    id:submit
#    sleep    2
#    ${login}    Get Text    class:post-title
#    should be equal     ${login}     Logged In Successfully


#    close browser

*** Keywords ***

