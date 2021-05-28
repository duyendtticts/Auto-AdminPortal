*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Variables    ../WebElements/vesselClassElements.py
Resource    ../CommonFiles/CommonFunctions.robot
Resource    ../CommonFiles/GetKeywords.robot

*** Variables ***


*** Keywords ***
Input ${inputData} into Vessel Name field
    input text      ${vesselNameTextBox}       ${inputData}
    mouse out       ${vesselNameTextBox}

Get element xpath of item no #${noItem} in the Vessel Class list
    ${vesselClassNameLocator}=  set variable    xpath://tbody[contains(.,'Name')]/child::tr[${noItem}]/child::td[2]/div[2]
    [Return]    ${vesselClassNameLocator}

Input existed Vessel class name
    Get element xpath of item no #2 in the Vessel Class list
    Get the first item's Name in the list       ${firstVesselClassNameInList}
    input text      ${vesselNameTextBox}       ${firstItemName}
    mouse out       ${vesselNameTextBox}

Create with the existed name in lower case on the Vessel Class list
    Get the first item's Name in the list       ${firstVesselClassNameInList}
    ${inputText} =  convert to lower case       ${firstItemName}
    Input ${inputText} into Vessel Name field

Input existed vessel class name contains space before it
    Get the first item's Name in the list       ${firstVesselClassNameInList}
    ${inputField}=    set variable      xpath://label[contains(text(), 'Vessel class name')]/following-sibling::div/input
    ${inputText} =  set variable        ${SPACE}${firstItemName}
    Input ${inputText} into Vessel Name field

Input existed vessel class name contains space after it
    Get the first item's Name in the list       ${firstVesselClassNameInList}
    ${inputText} =  set variable        ${firstItemName}${SPACE}
    Input ${inputText} into Vessel Name field

Input existed vessel class name contains spaces before and after it
    Get the first item's Name in the list       ${firstVesselClassNameInList}
    ${inputText} =  set variable        ${SPACE}${firstItemName}${SPACE}
    Input ${inputText} into Vessel Name field