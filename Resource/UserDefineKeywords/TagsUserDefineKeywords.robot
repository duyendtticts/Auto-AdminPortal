*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObjects/TagsPage.robot
Resource    ../CommonFiles/CommonFunctions.robot


*** Variables ***


*** Keywords ***
User click Tags menu on left sidebar
    Click Tags menu on left sidebar
    FOR     ${i}    IN RANGE   1    5
        ${status} = 	Run Keyword And Return Status	Click Tags menu on left sidebar
        Run Keyword If 	   ${status} == 'FAIL'    Click Tags menu on left sidebar
    END

User click Create button on Tags page
    Click button        ${createButton}




#Verify case
User can verify the Create Tags Range form
    CommonFunctions.Verify the visible of Create Tags Range popup
    CommonFunctions.Verify the label of Assign To field should be "Assign To"
    CommonFunctions.Verify the label of Name field should be "Name"
    CommonFunctions.Verify the label of Vessel field should be "Vessel"
    CommonFunctions.Verify the label of Start field should be "Start"
    CommonFunctions.Verify the label of End field should be "End"

User will see the error message for required fields
    CommonFunctions.Verify the error message of Name field should be "Name is required"
    CommonFunctions.Verify the error message of Vessel field should be "Vessel is required"
    CommonFunctions.Verify the error message of Start field should be "Start is required."
    CommonFunctions.Verify the error message of End field should be "End is required."

