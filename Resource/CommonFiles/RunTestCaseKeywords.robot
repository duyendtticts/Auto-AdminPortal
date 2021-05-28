*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource  ../../TestData/config.robot


*** Variables ***

*** Keywords ***
Execute TestCase
    [Arguments]     ${testCaseName}
    ${testCaseStatus}=      run keyword and return status     ${testCaseName}
    run keyword if    '${testCaseStatus}'=='False'      RUN KEYWORD     ${testCaseName}