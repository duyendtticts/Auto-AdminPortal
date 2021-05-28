*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot
Resource    ../../../Resource/TestCaseInKeyWords/ShipOwners-VesselClass/AddVesselClassTestCase.robot
Resource    ../../../Resource/CommonFiles/RunTestCaseKeywords.robot

Test Setup         CommonFunctions.Start TestCase With Login
Test Teardown      CommonFunctions.End TestCase

*** Variables ***


*** Test Cases ***
Verify the Add New Vessel Class form
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI
    Execute TestCase    Verify the Add New Vessel Class form

Create Vessel Class fail with empty Vessel Class name
    [Documentation]    This case check creating vessel class with empty name
    [Tags]    Function    NegativeCase
    Execute TestCase   Create Vessel Class with empty Vessel Class name

Create Vessel Class success with Vessel Class name containing integer
    [Documentation]    This case check creating vessel class with name containing integer
    [Tags]    Function    NegativeCase
    Execute TestCase   Create VesselClass with Vessel Class name containing integer

Create Vessel Class fail with Vessel Class name containing special character
    [Documentation]    This case check creating vessel class with name containing special character
    [Tags]    Function    NegativeCase
    Execute TestCase    Create Vessel Class with Vessel Class name containing special character

Create Vessel class name with only letter successfully
    [Documentation]    This test case verify creating new vessel class name with only letter
    [Tags]    Function    HappyCase
    Execute TestCase    Create Vessel class name with only letter

Create Vessel class fail with existed name on the list
    [Documentation]    This case check creating vessel class with existed name
    [Tags]    Function  NegativeCase
    Execute TestCase    Create Vessel class with existed name on the list

Create Vessel class fail with existed name in lower case on the list
    [Documentation]    This case check creating vessel class with existed name in lower case
    [Tags]    Function  NegativeCase
    Execute TestCase    Create Vessel class with existed name in lower case on the list

Create Vessel class fail with existed name on the list and space
    [Documentation]    This case check creating vessel class with existed name
    [Tags]    Function  NegativeCase
    Execute TestCase    Create Vessel class with existed name on the list and space

Create Vessel class fail with space before existed name on the list contains space
    [Documentation]    This case check creating vessel class with existed name with space at the begin of name
    [Tags]    Function  NegativeCase
    Execute TestCase    Create Vessel class with space before existed name on the list contains space