*** Settings ***
Library    SeleniumLibrary
Resource    ../CommonFiles/CommonFunctions.robot
Resource    ../UserDefineKeywords/CommonUserDefineKeywords.robot
Resource    ../UserDefineKeywords/VesselUserDefineKeywords.robot

*** Variables ***


*** Keywords ***
First Vessel has Email on Vessel list
    User go to Vessel page
    Get the text of Email

First Vessel has Transformation Start Date
    User go to Vessel page
    Get the text of Transformation Start Date