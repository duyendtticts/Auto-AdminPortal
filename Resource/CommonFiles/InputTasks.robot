*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library    String
Resource  ../../TestData/config.robot
Resource    CommonFunctions.robot
Resource    GetTasks.robot

*** Variables ***

*** Keywords ***
Input email value
    [Arguments]     ${inputField}       ${typeOfEmail}
    ${randomString}=    generate random string    6     [NUMBERS]
    ${existedEmail}=    run keyword and return    Get value of a fieldName        ${firstEmailInList}
    ${validEmail}=              set variable    AutoTest_Email_${randomString}@${validDomain.domain2}
    ${invalidFormatOfEmail}=    set variable    AutoTest_Email_${randomString}${validDomain.domain2}
    ${invalidDomainEmail}=      set variable    AutoTest_Email_${randomString}@${invalidDomain}
    ${lackOfDomain}=            set variable    AutoTest_Email_${randomString}@
    RUN KEYWORD IF         '${typeOfEmail}' == 'validEmail'                 input text      ${inputField}       ${validEmail}
    ...         ELSE IF    '${typeOfEmail}' == 'invalidFormatOfEmail'       input text      ${inputField}       ${invalidFormatOfEmail}
    ...         ELSE IF    '${typeOfEmail}' == 'invalidDomainEmail'         input text      ${inputField}       ${invalidDomainEmail}
    ...         ELSE IF    '${typeOfEmail}' == 'existedEmail'               input text      ${inputField}       ${existedEmail}
    ...         ELSE IF    '${typeOfEmail}'=='lackOfDomain'                 input text      ${emailInput}       ${lackOfDomain}
    ...         ELSE         fail        No result for this case
    mouse out    ${inputField}

