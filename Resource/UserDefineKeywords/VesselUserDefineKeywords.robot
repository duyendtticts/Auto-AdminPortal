*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../WebElements/shipOwnersElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    ../CommonFiles/GetTasks.robot
Resource    ../CommonFiles/WaitKeywords.robot
Resource    CommonUserDefineKeywords.robot
Resource    ../PageObjects/VesselPage.robot
Resource    CommonUserDefineKeywords.robot
Resource    ShipOwnersUserDefineKeywords.robot

*** Variables ***
${RANGE}    = 10

*** Keywords ***
User can verify the Create Vessel Form
    CommonFunctions.Title of Create Vessel Form should be "Create Vessel"
    CommonUserDefineKeywords.Verify the label of Vessel Name field should be "Vessel Name"
    CommonUserDefineKeywords.Verify the label of IMO No field should be "IMO No"
    CommonUserDefineKeywords.Verify the label of Email field should be "Email"
    CommonUserDefineKeywords.Verify the label of Vessel Class field should be "Vessel Class"
    CommonUserDefineKeywords.Verify the label of Transformation Start Date field should be "Transformation Start Date"
    CommonFunctions.Form should contain button: "Cancel"
    CommonFunctions.Form should contain button: "Submit"
    capture page screenshot


User will see the error message for required fields
    CommonUserDefineKeywords.Verify the error message of Vessel Name field should be "Vessel Name is required."
    CommonUserDefineKeywords.Verify the error message of IMO No field should be "IMO No is required."
    CommonUserDefineKeywords.Verify the error message of Email field should be "Default vessel email is required."
    CommonUserDefineKeywords.Verify the error message of Vessel Class field should be "Vessel Class is required."


User go to Vessel tab then open Create form
    User go to Ship Owner page
    User clicks on the menu "VESSELS"
    User click Create button

User go to Vessel page
    User go to Ship Owner page
    User clicks on the menu "VESSELS"

User go to Vessel tab then open Edit form of first Vessel item
    User go to Vessel page
    Select first Item to edit

Compare ${fieldName} of Vessel with one on Edit form
    Get the text of Email
    Get value of field in Update form   ${fieldName}
    ${fieldValue}   should be equal    ${fieldValueOnUpdateForm}

User search with imo Number as: ${inputData}
    WaitKeywords.Wait for element visible       ${searchButton}
    Click button    ${searchButton}
    Input text      ${searchTextBox}        ${inputData}


User select value no ${noItem} in dropdown list for Vessel Class field
    CommonUserDefineKeywords.User click dropdown list: Vessel Class
    ${itemLocation}=    set variable    xpath://*[@id='menu-vesselClass']/div/ul/li[${noItem}]
    click element       ${itemLocation}

User click on this vessel to open Edit form
    click element    ${firstRowItem}
    wait until element is not visible    ${firstRowItem}    10s

User select the ${periodTime} date for Transformation Start Date
    [Documentation]    return currentDate that selected in order to compare later
    CommonUserDefineKeywords.User click dropdown list: Transformation Start Date
#    ${currentDate}=     set variable    28
#    ${currentMonth}=    set variable    2
    ${currentDateTime}=     get current date    result_format=%m%d
    ${currentMonth}=    get current date    result_format=%m
    ${currentDate}=     get current date    result_format=%d
    ${currentDate}=     Convert To Integer  ${currentDate}
    ${currentMonth}=     Convert To Integer  ${currentMonth}
    RUN KEYWORD IF    ${currentDate}==1        Select date based on first date in the month    ${periodTime}    ${currentDate}
    ...    ELSE IF    ${currentDate}==28 and ${currentMonth}==2     Select date based on last date in the month     ${periodTime}    ${currentDate}
    ...    ELSE IF    ${currentDate}==30       Select date based on last date in the month      ${periodTime}    ${currentDate}
    ...    ELSE       Select date based on normal date is in the month          ${periodTime}    ${currentDate}
    ${currentDate}=     get text    ${transformationStartDateInput}
    set suite variable    ${currentDate}
    [Return]              ${currentDate}

Exist an email that is used for any item on the list
    [Documentation]    get the text of email field on first item
    @{numbers}    Create List    2    3    4    5   6   7   8   9   10
    ${randomNo}=        Evaluate    random.choice(${numbers})    random
    ${emailLocator}=        set variable    xpath://tbody/tr[${randomNo}]/td[5]/div[2]
    Get value of a fieldName        ${emailLocator}
    [Return]        ${fieldValue}



