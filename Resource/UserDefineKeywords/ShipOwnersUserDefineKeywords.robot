*** Settings ***
Library    SeleniumLibrary
Variables    ../WebElements/shipOwnersElements.py
Variables   ../WebElements/commonWebElements.py
Resource    ../PageObjects/ShipOwnersPage.robot
Resource    ../CommonFiles/CommonFunctions.robot

*** Variables ***


*** Keywords ***
User go to Ship Owner page
    ${status}=   run keyword and return status   wait until element is visible       xpath://button[contains(., 'Cancel')]       10s
    run keyword if  '${status}'=='True'   User click Cancel button
    wait until element is visible       ${shipOwnersMenu}       10s
    click element    ${shipOwnersMenu}
    ${passed}=  run keyword and return status    wait until page contains element    ${itemInTable}      10s
    run keyword unless    ${passed}     fail    The list of ship owners could not shown after 10s waiting
    ${totalItem}=    get text    ${itemInTable}
    run keyword unless      '${totalItem}'== '0-0 of 0'     click element    ${firstItemOfTable}

User clicks on the menu "${menuTabName}"
    wait until page contains element    ${vesselMenu}       20s
    ${menuName}=    builtin.get variable value    ${menuTabName}
    BuiltIn.run keyword if      '${menuName}'=='VESSELS'                Click tab button    ${menuName}
    ...      ELSE IF            '${menuName}'=='INFO'                   Click tab button    ${menuName}
    ...      ELSE IF            '${menuName}'=='VESSEL CLASSES'         Click tab button    ${menuName}
    ...      ELSE IF            '${menuName}'=='SETTINGS'               Click tab button    ${menuName}
    ...      ELSE               fail            Incorrect tab menu      [Return]

#    BuiltIn.run keyword if      '${menuName}'=='VESSELS'                click button    ${vesselMenu}
#    ...      ELSE IF            '${menuName}'=='INFO'                   click button    ${infoMenu}
#    ...      ELSE IF            '${menuName}'=='VESSEL CLASSES'         click button    ${vesselClassesMenu}
#    ...      ELSE IF            '${menuName}'=='SETTINGS'               click button    ${settingsMenu}
#    ...      ELSE               fail            Incorrect tab menu      [Return]

User will see the title "${titleOfTab}" with list of ${listItems}
    Page Should Contain     ${titleOfTab}

User will see the "${buttonName}" button at the ${elementLocator}
    Element should contain     ${elementLocator}    ${buttonName}