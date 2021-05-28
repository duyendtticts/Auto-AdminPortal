*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library    String
Resource  ../../TestData/config.robot
Resource    CommonFunctions.robot
Resource    GetKeywords.robot

*** Variables ***

*** Keywords ***
Input email value
    [Arguments]     ${inputField}       ${typeOfEmail}
    ${randomString}=    generate random string    6     [NUMBERS]
    ${existedEmail}=    run keyword and return    Get value of a fieldName        ${firstEmailInList}
    ${validEmail}=              set variable    AutoTest_Email_${randomString}@${validDomain.domain2}
    ${invalidFormatOfEmail}=    set variable    AutoTest_Email_${randomString}${validDomain.domain2}
    ${invalidDomainEmail}=      set variable    AutoTest_Email_${randomString}@${invalidDomain}
    RUN KEYWORD IF          '${typeOfEmail}' == 'valid'     input text      ${inputField}       ${validEmail}
    ...         ELSE IF    '${typeOfEmail}' == 'invalid format'    input text      ${inputField}       ${invalidFormatOfEmail}
    ...         ELSE IF    '${typeOfEmail}' == 'invalid domain'    input text      ${inputField}       ${invalidDomainEmail}
    ...         ELSE IF     '${typeOfEmail}' == 'existed email'     input text      ${inputField}      ${existedEmail}
    ...         ELSE         fail        No result for this case
    mouse out    ${inputField}

