*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Variables    ../WebElements/shipOwnersElements.py

*** Variables ***


*** Keywords ***
Click Ship Owner menu
    wait until element is visible       ${shipOwnersMenu}       10s
    click element    ${shipOwnersMenu}
    ${status}=  run keyword and return status    wait until page contains element    ${itemInTable}      10s
    register keyword to run on failure           ${status}

#menu tab
Click tab button
    [Arguments]    ${menuButtonName}
    ${menuButton}=  set variable    xpath://button[contains(., '${menuButtonName}')]
    wait until element is visible    ${menuButton}  10s    ${menuButtonName} is not visibale after 10s
    click button    ${menuButton}



#date pickup
Click previous button in calendar
    click button        ${preMonthButton}

Click next button in calendar
    click button        ${nextMonthButton}

Select current date in calendar
    [Arguments]    ${currentDate}
    Click button    xpath://span[text()='${currentDate}']/ancestor::button

Select future date in calendar
    [Arguments]    ${currentDate}
    ${futureDate}=  evaluate    ${currentDate}+1
    Click button    xpath://span[text()='${futureDate}']/ancestor::button

Select previous date in calendar
    [Arguments]    ${currentDate}
    ${pastDate}=    evaluate    ${currentDate}-1
    click button    xpath://span[text()='${pastDate}']/ancestor::button

Select date in previous month
    Click previous button in calendar
    ${lastDayOfMonth}=  set variable    30
    ${pastDate}=   Evaluate     ${lastDayOfMonth}-3
    Click button    xpath://span[text()='${pastDate}']/ancestor::button

Select date in next month
    Click next button in calendar
    ${fisrtDayOfMonth}=     set variable    1
    ${futureDate}=  evaluate    ${fisrtDayOfMonth}+2
    Click button    xpath://span[text()='${futureDate}']/ancestor::button

#date solution
Select date based on normal date is in the month
    [Arguments]    ${selectedDate}      ${currentDate}
    ${pastDate}=   Evaluate     ${currentDate}-1
    ${futureDate}=  evaluate    ${currentDate}+1
    run keyword if      '${selectedDate}'=='past'     click button    xpath://span[text()='${pastDate}']/ancestor::button
    ...     ELSE IF     '${selectedDate}'=='future'   click button    xpath://span[text()='${futureDate}']/ancestor::button
    ...     ELSE IF     '${selectedDate}'=='current'   click button    xpath://span[text()='${currentDate}']/ancestor::button
    ...     ELSE        fail    Date is not invalid value. Should select past, current or future date only

Select date based on first date in the month
    [Arguments]   ${periodTime}      ${currentDate}
     RUN KEYWORD IF    '${periodTime}'=='past'             Select date in previous month
    ...    ELSE IF     '${periodTime}'=='current'          Select current date in calendar    ${currentDate}
    ...    ELSE IF     '${periodTime}'=='future'           Select future date in calendar     ${currentDate}
    ...    ELSE         fail    Date is not invalid value. Should select past, current or future date only

Select date based on last date in the month
    [Arguments]   ${periodTime}      ${currentDate}
    RUN KEYWORD IF    '${periodTime}'=='past'            Select previous date in calendar    ${currentDate}
    ...    ELSE IF    '${periodTime}'=='current'         Select current date in calendar    ${currentDate}
    ...    ELSE IF    '${periodTime}'=='future'          Select date in next month
    ...    ELSE        fail     Date is not invalid value. Should select past, current or future date only



