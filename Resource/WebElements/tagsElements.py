
#create form
createButton = "xpath://button[contains(.,'Create')]"
createForm = "xpath://div[@role='dialog']"
titleOfForm = "xpath://div[@role='dialog']/descendant::h6"

assignToDropdownList = "xpath://label[contains((.),'Assign To')]//following-sibling::div/div/span"


#table of data
tableLocator = "xpath://table[@role='grid']"
headerOfTable = "xpath://h2[1]"
firstRow = "xpath://table[1]/tbody[1]/tr[1]"

#footer table
footerTable = "xpath://table[@role='grid']//following::table[1]"
itemPerPage = "xpath://p[contains(text(), 'Rows per page:')]/parent::div/p[2]"
nextButton = "xpath://table[@role='grid']//following::table[1]/tfoot/tr/td/div/div/div/div[3]/button[2]"
