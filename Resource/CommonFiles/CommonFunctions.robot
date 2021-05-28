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
    Open Browser  ${url.${env}}    ${browser}    executable_path=${executable_path}
    Maximize Browser Window

Start TestCase With Login
    CommonFunctions.Start TestCase
    LoginPage.Login to Admin Portal Successfully     ${username.user1}   ${password}
    ${status}=  run keyword and return status    wait until element is not visible       ${signInbutton}
    run keyword unless    ${status}     fail    Login failed. Setup for test could not established

End TestCase
    Close Browser

End TestCase For All Browsers
    Close All Browsers


#Click button
User click ${buttonName} button
    ${buttonLocation}=  Set Variable       xpath://button[contains(.,'${buttonName}')]
    ${passed}=  run keyword and return status    wait until element is visible       ${buttonLocation}       40s
    run keyword if  ${passed}    click button        ${buttonLocation}
    ...     ELSE      wait until keyword succeeds     50s      5s    click button        ${buttonLocation}
    sleep    3s

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







