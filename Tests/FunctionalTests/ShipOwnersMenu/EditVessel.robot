*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/TestCaseInKeyWords/ShipOwners-Vessel/AddVesselTestCase.robot
Resource    ../../../Resource/TestCaseInKeyWords/ShipOwners-Vessel/EditVesselTestCase.robot
Resource    ../../../Resource/CommonFiles/RunTestCaseKeywords.robot

Test Setup         CommonFunctions.Start TestCase With Login
Test Teardown      CommonFunctions.End TestCase
*** Variables ***


*** Test Cases ***
Verify Edit Vessel form
    [Documentation]
    [Tags]      UI    Validation
    Execute TestCase    Verify Edit Vessel form

Update Vessel with existed email
    [Documentation]
    [Tags]      Function    HappyCase
    Execute TestCase    Update with existed email on the Vessel list

Update Vessel with empty email
    [Documentation]
    [Tags]      Function    NegativeCase
    Execute TestCase    Update Vessel with empty email
Update Vessel with invalid email - lack of domain
    [Documentation]
    [Tags]      Function    NegativeCase
    Execute TestCase    Update Vessel with invalid email - lack of domain

Update Vessel with invalid email - lack of @
    [Documentation]
    [Tags]      Function    NegativeCase
    Execute TestCase    Update Vessel with invalid email - lack of @

Update Vessel with invalid email - invalid whitelist domain
    [Documentation]     white list domain:
    [Tags]         Function    NegativeCase
    Execute TestCase    Update Vessel with invalid email - invalid whitelist domain

Update Vessel with new valid email
    [Documentation]
    [Tags]      Function    HappyCase
    Execute TestCase    Update Vessel with new valid email

Update Vessel with Transformation Date as current date
    [Documentation]
    [Tags]
    Execute TestCase    Update Vessel successfully with current date for Transformation Start Date

Update Vessel with empty Transformation Date
    [Documentation]
    [Tags]