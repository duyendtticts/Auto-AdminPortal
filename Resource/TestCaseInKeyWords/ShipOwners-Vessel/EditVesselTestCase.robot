*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot
Resource    ../../../Resource/UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/VesselUserDefineKeywords.robot
Resource    ../../PreCondition/PreConditionOfVessel.robot

*** Variables ***


*** Keywords ***
Verify Edit Vessel form
    [Documentation]
    [Tags]      UI    Validation
    Given User go to Vessel tab then open Edit form
    And First Vessel has Email on Vessel list
    And
    Then Compare Email of Vessel with one on Edit form
    And Compare Transformation Start Date of Vessel with one on Edit form

Edit existed email of Vessel
    [Documentation]     use existed email on the Vessel list to update
    [Tags]      Function    NegativeCase
    Given User go to Vessel tab then open Edit form
    And Exist an email that is used for other item on the list
    When User edit the email with value: existed email
    Then


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


Update Vessel successfully with empty Transformation Date
    [Documentation]
    [Tags]
