*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../WebElements/shipOwnersElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    CommonUserDefineKeywords.robot
#Resource    CommonUserDefineKeywords.robot

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

User select value no ${noItem} in dropdown list for Vessel Class field
    CommonUserDefineKeywords.User click dropdown list: Vessel Class
    ${itemLocation}=    set variable    xpath://*[@id='menu-vesselClass']/div/ul/li[${noItem}]
    click element       ${itemLocation}

User select the ${periodTime} date for Transformation Start Date
    CommonUserDefineKeywords.User click dropdown list: Transformation Start Date