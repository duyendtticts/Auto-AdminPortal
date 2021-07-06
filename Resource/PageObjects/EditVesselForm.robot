*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Variables    ../WebElements/shipOwnersElements.py
Variables    ../WebElements/vesselElements.py
Resource    ../CommonFiles/CommonFunctions.robot

*** Variables ***


*** Keywords ***
Clear email value
    wait until element is visible       ${emailInput}
    #Clear Element Text                  ${emailInput}
    Clear Text Field                    ${emailInput}

Edit email field of Vessel
    [Arguments]      ${inputData}
    Clear email value
    input text       ${emailInput}       ${inputData}
    mouse out        ${emailInput}
    User click Submit button    #show confirm popup
    User click Confirm button