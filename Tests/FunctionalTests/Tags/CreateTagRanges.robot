*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Resource/UserDefineKeywords/TagsUserDefineKeywords.robot
Resource    ../../../Resource/CommonFiles/CommonFunctions.robot

Suite Setup         CommonFunctions.Start TestCase With Login
Suite Teardown      CommonFunctions.End TestCase

*** Variables ***


*** Test Cases ***
Verify the Create Tags Range Form
    [Documentation]    This test case verify the create tag range form
    [Tags]    UI
    Given User click Tags menu on left sidebar
    When User click Create button on Tags page
    Then User can verify the Create Tags Range form

Create Tags Range with empty required fields
    [Documentation]    This test case verify when no input required field
    [Tags]    UI, Validation, Negative case
    Given User click Tags menu on left sidebar
    When User click Create button
    And User click Submit button
    Then User will see the error message for required fields

Create a tag range for a vessel successfully
    [Documentation]    This test case verify the create vessel form
    [Tags]    Function, Happy Case
    Given User click Tags menu on left sidebar
    And The Tag Range list has no item



