*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot
Resource    ../../../Resource/UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/VesselClassUserDefineKeywords.robot

Test Setup         CommonFunctions.Start TestCase With Login
Test Teardown      CommonFunctions.End TestCase

*** Variables ***


*** Test Cases ***
Verify the Add New Vessel Class form
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI
    Given User go to Vessel Class then open Create new form
    Then User can verify the Create Vessel Form

Create Vessel Class fail with empty Vessel Class name
    [Documentation]    This case check creating vessel class with empty name
    [Tags]    Function NegativeCase
    Given User go to Vessel Class then open Create new form
    When User click Submit button
    Then User will see the error message for Vessel class name field should be "Name is required."

Create Vessel Class fail with Vessel Class name containing integer
    [Documentation]    This case check creating vessel class with name containing integer
    [Tags]    Function    NegativeCase
    Given User go to Vessel Class then open Create new form
    When User input into Vessel class name text field with value as "Test 123"
    And User click Submit button
    Then User will see the error message for Vessel class name field should be "Vessel class name must contain letters and space only"

Create Vessel Class fail with Vessel Class name containing special character
    [Documentation]    This case check creating vessel class with name containing special character
    [Tags]    Function    NegativeCase
    Given User go to Vessel Class then open Create new form
    When User input into Vessel class name text field with value as "Test %"
    And User click Submit button
    Then User will see the error message for Vessel class name field should be "Vessel class name must contain letters and space only"

Create Vessel class name successfully
    [Documentation]    This test case verify the create vessel successfully
    [Tags]    Function    HappyCase
    Given User go to Vessel Class then open Create new form
    When User input into Vessel class name text field with value as "TEST"
    And User click Submit button
    And User click Confirm button
    Then User will see the successfully popup as: "Successfully created the vessel class."

Create Vessel class fail with existed name on the list
    [Documentation]    This case check creating vessel class with existed name
    [Tags]    Function  NegativeCase
    Given Given User go to Vessel Class then open Create new form
    And It existed an vessel class name on the list
    When User input into Vessel class name text field with existed value on the list
    And User click Submit button
    And User click Confirm button
    Then User will see the error popup as: "Vessel Class already exists"

Create Vessel class fail with existed name in lower case on the list
    [Documentation]    This case check creating vessel class with existed name in lower case
    [Tags]    Function  NegativeCase
    Given Given User go to Vessel Class then open Create new form
    And It existed an vessel class name on the list
    When User input into Vessel class name text field with existed value on the list
    And User click Submit button
    And User click Confirm button
    Then User will see the error popup as: "Vessel Class already exists"

Create Vessel class fail with existed name on the list and space
    [Documentation]    This case check creating vessel class with existed name
    [Tags]    Function  NegativeCase
    Given User go to Vessel Class then open Create new form
    And It existed an vessel class name on the list
    When User input into Vessel class name text field with existed name contains space before on the list
    And User click Submit button
    And User click Confirm button
    Then User will see the error popup as: "Vessel Class already exists"

Create Vessel class fail with space before existed name on the list and space
    [Documentation]    This case check creating vessel class with existed name with space at the begin of name
    [Tags]    Function  NegativeCase
    Given Given User go to Vessel Class then open Create new form
    And It existed an vessel class name on the list
    When User input into Vessel class name text field with spaces and existed name on the list
    And User click Submit button
    And User click Confirm button
    Then User will see the error popup as: "Vessel Class already exists"