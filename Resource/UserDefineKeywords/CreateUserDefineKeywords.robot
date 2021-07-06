*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime
Variables    ../WebElements/shipOwnersElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    ../CommonFiles/SetVariableKeywords.robot
Resource    CommonUserDefineKeywords.robot
Resource    ../PageObjects/UserList.robot
Resource    ../PageObjects/CreateUser.robot
Resource    VesselUserDefineKeywords.robot

*** Variables ***


*** Keywords ***