*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../WebElements/shipOwnersElements.py
Variables    ../WebElements/vesselClassElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    CommonUserDefineKeywords.robot
Resource    ../PageObjects/VesselClassPage.robot
Resource    CommonUserDefineKeywords.robot
Resource    ShipOwnersUserDefineKeywords.robot

*** Variables ***


*** Keywords ***
User can verify the Create Vessel Form
    CommonFunctions.Title of Create Vessel Class Form should be "Create Vessel Class"
    CommonUserDefineKeywords.Verify the label of Vessel class name field should be "Vessel class name"
    CommonFunctions.Form should contain button: "Cancel"
    CommonFunctions.Form should contain button: "Submit"

User go to Vessel Class then open Create new form
    User go to Ship Owner page
    User clicks on the menu "VESSEL CLASSES"
    User click Create button

User will see the result as: ${resultOfCase}
    [Documentation]    use for Add Vessel Class BDD file

It existed an vessel class name on the list
    [Documentation]    get the first name in the vessel class name list and set it as varaiable: firstItemName
    Get the first item's Name in the list       ${firstNameInList}


User input into Vessel class name text field with ${typeOfInputData} on the list
    [Documentation]    use for input existed name into Vessel class name
    ${vesselClassName}=    get variable value    ${firstItemName}
    run keyword if  "${typeOfInputData}"=="existed value"    Input existed Vessel class name
    ...    ELSE IF  "before" in "${typeOfInputData}" and "space" in "${typeOfInputData}"   Input existed vessel class name contains space before it
    ...    ELSE IF  "after" in "${typeOfInputData}" and "space" in "${typeOfInputData}"    Input existed vessel class name contains space after it
    ...    ELSE IF  "and" in "${typeOfInputData}" and "space" in "${typeOfInputData}"      Input existed vessel class name contains spaces before and after it
    ...    ELSE     fail     Just have 4 cases as: space before, space after, space and, existed value

