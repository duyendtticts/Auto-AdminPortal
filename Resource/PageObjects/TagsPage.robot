*** Settings ***
Library    SeleniumLibrary
Variables    ../WebElements/tagsElements.py
Variables    ../WebElements/commonWebElements.py

*** Variables ***


*** Keywords ***
Click ${buttonName} menu on left sidebar
   click element    ${tagsMenu}

Check header of data table
    [Arguments]            ${headerTextOfTable}
    Element Text Should Be      ${headerOfTable}        ${headerTextOfTable}

Check the number of row on table
    get table cell      ${tableLocator}     row

#Verify Create Tag Form
Verify the visible of ${fieldName} popup
    element should be visible       ${createForm}

Click on the ${elementLocator}
    click element       ${elementLocator}



