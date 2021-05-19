*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot
Resource    ../../../Resource/UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/VesselUserDefineKeywords.robot

Test Setup         CommonFunctions.Start TestCase With Login
Test Teardown      CommonFunctions.End TestCase
*** Variables ***


*** Test Cases ***
Verify Edit Vessel form
    Given User go to Vessel tab then open Edit form
    Then Compare Email of Vessel with one on Edit form
    And Compare Transformation Start Date of Vessel with one on Edit form


