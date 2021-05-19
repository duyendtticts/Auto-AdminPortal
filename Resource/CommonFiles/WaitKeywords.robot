*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource  ../../TestData/config.robot
Resource    ../PageObjects/LoginPage.robot

*** Variables ***

*** Keywords ***
#wait element
Wait for element visible
    [Arguments]    ${fieldLocation}     ${fieldName}
    wait until element is visible    ${fieldLocation}   10s     Could not found ${fieldName} after 3 times of retry

Retry to verify element 3 times
    wait until keyword succeeds    ${GLOBAL_RETRY_AMOUNT}    ${GLOBAL_RETRY_INTERVAL}       Wait for element visible    ${fieldLocation}    ${fieldName}