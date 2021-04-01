*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    ../WebElements/shipOwnersElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    CommonUserDefineKeywords.robot
#Resource    CommonUserDefineKeywords.robot

*** Variables ***


*** Keywords ***
User can verify the Create Vessel Form
    CommonFunctions.Title of Create Vessel Class Form should be "Create Vessel Class"
    CommonUserDefineKeywords.Verify the label of Vessel class name field should be "Vessel class name"
    CommonFunctions.Form should contain button: "Cancel"
    CommonFunctions.Form should contain button: "Submit"

