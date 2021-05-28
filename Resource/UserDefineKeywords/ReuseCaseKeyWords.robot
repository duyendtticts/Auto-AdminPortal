*** Settings ***
Library    SeleniumLibrary
Variables    ../WebElements/shipOwnersElements.py
Variables   ../WebElements/commonWebElements.py
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/VesselUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot

*** Variables ***

*** Keywords ***
Add new Vessel successfully with Transformation Date as current date
    [Documentation]    This keyword to create vessel with current transformation date successfully
    [Tags]
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with valid email
    And User select the current date for Transformation Start Date
    And User click Submit button
    And User click Confirm button
    Then User will see the successfully popup as: "Successfully created the vessel."

