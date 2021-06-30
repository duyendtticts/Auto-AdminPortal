createVesselForm = "xpath://h6[contains(text(), 'Create Vessel Class')]/ancestor::div[2]"


# Vessel INFO
emailValue = "xpath://p[contains(text(), 'Email')]/following::p[1]"


#Vessel List form
firstEmailInList = "xpath://tbody/tr[1]/td[5]/div[2]"  #//td[contains(., 'Email') and @xpath='1']/div[2]

#edit form
headerText = "xpath://h6[text()='Update Vessel']"
emailInput = "xpath://input[@id='vesselDefaultEmail']"
emailErrorMessage = "xpath://input[@id='vesselDefaultEmail']/following::p[1]"
successPopup= "xpath://*[@class='MuiAlert-message']"
