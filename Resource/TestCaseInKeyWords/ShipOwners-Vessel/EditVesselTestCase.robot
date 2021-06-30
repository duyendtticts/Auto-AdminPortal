*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/EditVesselDefineKeywords.robot
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
    Then Compare Email of Vessel with one on Edit form
    And Compare Transformation Start Date of Vessel with one on Edit form

Update with existed email on the Vessel list
    [Documentation]     use existed email on the Vessel list to update
    [Tags]      Function    NegativeCase
    Given User go to Vessel page
    And Exist an email that is used for any item on the list      #return fieldValue of random user on the first page
    And Select first Item to edit
    When User edit with existed email on the list    	${fieldValue}
    Then Email is updated successfully
    And Clear data to reuse later

Update Vessel with empty email
    [Documentation]
    [Tags]
    Given User go to Vessel tab then open Edit form
    When User edit the email with empty email
    Then User will see the error message for Email field as: "Email is required"

Update Vessel with invalid email - lack of domain
    [Documentation]
    [Tags]
    Given User go to Vessel tab then open Edit form
    When User edit the email with value: lack of domain
    Then User will see the error message for Email field as: "Email is required"

Update Vessel with invalid email - lack of @
    [Documentation]
    [Tags]
    Given User go to Vessel tab then open Edit form
    When User edit the email with value: invalid format email ( lack of @)
    Then User will see the error message for Email field as: "Email is required"

Update Vessel with invalid email - invalid whitelist domain
    [Documentation]     white list domain:
    [Tags]
    Given User go to Vessel tab then open Edit form
    When User edit the email with value: invalid domain email
    Then User will see the error message for Email field as: "Email is required"

Update Vessel with new valid email
    [Documentation]
    [Tags]
    Given User go to Vessel tab then open Edit form
    When User edit the email with value: valid email
    Then Email is updated successfully

Update Vessel successfully with empty Transformation Date
    [Documentation]
    [Tags]
