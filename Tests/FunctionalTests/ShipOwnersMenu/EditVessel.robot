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
    [Tags]      Function    NegativeCase
    Execute TestCase    Edit existed email of Vessel

Update Vessel with empty email
    [Documentation]
    [Tags]

Update Vessel with invalid email - lack of domain
    [Documentation]
    [Tags]

Update Vessel with invalid email - lack of @
    [Documentation]
    [Tags]

Update Vessel with invalid email - invalid whitelist domain
    [Documentation]     white list domain:
    [Tags]      

Update Vessel with new valid email
    [Documentation]
    [Tags]


Update Vessel with empty Transformation Date
    [Documentation]
    [Tags]

Update Vessel with empty Transformation Date
    [Documentation]
    [Tags]