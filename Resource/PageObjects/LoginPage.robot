*** Settings ***
Library    SeleniumLibrary
Variables    ../WebElements/loginElements.py

*** Variables ***


*** Keywords ***
Input username
    [Arguments]     ${userName}
    Input Text     ${userNameField}     ${userName}

Input pwd
    [Arguments]    ${password}
    Input Password      ${passwordField}     ${password}

Click Sign In button
    Click Button        ${signInbutton}

Login to Admin Portal Successfully
    [Arguments]         ${username}         ${password}
    Input Password      ${userNameField}    ${username}
    Input Password      ${passwordField}    ${password}     clear: True
    Press Keys          ${signInbutton}     RETURN

