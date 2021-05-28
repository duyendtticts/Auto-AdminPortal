*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/VesselUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot


*** Variables ***


*** Keywords ***
Verify Add Vessel form
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI
    Given User go to Vessel tab then open Create form
    Then User can verify the Create Vessel Form

Create new Vessel with empty required fields
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation  NegativeCase
    Given User go to Vessel tab then open Create form
    When User click Submit button
    Then User will see the error message for required fields
    And User click Cancel button

Create new Vessel with empty Vessel Name
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation  NegativeCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with valid email
    And User click Submit button
    Then User will see the error message for Vessel Name field should be "Vessel Name is required."

Create new Vessel with empty IMO No
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation  NegativeCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into Email field with valid email
    And User click Submit button
    Then User will see the error message for IMO No field should be "IMO No is required."

Create new Vessel with empty email
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation    NegativeCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User click Submit button
    Then User will see the error message for Email field should be "Default vessel email is required."

Create new Vessel with empty Vessel Class
    [Documentation]    This test case verify the create vessel form with empty Vessel Class
    [Tags]    UI    Validation    NegativeCase
    Given User go to Vessel tab then open Create form
    When User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with valid email
    And User click Submit button
    Then User will see the error message for Vessel Class field should be "Vessel Class is required."

Create new Vessel with invalid email
    [Documentation]    This test case verify the create vessel form with invalid email
    [Tags]    Function    Validation    NegativeCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with invalid format email
    And User click Submit button
    Then User will see the error message for Email field should be "Valid email is required."

Create new Vessel with invalid domain email
    [Documentation]    This test case verify the create vessel form with invalid email
    [Tags]    Function   Validation     NegativeCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with invalid domain email
    And User click Submit button
    Then User will see the error message for Email field should be "Invalid email. Supported domains: es-sea.com, eaglestar.com.my, sparescnx.com"

Create Vessel Without Transformation Date
    [Documentation]    This test case verify the create vessel successfully
    [Tags]    Function   Happy Case
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with valid email
    And User click Submit button
    And User click Confirm button
    Then User will see the successfully popup as: "Successfully created the vessel."

Create Vessel with Transformation Date in the past time
    [Documentation]    This test case verify the create vessel with past transformation date successfully
    [Tags]    Function   HappyCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with valid email
    And User select the past date for Transformation Start Date
    And User click Submit button
    And User click Confirm button
    Then User will see the successfully popup as: "Successfully created the vessel."

Create Vessel with Transformation Date in the future time
    [Documentation]    This test case verify the create vessel with future transformation date successfully
    [Tags]    Function   HappyCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with valid email
    And User select the future date for Transformation Start Date
    And User click Submit button
    And User click Confirm button
    Then User will see the successfully popup as: "Successfully created the vessel."

Create Vessel with Transformation Date as current date
    [Documentation]    This test case verify the create vessel with future transformation date successfully
    [Tags]    Function  HappyCase
    Given User go to Vessel tab then open Create form
    When User select value no 2 in dropdown list for Vessel Class field
    And User input into Vessel Name text field with value as "Vessel Test"
    And User input into IMO No field (only number) with value contains 8 integers
    And User input into Email field with valid email
    And User select the current date for Transformation Start Date
    And User click Submit button
    And User click Confirm button
    Then User will see the successfully popup as: "Successfully created the vessel."

