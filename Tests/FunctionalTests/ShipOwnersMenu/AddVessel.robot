*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../../../Resource/TestCaseInKeyWords/ShipOwners-Vessel/AddVesselTestCase.robot
Resource    ../../../Resource/CommonFiles/RunTestCaseKeywords.robot

Test Setup         CommonFunctions.Start TestCase With Login
Test Teardown      CommonFunctions.End TestCase

*** Variables ***

*** Test Cases ***
Verify the Add new Vessel form
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI
    Execute TestCase   Verify Add Vessel form

Create new Vessel with empty required fields
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation  NegativeCase
    Execute TestCase    Create new Vessel with empty required fields

Create new Vessel with empty Vessel Name
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation  NegativeCase
    Execute TestCase    Create new Vessel with empty Vessel Name

Create new Vessel with empty IMO No
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation  NegativeCase
    Execute TestCase    Create new Vessel with empty IMO No

Create new Vessel with empty email
    [Documentation]    This test case verify the create vessel form
    [Tags]    UI    Validation    NegativeCase
    Execute TestCase    Create new Vessel with empty email

Create new Vessel with empty Vessel Class
    [Documentation]    This test case verify the create vessel form with empty Vessel Class
    [Tags]    UI    Validation    NegativeCase
    Execute TestCase    Create new Vessel with empty Vessel Class

Create new Vessel with invalid email
    [Documentation]    This test case verify the create vessel form with invalid email
    [Tags]    Function    Validation    NegativeCase
    Execute TestCase    Create new Vessel with invalid email

Create new Vessel with invalid domain email
    [Documentation]    This test case verify the create vessel form with invalid email
    [Tags]    Function   Validation     NegativeCase
    Execute TestCase    Create new Vessel with invalid domain email

Create new Vessel successfully without Transformation Date
    [Documentation]    This test case verify the create vessel successfully
    [Tags]    Function   Happy Case
    Execute TestCase    Create Vessel Without Transformation Date

Create new Vessel successfully with Transformation Date in the past time
    [Documentation]    This test case verify the create vessel with past transformation date successfully
    [Tags]    Function   HappyCase
    Execute TestCase    Create Vessel with Transformation Date in the past time

Create new Vessel successfully with Transformation Date in the future time
    [Documentation]    This test case verify the create vessel with future transformation date successfully
    [Tags]    Function   HappyCase
    Execute TestCase    Create Vessel with Transformation Date in the future time

Create new Vessel successfully with Transformation Date as current date
    [Documentation]    This test case verify the create vessel with future transformation date successfully
    [Tags]    Function  HappyCase
    Execute TestCase    Create Vessel with Transformation Date as current date
