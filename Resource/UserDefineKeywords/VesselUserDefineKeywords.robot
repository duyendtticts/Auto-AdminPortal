*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../WebElements/shipOwnersElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    CommonUserDefineKeywords.robot
Resource    ../PageObjects/VesselPage.robot
Resource    CommonUserDefineKeywords.robot
Resource    ShipOwnersUserDefineKeywords.robot

*** Variables ***


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

User go to Vessel tab then open Edit form
    User go to Ship Owner page
    User clicks on the menu "VESSELS"
    Select first Item to edit

Compare ${fieldName} of Vessel with one on Edit form
    Get the text of Email
    Get value of field in Update form   ${fieldName}
    ${fieldValue}   should be equal    ${fieldValueOnUpdateForm}



User select value no ${noItem} in dropdown list for Vessel Class field
    CommonUserDefineKeywords.User click dropdown list: Vessel Class
    ${itemLocation}=    set variable    xpath://*[@id='menu-vesselClass']/div/ul/li[${noItem}]
    click element       ${itemLocation}

User select the ${periodTime} date for Transformation Start Date
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