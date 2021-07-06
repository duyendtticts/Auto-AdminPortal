#Ship owners menu bar
infoMenu = "xpath://span[contains(., 'INFO')]"
vesselClassesMenu = "xpath://span[contains(., 'VESSEL CLASSES')]"
vesselMenu = "xpath://button[contains(., 'VESSELS')]"
settingsMenu="xpath://span[contains(., 'SETTINGS')]"


#ship owner table
itemInTable =   "xpath://*[starts-with(@id,'mui-')]/following::p"
firstItemOfTable =  "xpath://table[@role='grid']/tbody/tr/td[1]"



#Vessel Tab
createVesselButton = "xpath://h2[contains(text(),'Vessel')]/ancestor::div[3]/child::span/child::div[1]/button"
vesselClassDropdownList = "xpath://*[@id='menu-vesselClass']/div/ul"
vesselClassField = "xpath://div[@id='vesselClass']"


#add vessel form
currentDateInCurrentMonth = "xpath://*[@class='rdrDay rdrDayToday rdrDayEndOfMonth']"
fiveDayago = "xpath://*[@class='rdrDay rdrDayToday rdrDayEndOfMonth']/preceding::button[5]"
nextMonthButton = "xpath://button[@class='rdrNextPrevButton rdrNextButton']"
preMonthButton  = "xpath://button[@class='rdrNextPrevButton rdrPprevButton']"
twoNextDayInNextMoth = "xpath://*[@class='rdrDay rdrDayPassive rdrDayToday']/following::button[2]"
currentDateInNextMonth = "xpath://*[@class='rdrDay rdrDayPassive rdrDayToday']"