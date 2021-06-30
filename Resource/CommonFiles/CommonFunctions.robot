*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource  ../../TestData/config.robot
Resource    ../PageObjects/LoginPage.robot
Resource    WaitKeywords.robot


*** Variables ***


*** Keywords ***
#Set up and down case
Start TestCase
    #Open Browser    about:blank    ${url.${env}}    ${browser}    executable_path=${executable_path}
    Open Browser  ${url.mp}    ${browser}    executable_path=${executable_path}
    Maximize Browser Window

Start TestCase With Login
    CommonFunctions.Start TestCase
    LoginPage.Login to Admin Portal Successfully     ${username.mpUser}   ${password.mppd}
    ${status}=  run keyword and return status    wait until element is not visible       ${signInbutton}
    run keyword unless    ${status}     fail    Login failed. Setup for test could not established

End TestCase
    Close Browser

End TestCase For All Browsers
    Close All Browsers

#Clear function
Clear Text Field
    [Arguments]    ${fieldLocator}
    #Press Keys     ${fieldLocator}      CTRL+a
    ${value}=     Get Element Attribute   ${fieldLocator}      value
    ${backspaces count}=    Get Length      ${value}
    Run Keyword If    """${value}""" != ''       # if there's no current value - no need to slow down by an extra SE call
    ...     Repeat Keyword  ${backspaces count +1}  Press Keys     ${fieldLocator}        BACKSPACE     # this is the code for the backspace key; "backspaces count +1" - just to be sure


#Click button
User click ${buttonName} button
    ${buttonLocation}=  Set Variable       xpath://button[contains(.,'${buttonName}')]
    Wait for element visible            ${buttonLocation}
    click button        ${buttonLocation}
    sleep    2s

#Assert element
Title of ${formName} should be "${titleLabel}"
    ${titleLocator}=   set variable        xpath://h6[contains(text(), '${titleLabel}')]
    wait until element is visible          ${titleLocator}      10s
    element should contain      ${titleLocator}    ${titleLabel}

Form should contain button: "${buttonName}"
    ${buttonLocation}=  set variable    xpath://button[contains((.),'${buttonName}')]
    element should be visible       ${buttonLocation}


#date solution
Set last date of month
    [Arguments]    ${currentMonth}
    ${oddMonthList} =   Create List   1    3    5    7   8    10    12
    ${evenMonthList}=   create list    4    6   9   11
    ${oddMonth}=        run keyword and return status    List should contain value       ${oddMonthList}         ${currentMonth}
    ${evenMonth}=       run keyword and return status    List should contain value       ${evenMonthList}        ${currentMonth}







