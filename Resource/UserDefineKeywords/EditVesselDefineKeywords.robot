*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../WebElements/shipOwnersElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    ../CommonFiles/SetVariableKeywords.robot
Resource    CommonUserDefineKeywords.robot
Resource    ../PageObjects/VesselPage.robot
Resource    ../PageObjects/EditVesselForm.robot
Resource    ShipOwnersUserDefineKeywords.robot
Resource    VesselUserDefineKeywords.robot

*** Variables ***


*** Keywords ***
Email is updated successfully
    [Arguments]    ${inputEmail}
    Show success message    Vessel successfully updated.
    Verify that Email is updated with new value: ${inputEmail} successfully

Vessel is updated with new Transformation date successfully
    [Arguments]     ${transformationStartDate}
    Show success message    Vessel successfully updated.
    Verify that Transformation Date is updated with new value successfully  ${transformationStartDate}

User edit the email with empty email
    Clear email value

User edit with existed email on the list
    [Arguments]      ${inputData}
    Edit email field of Vessel        ${inputData}

User edit the email with valid email
    [Documentation]     edit new email with valid data
    Set Valid Email Value
    Clear email value
    Edit email field        ${validEmail}
    User click Submit button
    User click Confirm button
    set suite variable      ${validEmail}
    [Return]                ${validEmail}

User edit the email with negative case as: ${typeOfEmail}
    [Documentation]     keyword for typeof email: validEmail, invalidDomainEmail, invalidFormatEmail, lackOfDomain, existed Email
    Clear email value
    RUN KEYWORD IF      'lack' in '${typeOfEmail}' and 'domain' in '${typeOfEmail}'         Edit email value with invalid value    lackOfDomain
    ...    ELSE IF      'invalid' in '${typeOfEmail}' and 'domain' in '${typeOfEmail}'      Edit email value with invalid value    invalidDomainEmail
    ...    ELSE IF      'invalid' in '${typeOfEmail}' and 'format' in '${typeOfEmail}'      Edit email value with invalid value    invalidFormatEmail
    ...    ELSE         fail        Only process with keyword for email that contains: valid, invalid Domain, invalid format or lack of Domain
    run keyword if    '${typeOfEmail}'=='valid'         [Return]    ${inputEmail}

User will see the error message for email field as: "${errorMessage}"
    element text should be    ${emailErrorMessage}      ${errorMessage}

Clear data to reuse later
    [Documentation]    Set the email to other value
    User go to Vessel tab then open Edit form of first Vessel item     #edit the first item
    Edit email field of Vessel        test+001@es-sea.com

User edit Transformation Date value: ${transformationDateValue}
    User click Edit button
#    Click element       ${transformationStartDateField}
    User select the current date for Transformation Start Date
    User click Submit button
    User click Confirm button
    [Return]        ${currentDate}




