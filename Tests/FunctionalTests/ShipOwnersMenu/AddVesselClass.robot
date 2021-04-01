*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot
Resource    ../../../Resource/UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/VesselClassUserDefineKeywords.robot

Suite Setup         CommonFunctions.Start TestCase With Login
Suite Teardown      CommonFunctions.End TestCase

*** Variables ***


*** Test Cases ***
Verify the Add New Vessel Class form
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI
    Given User go to Ship Owner page
    And User clicks on the menu "VESSEL CLASSES"
    When User click Create button
    Then User can verify the Create Vessel Form

Create Vessel Class without inputting Vessel Class name
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI
    Given User go to Ship Owner page
    And User clicks on the menu "VESSEL CLASSES"
    When User click Create button
    And User click Submit button
    Then User will see the error message for Vessel class name field should be "Name is required."

Create Vessel class name successfully
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI
    Given User go to Ship Owner page
    And User clicks on the menu "VESSEL CLASSES"
    When User click Create button
    And User input into Vessel class name text field with value as "${inputValue}"