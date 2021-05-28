*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Variables    ../WebElements/shipOwnersElements.py
Variables    ../WebElements/vesselElements.py
Resource    ../CommonFiles/CommonFunctions.robot

*** Variables ***


*** Keywords ***
Get value of field in Update form
    [Documentation]    Return fieldValueOnUpdateForm - value in the given field
    [Arguments]    ${fieldName}
    ${fieldLocation}=   set variable    xpath://span[contains(text(),'${fieldName}')]/ancestor::div[2]
    Retry to verify element 3 times     ${fieldLocation}
    Get text    ${fieldLocation}
    ${fieldValue}=   set suite variable    ${fieldLocation}
    [Return]    ${fieldValueOnUpdateForm}



Get the name of Vessel


Get the Transformation Start Date of Vessel


Get the Active Stock Recon Schedule


Edit email field
    [Documentation]     input value into Email field
    [Arguments]        ${inputValue}
    input text      ${emailInput}        ${inputValue}