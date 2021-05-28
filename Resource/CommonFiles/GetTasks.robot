*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    WaitKeywords.robot


*** Variables ***


*** Keywords ***
Get the first item's Name in the list
    [Arguments]    ${firstItemLocator}
    Retry to verify element 3 times       ${firstItemLocator}
    ${firstItemName}=   get text             ${firstItemLocator}
    set global variable    ${firstItemName}
    [Return]    ${firstItemName}

Get value of a fieldName
    [Arguments]    ${fieldLocator}
    [Documentation]    get data value of a field name
    Retry to verify element 3 times         ${fieldLocator}
    ${fieldValue}=      get text    ${fieldLocator}
    set variable        ${fieldValue}
    [Return]            ${fieldValue}

Get the text of ${fieldName}
    [Documentation]    get text of field name of first row in a form
    #${fieldLocation}=   set variable    xpath://p[contains(text(), '${fieldName}')]/following::p[1]
    ${fieldLocation}=   set variable    xpath://*[contains(text(), 'Email')]/following-sibling::p
    #Retry to verify element 3 times     ${fieldLocation}
    ${fieldValue}=  get text    ${fieldLocation}
    set suite variable    ${fieldValue}
    [Return]    ${fieldValue}