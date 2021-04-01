*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/ShipOwnersUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot

Suite Setup         CommonFunctions.Start TestCase With Login
Suite Teardown      CommonFunctions.End TestCase

*** Variables ***
${right_of_page}=     ${createVesselClassButton}

*** Test Cases ***
Verify the menu Info of a ship owner
    Given User clicks on the menu "VESSEL CLASSES"
    Then User will see the title "Vessel Classes" with list of Vessel class
    And User will see the "Create" button at the ${right_of_page}

Verify the menu Vessel Class of a ship owner
    Given User clicks on the menu "VESSEL CLASSES"
    Then User will see the title "Vessel Classes" with list of Vessel class
    And User will see the "Create" button at the ${createVesselButton}