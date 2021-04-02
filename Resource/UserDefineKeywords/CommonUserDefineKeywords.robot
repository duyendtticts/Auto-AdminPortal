*** Settings ***
Library    SeleniumLibrary
Library    String
#Resource    ../CommonFiles/CommonFunctions.robot

*** Variables ***
&{validDomain}=    domain1=es-sea.com  domain2=eaglestar.com.my    domain3=sparescnx.com
${invalidDomain}=   google.com

*** Keywords ***
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

User input into ${fieldName} field (only number) with value contains ${no} integers
    [Documentation]    use for field only accept number
    ${inputField}=  set variable    xpath://label[contains(text(), '${fieldName}')]/following-sibling::div/input
    ${autoNumber}=      generate random string     ${no}    [NUMBERS]
    input text      ${inputField}       ${autoNumber}
    mouse out       ${inputField}

User input into ${emailField} field with ${typeOfEmail} email
    [Documentation]    use for email input field
    ${inputField}=      set variable    xpath://label[contains(text(), '${emailField}')]/following-sibling::div/input
    ${randomString}=    generate random string    6     [NUMBERS]
    ${validEmail}=              set variable    AutoTest_Email_${randomString}@${validDomain.domain2}
    ${invalidFormatOfEmail}=    set variable    AutoTest_Email_${randomString}${validDomain.domain2}
    ${invalidDomainEmail}=      set variable    AutoTest_Email_${randomString}@${invalidDomain}
    RUN KEYWORD IF    '${typeOfEmail}' == 'valid'     input text      ${inputField}       ${validEmail}
    ...         ELSE IF    '${typeOfEmail}' == 'invalid format'    input text      ${inputField}       ${invalidFormatOfEmail}
    ...         ELSE IF    '${typeOfEmail}' == 'invalid domain'    input text      ${inputField}       ${invalidDomainEmail}
    ...         ELSE         fail        No result for this case
    mouse out    ${inputField}

# Verify cases
User will see the error message for ${fieldName} field should be "${errorMessage}"
    [Documentation]
    ${fieldLocation}=    set variable       xpath://form/div/label[contains(text(),'${fieldName}')]/ancestor::div[1]
    element should contain         ${fieldLocation}        ${errorMessage}

User will see the successfully popup as: "${messageText}"
    wait until element is visible    ${successPopup}
    element text should be    ${successPopup}     ${messageText}

#Verify common form
Verify the title of ${fieldName} field in the form should be ${titleText}
    wait until element is visible    ${fieldLocation}
    element should contain           ${titleOfFormLocation}     ${titleText}

Verify the label of ${fieldName} field should be "${labelText}"
    ${fieldLocation}=   set variable       xpath://form/div[contains(.,'${fieldName}')]
    wait until element is visible           ${fieldLocation}
    element should contain        ${fieldLocation}        ${labelText}

Verify the error message of ${fieldName} field should be "${errorMessage}"
    ${fieldLocation}=    set variable       xpath://form/div[contains(.,'${fieldName}')]/child::p
    wait until element is visible           ${fieldLocation}        10s
    element should contain         ${fieldLocation}        ${errorMessage}