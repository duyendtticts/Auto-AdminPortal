*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Variables    ../WebElements/shipOwnersElements.py
Variables    ../WebElements/vesselElements.py
Variables    ../WebElements/vesselDetailElements.py
Resource    ../CommonFiles/WaitKeywords.robot

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
    [Arguments]         ${inputValue}
    input text          ${emailInput}        ${inputValue}
    mouse out           ${emailInput}


Show success message
    [Documentation]
    [Arguments]    ${message}
    waitkeywords.wait for element visible    ${successPopup}
    element text should be      ${successPopup}     ${message}

Verify that ${fieldName} is updated with new value: ${inputData} successfully
    [Documentation]    email should be the edited value before
    ${fielValue}=    set variable       xpath://p[contains(text(), '${fieldName}')]/following::p[1]
    element text should be      ${fielValue}       ${inputData}

Verify that Transformation Date is updated with new value successfully
    [Documentation]    email should be the edited value before
    [Arguments]         ${transformationStartDate}
    element should contain      ${transformationStartDateValue}      ${transformationStartDate}