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
Create new vessel class     ${testCaseName}     ${




*** Keywords ***
Create new Vessel Class with many cases
   [Arguments]      ${inputData}
    Given User go to Vessel Class then open Create new form
    When Input ${inputData} into Vessel Name field
    And User click Submit button
    Then User will see the error message for Vessel class name field should be "Name is required."