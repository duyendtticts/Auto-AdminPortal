*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot

Test Setup         CommonFunctions.Start TestCase With Login
Test Teardown      CommonFunctions.End TestCase

*** Variables ***

*** Test Cases ***
Delete all dummy data on Countly page
    User go to