*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../CommonFiles/CommonFunctions.robot
Resource    ../CommonFiles/GetTasks.robot
Resource    ../CommonFiles/SetVariableKeywords.robot
Resource    ../CommonFiles/InputTasks.robot
Variables    ../WebElements/vesselElements.py

*** Variables ***
@{validDomain}=    domain1=es-sea.com  domain2=eaglestar.com.my    domain3=sparescnx.com
${invalidDomain}=   google.com

*** Keywords ***
#common keyword
Select first Item to edit
    Retry to verify element 3 times     ${firstNameInList}
    click element    ${firstNameInList}
    User click Edit button

#reload page
User try to reload the page
    Reload Page

#dropdown list
User click dropdown list: ${dropdownListName}
    ${dropdownListLocation}=    set variable    xpath://form/div[contains(.,'${dropdownListName}')]/child::div
    #wait until element is visible       ${dropdownListLocation}
    click element       ${dropdownListLocation}


#input data
User input into ${fieldName} text field with value as "${inputValue}"
    [Documentation]    use for input text field name
    ${inputField}=    set variable      xpath://label[contains(text(), '${fieldName}')]/following-sibling::div/input   #xpath://input[@id='${fieldName}']
    ${autoString}=    Generate Random String    8  [LETTERS]
    ${inputData}=   set variable    Auto ${inputValue} ${autoString}
    input text      ${inputField}       ${inputData}
    mouse out       ${inputField}
    [Return]        ${inputData}

User input into ${fieldName} field (only number) with value contains ${no} integers
    [Documentation]    use for field only accept number
    ${inputField}=  set variable    xpath://label[contains(text(), '${fieldName}')]/following-sibling::div/input
    ${autoNumber}=  generate random string     ${no}    [NUMBERS]
    input text      ${inputField}       ${autoNumber}
    mouse out       ${inputField}
    ${imoNo}=       set variable    ${autoNumber}
    set suite variable              ${imoNo}
    [Return]        ${imoNo}

User input into ${emailField} field with valid email
    [Documentation]    use for email input field in add new vessel form
    ${inputField}=      set variable    xpath://label[contains(text(), '${emailField}')]/following-sibling::div/input
    Set Valid Email Value       #return ${validEmail}
    Input Text       ${inputField}       ${validEmail}

Edit email value with invalid value
    [Documentation]    use for email input field with cases: validEmail, invalidDomainEmail, invalidFormatEmail
    [Arguments]    ${inputData}
    ${typeOfEmail}=             set variable    ${inputData}
    run keyword if    '${typeOfEmail}'=='invalidDomainEmail'      Input invalid email value       ${emailInput}      invalidDomainEmail
    ...    ELSE IF    '${typeOfEmail}'=='invalidFormatEmail'      Input invalid email value       ${emailInput}      invalidFormatEmail
    ...    ELSE IF    '${typeOfEmail}'=='lackOfDomain'            Input invalid email value       ${emailInput}      lackOfDomain
    ...    ELSE       fail    Could not process this case with invalid data: ${inputData}.
    ...                       Correct: validEmail, invalidDomainEmail, invalidFormatEmail, lackOfDomain

# Verify cases
User will see the error message for ${fieldName} field should be "${errorMessage}"
    [Documentation]
    ${fieldLocation}=    set variable       xpath://label[contains(text(), '${fieldName}')]/following-sibling::p
      #//form/div/label[contains(text(),'${fieldName}')]/ancestor::div[1]
    wait until element is visible       ${fieldLocation}    10s     Error message location not found
    element should contain              ${fieldLocation}        ${errorMessage}

User will see the ${typeOfMesssage} popup as: "${messageText}"
    wait until element is visible    ${messagePopup}
    element text should be    ${messagePopup}     ${messageText}

#Verify common form
Verify the title of ${fieldName} field in the form should be ${titleText}
    wait until element is visible    ${fieldLocation}
    element should contain           ${titleOfFormLocation}     ${titleText}

Verify the label of ${fieldName} field should be "${labelText}"
    ${fieldLocation}=   set variable       xpath://div/label[contains(text(),'${fieldName}')]
#    xpath://form/div[contains(.,'${fieldName}')]
    wait until element is visible           ${fieldLocation}
    element should contain        ${fieldLocation}        ${labelText}

Verify the error message of ${fieldName} field should be "${errorMessage}"
    #{fieldLocation}=    set variable       xpath://div/label[contains(text(),'${fieldName}')]/child::p
    ${fieldLocation}=    set variable       xpath://label[contains(text(),'${fieldName}')]/parent::div/descendant::p
#    xpath://form/div[contains(.,'${fieldName}')]/child::p
    wait until element is visible           ${fieldLocation}        10s
    element should contain         ${fieldLocation}        ${errorMessage}

# Check existed item
It existed an ${itemName} on the ${listName} list
    ${itemLocator}=     set variable    xpath://tbody[contains(.,'Name')]/child::tr[1]/child::td[2]/div[2]
    Get the first item's Name in the list
