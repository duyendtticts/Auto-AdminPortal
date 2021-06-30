*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../WebElements/shipOwnersElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    ../CommonFiles/GetTasks.robot
Resource    CommonUserDefineKeywords.robot
Resource    ../PageObjects/VesselPage.robot
Resource    ../PageObjects/EditVesselForm.robot
Resource    ShipOwnersUserDefineKeywords.robot

*** Variables ***


*** Keywords ***
Email is updated successfully
    Show success message    Vessel successfully updated.
    Verify that email is updated with new value successfully    ${inputEmail}

User edit the email with empty email
    Clear email value

User edit with existed email on the list
    [Arguments]      ${inputData}
    Clear email value
    input text       ${emailInput}       ${inputData}
    mouse out        ${emailInput}
    User click Submit button    #show confirm popup
    User click Confirm button

User edit the email with value: ${typeOfEmail}
    [Documentation]     keyword for typeof email: validEmail, invalidDomainEmail, invalidFormatEmail, lackOfDomain, existed Email
    RUN KEYWORD IF      'lack' in '${typeOfEmail}' and 'domain' in '${typeOfEmail}'         Edit email value with email value    lackOfDomain
    ...    ELSE IF      'invalid' in '${typeOfEmail}' and 'domain' in '${typeOfEmail}'      Edit email value with email value    invalidDomainEmail
    ...    ELSE IF      'invalid' in '${typeOfEmail}' and 'format' in '${typeOfEmail}'      Edit email value with email value    invalidFormatEmail
    ...    ELSE IF      'valid' in '${typeOfEmail}'                                         Edit email value with email value    validEmail
    ...    ELSE         fail        Only process with keyword for email that contains: valid, invalid Domain, invalid format or lack of Domain
    [Return]    ${inputEmail}

User will see the error message for email field as: "${errorMessage}"
    element text should be    ${emailErrorMessage}      ${errorMessage}


