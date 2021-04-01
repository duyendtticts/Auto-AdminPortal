*** Settings ***
Library    SeleniumLibrary
Variables    ../WebElements/shipOwnersElements.py

*** Variables ***


*** Keywords ***
Click Ship Owner menu
    wait until element is visible       ${shipOwnersMenu}       10s
    click element    ${shipOwnersMenu}
    ${status}=  run keyword and return status    wait until page contains element    ${itemInTable}      10s
    register keyword to run on failure           ${status}


#Vessel
