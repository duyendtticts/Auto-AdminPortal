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