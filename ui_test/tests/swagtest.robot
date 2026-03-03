*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}     https://www.saucedemo.com/
${browser}    chrome
*** Test Cases ***
Google
    Open Browser    ${url}    ${browser}
    maximize browser window
    sleep    3
    input text    id:user-name    standard_user
    input text    id:password    secret_sauce
    sleep    2

    click element    id:login-button
    sleep    2
#    click element
#    input text    id:NewItemContentInput    interview Test
#
#    get element attribute

    close browser

*** Keywords ***

