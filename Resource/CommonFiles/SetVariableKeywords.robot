*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library    String
Resource  ../../TestData/config.robot


*** Variables ***

*** Keywords ***
Set Valid Email Value
    [Documentation]    return validEmail variable
    ${validDomain}=     Evaluate    random.choice($validDomain)     random
    ${randomString}=    generate random string      8       [LETTERS][NUMBERS]
    ${validEmail}=      set variable    AutoTest_${randomString}@${validDomain}
    set suite variable    ${validEmail}
    [Return]        ${validEmail}