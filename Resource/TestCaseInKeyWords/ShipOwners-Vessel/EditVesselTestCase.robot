*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/EditVesselDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../../../Resource/UserDefineKeywords/VesselUserDefineKeywords.robot
Resource    ../../PreCondition/PreConditionOfVessel.robot
Resource    AddVesselTestCase.robot

*** Variables ***

*** Keywords ***
Verify Edit Vessel form
    [Documentation]
    [Tags]      UI    Validation
    Given User go to Vessel tab then open Edit form of first Vessel item
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
    Then Email is updated successfully                  ${fieldValue}
    And Clear data to reuse later

Update Vessel with empty email
    [Documentation]
    [Tags]
    Given User go to Vessel tab then open Edit form of first Vessel item
    When User edit the email with empty email
    Then User will see the error message for Email field as: "Email is required"

Update Vessel with invalid email - lack of domain
    [Documentation]     edit with email lack of domain such as: lan001@
    [Tags]
    Given User go to Vessel tab then open Edit form of first Vessel item
    When User edit the email with negative case as: lack of domain
    Then User will see the error message for Email field as: "Field must be a valid email"

Update Vessel with invalid email - lack of @
    [Documentation]     lack of @ sign ex: lan001com.vn
    [Tags]
    Given User go to Vessel tab then open Edit form of first Vessel item
    When User edit the email with negative case as: invalid format email ( lack of @)
    Then User will see the error message for Email field as: "Field must be a valid email"

Update Vessel with invalid email - invalid whitelist domain
    [Documentation]     white list domain:
    [Tags]
    Given User go to Vessel tab then open Edit form of first Vessel item
    When User edit the email with negative case as: invalid domain email
    Then User will see the error message for Email field as: "Invalid email. Supported domains: es-sea.com, eaglestar.com.my, sparescnx.com"

Update Vessel with new valid email
    [Documentation]
    [Tags]
    Given User go to Vessel tab then open Edit form of first Vessel item
    When User edit the email with valid email       #Return the variable: ${validEmail} in order to check on next step
    Then Email is updated successfully      ${validEmail}

Update Vessel successfully with current date for Transformation Start Date
    [Documentation]
    [Tags]
    #Prepare data
    Create Vessel Without Transformation Date   #Return value ${inputData} as vessel name
    #Execute case
    Given User go to Vessel page
    And User search with imo Number as: ${imoNo}
    When User click on this vessel to open Edit form
    And User edit Transformation Date value: current date       #return ${currentDate} value
    Then Vessel is updated with new Transformation date successfully    ${currentDate}