*** Settings ***
Test Teardown     Take Screenshot
Resource          ../Global/super.robot

*** Test Cases ***
AC_007 Tracking Number Length Limitation with Invalid Data(Numbers<5).
    [Documentation]    This Test-Case is used for Selecting a Requisition and Performing Complete from Tool-bar-Grid and Tracking Number Length by Passing Invalid Data(<5)
    [Tags]    test_case_id=AC_007
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_007    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 1 : Go to Quick Menu
    Log    Test Step 2 : Move to Accessioning.Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3: Select the Requisition
    Select Multiple Requisitions Checkbox    1
    Log    Requisition Checkbox is Selected
    Log    Test Step 4 :Click on the COMPLETE Icon (Right Mark)
    Navigate to Tool Bar Grid Buttons    Complete
    Log    Navigated to ''Complete" Page
    Log    Test Step 5: Enter Invalid Digit Tracking Number
    Log    Test Step 6: Click on Start Processing
    Validate Error Messages in Complete Processing Page    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

AC_011 Verify Create Infectious Disease Requisition from Accessioning module without filling required fields
    [Documentation]    This Test Case is about Create Requisition without filling Mandatory fields
    ${testdata}    Read TestData From Excel    AC011    NewRequisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Navigate to Quick Menu
    Log    Test Step 4 : Click on Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accesioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Succesfully Refused Alert
    Log    Test Step 5 :Select Infectious Disease Requisition
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Log    Test Step 6 :Click on Save button without filling required fields
    Log    Test Step 7:Verify error "Please fill in all required fields"
    Log    Test Step 8 : Try to fill values for required fields without filling Client site
    Log    Test Step 9 :Select value for Client site and click on Save button
    Log    Test Step 10 : Verify error "Please fill in all required fields"
    Log    Test Step 11 : Select value for Ordering Physician and click on Save button
    Log    Test Step 12 : Verify error "Please fill in all required fields"
    Log    Test Step 13 : Select value for Contact and click on Save button
    Log    Test Step 14 : Verify error "Please fill in all required fields"
    Log    Test Step 15 : Select value for Patient and click on Save button
    Log    Test Step 16 : Verify error "Please fill in all required fields"
    Log    Test Step 17 : Select "Date Received" and click on save button
    Log    Test Step 18 : Verify error "Please fill in all required fields"
    Log    Test Step 19 : Click on save button with out filling "Dr Signed on page"
    Log    Test Step 20 : Verify error "Please fill in all required fields"
    Log    Test Step 21 : Verify error "Please select at least one Panel"
    Log    Test Step 22 :Select Panel and click on save button
    Log    Test Step 23 :Verify error "Please select the collection date for each collected sample"
    Log    Test Step 24 : Select value for Swab Site and click on Save button
    Log    Test Step 25 : Verify error "Please fill in all required fields"
    Log    Test Step 26 : Click on Save Button
    Save Infectious Disease Requisition Without Filling Mandatory Fields    ${testdata}
    Log    Navigate to On Hold Tab
    Navigate to Module And Tab    Accessioning    On-Hold
    Log    Select Infectious Disease Requisition From On Hold Tab
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Log    Validate Mandatory Fields From Create New Infectious Disease Requisition
    Save Infectious Disease Requisition Without Filling Mandatory Fields    ${testdata}
    Log    Go to Missing Tab Page
    Navigate to Module And Tab    Accessioning    Missing data
    Log    Select Infectious Disease Requisition From Missing Data Menu
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Log    Validate Mandatory Fields From Create New Infectious Disease Requisition
    Save Infectious Disease Requisition Without Filling Mandatory Fields    ${testdata}
    Log    Go to All Category Page
    Navigate to Module And Tab    Accessioning    All
    Log    Select Infectious Disease Requisition From All Tab Menu
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Log    Validate Mandatory Fields From Create New Infectious Disease Requisition
    Save Infectious Disease Requisition Without Filling Mandatory Fields    ${testdata}
    Choose File in View Documents

AC-013 Verify Admin is able to Add Panels to the Requisition from Accessioning
    [Documentation]    This Test Case is About Admin is able to Validate Order button without selecting panels and Validating Add and Remove Panel Flow
    ${testdata}    Read TestData From Excel    AC013    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3: Go to Quick Menu
    Log    Test Step 4 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Succesfully Refused Alert
    ${RID}    Get First Requisition Rid in Pending in Accesioning
    Log    Get First Requsition RID
    Log    Test Step 5 : Search For Requisition with Sample ID
    Log    Test Step 6 : Click on Details
    Log    Test Step 7: Navigate to Panels Tab
    Log    Test Step 8 :Click on Add Panels
    Log    Test Step 9: Select any panel and click on Order
    Log    Test Step 10:Verify Panel is added
    Verify User is Able to Create Panel    ${testdata}    ${RID}
    Log    Succesfuly Added New Panel
    Navigate to All Category Menu
    Log    Set Filter Type as Accesioned
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Log    Get First Requisition Id for Creating New Panel
    ${RID}    Get First Requisition RID
    Log    est Step 11:Verify User Able to create Panel in All Tab
    Log    Search For Requisition with Sample ID in All Tab
    Log    Click on Details in All Tab
    Log    Navigate to Panels Tab in All Tab
    Log    Click on Add Panels in All Tab
    Log    Select any panel and click on Order in All Tab
    Log    Verify Panel is added in All Tab
    Verify User is Able to Create Panel    ${testdata}    ${RID}
    Log    Succesfuly Added New Panel
    Logout From Healthtrack Application
    Log    Loggedout from HealthtrackRX application
    [Teardown]    Take Screenshot And Close Browsers

AC-014 Remove panels from Requisition from Accessioning module ->Select Panels
    [Documentation]    This Test Case is About Verifying Remove Panel in Requisition
    ${testdata}    Read TestData From Excel    AC014    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Succesfully Refused Alert
    Get First Requisition Id Without ROB LAB Patient Name
    Log    Succesfully Refused Alert
    ${Updated_Panel_Name}    Verify User is Able to Create Panel    ${testdata}    ${RID}
    Log    Succesfuly Added New Panel
    Log    Verify Admin able to Remove Created Panels
    Log    Test Step 5 :Search For Requisition with Sample ID
    Log    Test Step 6 :Click on Details
    Log    Test Step 7 :Navigate to Panels Tab
    Log    Test Step 8 :Click on select Panels
    Log    Test Step 9 :Remove panels on panels tab
    Log    Test Step 10.Verify Panel is removed
    Remove Created Panel    ${Updated_Panel_Name}
    Log    Succesfully Removed Created Panels
    Log    Navigate to All Menu For Validating Remove Panels
    Navigate to All Category Menu
    Log    Select Filter Status as Accesioned
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Log    Get First Requisition Id
    ${RID}=    Get First Requisition RID
    Log    Create Panel For Validating Remove Panel in All Tab
    Log    Search For Requisition with Sample ID in All Tab
    Log    Click on Details in All Tab
    Log    Navigate to Panels Tab in All Tab
    Log    Click on select Panels in All Tab
    Log    Remove panels on panels tab in All Tab
    Log    Verify Panel is removed in All Tab
    ${Updated_panel_name_2}    Verify User is Able to Create Panel    ${testdata}    ${RID}
    Log    Verify Admin able to Remove Created Panels
    Remove Created Panel    ${Updated_panel_name_2}

AC-016 Negative : Add panels to Requisition from Accessioning module without selecting Panel
    [Documentation]    This Test Case is About Verifying Error Message When Ordered a Panel Without Selecting Panel in Add Panel page
    ${testdata}    Read TestData From Excel    AC016    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3.Goto Quick Menu
    Log    Test Step 4 :Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Succesfully Refused Alert
    Log    Get First Rid in Requisition List
    Get First Requisition Rid in Pending in Accesioning
    Log    Test Step 5.Search For Requisition with Sample ID
    Log    Test Step 6.Click on Details
    Log    Test Step 7.Navigate to Panels Tab
    Log    Test Step 8.Click on Add Panels
    Log    Test Step 9.Click on Order without selecting any panel
    Log    Test Step 10.Verify Panel is added
    Verify User is Able to Create Panel    ${testdata}    ${RID}
    Log    "Must be select at least one panel" Error should be thrown and panel should not be added
    Log    Go to On Hold Page
    Navigate to On-Hold Menu
    Log    Get First Rid in Requisition List
    ${RID}=    Get First Requisition RID
    Log    Search For Requisition with Sample ID in On Hold Tab
    Log    Click on Details in On Hold Tab
    Log    Navigate to Panels in On Hold Tab
    Log    Click on Add Panels in On Hold Tab
    Log    Click on Order without selecting any panel in On Hold Tab
    Log    Verify Panel is added in On Hold Tab
    Verify User is Able to Create Panel    ${testdata}    ${RID}
    Log    Navigate to Missing Data Page
    Navigate to Missing_Data Menu
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Log    Get First Rid in Requisition List
    Get First Requisition RID
    Log    Search For Requisition with Sample ID in Missing Tab
    Log    Click on Details in Missing Tab
    Log    Navigate to Panels in Missing Tab
    Log    Click on Add Panels in Missing Tab
    Log    Click on Order without selecting any panel in Missing Tab
    Log    Verify Panel is added in Missing Tab
    Verify User is Able to Create Panel    ${testdata}
    Log    Go to All Category Page
    Navigate to All Category Menu
    Log    Get First Rid in Requisition List
    Get First Requisition Rid in All in Accesioning
    Log    Search For Requisition with Sample ID in All Tab
    Log    Click on Details in All Tab
    Log    Navigate to Panels in All Tab
    Log    Click on Add Panels in All Tab
    Log    Click on Order without selecting any panel in All Tab
    Log    Verify Panel is added in All Tab
    Verify User is Able to Create Panel    ${testdata}

AC_019 Verify Regenerate Requisition Form from Requisition Hamburger Menu
    [Documentation]    This Test-Case is used to Verify Regenerate Requisition Form from Requisition Hamburger Menu
    Log    Read Test-data from Excel File
    ${Testdata}    Read TestData From Excel    AC_019    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${RID}    Get First Requisition Rid in Pending in Accesioning
    Log    Requisition is Selected
    Log    Test Step 5: Click on "Regenerate Requisition Form".
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Regenerate Req Form
    Log    Options are displayed & Navigated to Requisition Hamburger "Regenerate Requisition Form" Page
    Verify Message    ${message.successfully}    ${MEDIUM_WAIT}
    Log    Verified the Pop-up Message - "Successfully"
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_021 Verify Print Preview from Requisition Hamburger Menu
    [Documentation]    This Test-Case is used to Verify Print Preview from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC021    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${RID}    Get First Requisition Rid in Pending in Accesioning
    Log    Requisition is Selected
    Log    Added Comments into Requisition through Hamburger_Comments Page
    Log    Test Step 5: Click on "Regenerate Requisition Form".
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Print Preview
    Log    Options are displayed and Navigated to Requisition Hamburger "Print Preview" Page
    Log    Verifying the File is Downloaded When Clicked On Print Preview
    Verify Expected File is Downloaded into Local
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC_026 Verify Reject from Requisition Hamburger Menu.
    [Documentation]    This Test-Case is used to Verify Reject from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC026    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${RID}    Get First Requisition Rid in Pending in Accesioning
    Log    Requisition is Selected
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Reject
    Log    "Rejection Modal" is Displayed & Navigated to Requisition Hamburger "Reject" Page
    Log    Test step 5: Fill all the Details and Click on Save.
    Select Predefined Comments in Reject Comments Page    ${Testdata}
    Log    Selected Predefined Comments
    Enter Requirement Comments    ${testdata}[Predefined_comment]
    Log    Save sample comments
    Perform Actions    Save    ${MEDIUM_WAIT}
    Log    Click on Save
    Verify Text Message    Requisition Rejected    ${MEDIUM_WAIT}
    Log    "Requisition Rejected" Pop-up Message is Displayed
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot

AC_028 Verifying View Ordering Physician Signature
    [Documentation]    This test case is about Viewing Order Physician Signature
    ${testdata}    Read TestData From Excel    AC028    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Navigate to Quick Manual to select "Accessioning"
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Get First Requisition Sample Id
    Log    Test Step 4: Select any one Requisition ID and click on Requisition Hamburger Menu
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Search For Details in Home Using Sample Id
    Navigate to Requisition Hamburger Sub Menu Options    ${sample_id}    ${testdata}[Hamburger_submenu_option]    sample
    Log    Test Step 5 :Click on View Ordering Physician Signature
    Verify Order Physician Signature Label
    Log    Verified Physician Signature Label
    Logout From Healthtrack Application
    Log    Loggedout from HealthtrackRX application
    [Teardown]    Take Screenshot And Close Browsers

AC_029 Verify Add Requisition Error from Hamburger Menu
    [Documentation]    This Test-Case is used to Verify Add Requisition Error from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC_029    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    Log    Test Step 5: Select one Requisition Error and Click on Save
    Verify User Able to Add New Requisition Error    ${Testdata}
    [Teardown]    Take Screenshot

AC_035 Verifying if Icon Grid Tool Bar Names Below the Respective Icons
    [Documentation]    This Test Case is about Validating Tool Bar Grid Names With Comparing Mouse Hovering Names
    ${testdata}    Read TestData From Excel    AC035    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 4:Observe that the names in the Tool Bar not displaying completely
    Verify Tool Bar Grid Names    ${testdata}
    Log    Verified Tool Bar Grid Button Names
    Logout From Healthtrack Application
    Log    Loggedout from HealthtrackRX application

AC_037 Tracking Number Length Limitation with Invalid Data(Alphabets).
    [Documentation]    This Test-Case is used for Selecting a Requisition and Performing Complete from Tool-bar-Grid and Tracking Number Length by Passing Invalid Data(Alphabets & Special-Characters)
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC037    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Goto Quick Menu & Move to Accessioning
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3: Select the Requisition Id and Click on the COMPLETE Icon(Right Mark).
    Select Multiple Requisitions in Accessioning in Pending    1
    Log    Requisition Checkbox is Selected
    Navigate to Tool Bar Grid Buttons    Complete
    Log    User is Navigated to ''Complete" Page
    Log    Test Step 4: Enter Tracking Number and Click on Start Processing Button
    Validate Error Messages in Complete Processing Page    ${testdata}
    Log    Perform Action in Complete All Page
    [Teardown]    Take Screenshot and Close Browsers

AC_041 Verifying Requisition Form
    [Documentation]    This Test Case is about Verify Requisition Form Data In Pdf
    ${testdata}    Read TestData From Excel    AC041    Accesioning
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on Requisition Form from tool Bar Grid.
    Select Multiple Requisitions in Accessioning in Pending    2
    Log    Selected Multiple Requsiitions
    Navigate to Tool Bar Grid Buttons For PDF    ${testdata}[Tool_bar_grid_button]
    Log    Navigated to Requisition Form Page
    ${pdf_data}    Read Pdf Data
    Verify Pdf data    ${pdf_data}    ${home_page_requisition_id}[0]
    Log    Verified requisition forms are displayed in new tab
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC-042 Verifying Print Labels
    [Documentation]    This Test Case is About Verifying PDF Data by clicking Print Labels option
    ${testdata}    Read TestData From Excel    AC042    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 4: Select multiple requisition and Click on Print Labels from tool bar grid.
    Log    Test Step : 5.Select Label Template and click on Print button.
    Verify Print Labels in Accesioning    ${testdata}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC_043 Verifying if Print Labels With Sample Lables number
    [Documentation]    This Test Case is About Printing Labels with Samples Labels Number Label Template Option
    ${testdata}    Read TestData From Excel    AC043    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 4 : Select Multiple Requisition and Click on Print Labels from Tool Bar Grid.
    Verify Print Labels in Accesioning    ${testdata}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC_045 Negative : Reject Requisition from Accessioning module without filling mandatory fields
    [Documentation]    This Test Case is About Verifying Error Message by Rejecting Requisition without filling mandatory Fields
    ${testdata}    Read TestData From Excel    AC045    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3.Goto Quick Menu
    Log    Test Step 4 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5.Go to Details tab and click on Samples
    Log    Clicked on First Requisition Details Button
    Log    Test Step 6 : Click on Reject
    Log    Test Step 7: Click on save button without Filling mandatory fields
    Log    Test Step 8: Verify error "Reason Rejection is a mandatory field"
    Click on Save in Reject Requisition Page and Verify Error Message    ${testdata}
    Log    Succesfully Verified Error Message When Clicked On Save
    Log    Test Step 9 : Navigate to All Page and Verify Reason Rejection Field in Samples Page
    Click On All Menu in Accesioning
    Log    Select All Menu in Accesioning Page
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Log    Go to Details tab and click on Samples in All Tab
    Log    Click on Reject in All Tab
    Log    Click on save button without Filling mandatory fields in All Tab
    Log    Verify error "Reason Rejection is a mandatory field" in All Tab
    Click on Save in Reject Requisition Page and Verify Error Message    ${testdata}
    Log    Verify Error Message When Clicked On Save
    [Teardown]    Take Screenshot And Close Browsers

AC_059 Verify if Requisition record complete the processing after the action remove from requisition record in accessioning modal.
    Log    Read test data from excel file
    ${new_requisition_testdata}    Read TestData From Excel    AC118    NewRequisition
    ${testdata}    Read TestData From Excel    AC059    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${new_requisition_testdata}
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Test Step 4: Select Multiple Requisitions and Click on Complete icon from Tool Bar Grid.
    Search For Created Sample Details In Accesioning Module    ${testdata}    1    ${sample_id}
    Select Multiple Requisitions Checkbox    1
    Log    Requisition Checkbox is Selected
    Navigate to Tool Bar Grid Buttons    Complete
    Log    Requisition "Complete all" page is displayed.
    Log    Test Step 5 : Enter the Received Date and Tracking Number<<Click on Start Processing Button
    Log    Test Step 6 : Click on Close Modal and Refresh Grid.
    Perform Actions in Complete Page From Tool Bar Grid Buttons    ${testdata}    Requisition Complete All    "Close Modal and Refresh Grid"
    Log    Requisition Processed Completed Successfully is Displayed
    Log    Verified the Requisition Bar Code Label as New Tab
    [Teardown]    Take Screenshot and Close Browsers

AC_062 Verify Regenerate Requisition Form from Tool Bar Grid
    [Documentation]    This Test-Case is used to Verify Regenerate Requisition Form from Tool-Bar-Grid by Selecting Requisitions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisitions and Click on Regenerate Requisition Form from Tool Bar Grid
    Select Multiple Requisitions Checkbox    2
    Log    Requisition Checkbox is Selected
    Navigate to Tool Bar Grid Buttons    Regenerate Form
    Log    Navigated to ''Regenerate Form"
    Verify Message    ${message.successfully}    ${LONG_WAIT}
    Log    Verified "Successfully" Pop-up Message.
    [Teardown]    Take Screenshot

AC068 Validate file upload from Accessioning module->Attachments
    [Documentation]    This Test Case is About Verifying Upload a File in Attachments
    ${testdata}    Read TestData From Excel    AC068    Accesioning
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Menu
    Log    Test Step 4 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5 : Go to Details tab and click on Attachments
    Click on First Element Details Button
    Navigate To Attachments Page in Accesioning    ${testdata}
    Log    Test Step 6 : Click on Upload button
    Log    Test Step 7 : Choose file and select file type
    Log    Test Step 8 : Click on Save button
    Log    Test Step 9 :Verify on attachments tab the document is displayed
    Upload File And Verify In Attachments    ${testdata}
    Log    Test Step 10 : Navigate to All Menu and Verify File Upload
    Click On All Menu in Accesioning
    Log    Go to Details tab and click on Attachments
    Click on First Element Details Button
    Navigate To Attachments Page in Accesioning    ${testdata}
    Log    Click on Upload button in All Tab
    Log    Choose file and select file type in All Tab
    Log    Click on Save button in All Tab
    Log    Verify on attachments tab the document is displayed in All Tab
    Upload File And Verify In Attachments    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

AC-070 Delete Attachment from Requisition from Accessioning module ->Attachments
    [Documentation]    This Test Case is about Deleting an Attachment of Requisition
    ${testdata}    Read TestData From Excel    AC070    Accesioning
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Go to Quick Menu
    Log    Test Step 4 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5 : Go to Details tab and click on Attachments Tab
    Click on First Element Details Button
    Log    Navigate to Attachments to Upload File
    Navigate To Attachments Page in Accesioning    ${testdata}
    Log    Test Step 6 : Click on Hamburger menu and Click on delete button
    Log    Test Step 7 : Click on "No" button on confirmation page and verify Attachment is not deleted
    Log    Test Step 8 : Click on Hamburger menu and Click on delete button
    Log    Test Step 9 : Click on "Yes" button on confirmation page and verify Attachment is Deleted
    Verify Delete Attachment Functionality    ${test_data_file_name}
    Log    Test Step 10 : Navigate to All Menu and Verify Delete Attachment
    Click On All Menu in Accesioning
    Log    Go to Details tab and click on Attachments Tab
    Click on First Element Details Button
    Log    Navigate to Attachments to Upload File
    Navigate To Attachments Page in Accesioning    ${testdata}
    Log    Click on Hamburger menu and Click on delete button in All Tab
    Log    Click on "No" button on confirmation page and verify Attachment is not deleted in All Tab
    Log    Click on Hamburger menu and Click on delete button in All Tab
    Log    Click on "Yes" button on confirmation page and verify Attachment is Deleted in All Tab
    Verify Delete Attachment Functionality    ${test_data_file_name}

AC-072 Edit Attachments from Accessioning Module->Attachments tab
    [Documentation]    This Test Case is about Verifying Edit Attachment of Requisition
    ${testdata}    Read TestData From Excel    AC072    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Go to Quick Menu
    Log    Test Step 4 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5 : Go to Details tab and click on Attachments Tab
    Click on First Element Details Button
    Log    Navigate to Attachments Page to Upload File
    Navigate To Attachments Page in Accesioning    ${testdata}
    ${Details_Menu_Hamburger}    ${test_data_file_name}    Upload File And Verify In Attachments    ${testdata}
    Log    Test Step 6 : Click on Edit icon left to the Attachments Tab
    Log    Test Step 7 : Edit file type
    Log    Test Step 8 : Click on Save button
    Log    Test Step 9 : Verify file type is updated
    Edit Attachment    ${testdata}    ${test_data_file_name}
    Log    Test Step 10 : Navigate to All Page and Verify Edit Attachment
    Click On All Menu in Accesioning
    Log    Go to Details tab and click on Attachments Tab
    Click on First Element Details Button
    Log    Navigate to Attachments to Upload File
    Navigate To Attachments Page in Accesioning    ${testdata}
    ${Details_Menu_Hamburger}    ${test_data_file_name}    Upload File And Verify In Attachments    ${testdata}
    Log    Click on Edit icon left to the Attachments Tab in All Page
    Log    Edit file type in All Page
    Log    Click on Save button in All Page
    Log    Verify file type is updated in All Page
    Edit Attachment    ${testdata}    ${test_data_file_name}
    [Teardown]    Take Screenshot And Close Browsers

AC_073 Verify Admin is able to View document from Accessioning Module->Attachments
    ${testdata}    Read TestData From Excel    AC073    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : 3.Go to Quick Menu
    Log    Test Step 4 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5 : Go to Details tab and click on Attachments
    Click on First Element Details Button
    Log    Navigate to Attachments Page to Upload File
    Navigate To Attachments Page in Accesioning    ${testdata}
    ${Details_Menu_Hamburger}    ${Test_Data_File_Name}    Upload File And Verify In Attachments    ${testdata}
    Log    Test Step 6 :Click on View Document Left to the Attachments
    Log    Test Step 7 : Verify document is open
    Verify Admin able to View Attachment and Remove    ${testdata}[File_Type]
    Log    Test Step 8 :Navigate to All Menu for Verifying View Document in Attachments
    Click On All Menu in Accesioning
    Log    Go to Details tab and click on Attachments in All Tab
    Click on First Element Details Button
    Log    Navigate to Attachments Page to Upload File in All Tab
    Navigate To Attachments Page in Accesioning    ${testdata}
    ${Details_Menu_Hamburger}    ${Test_Data_File_Name}    Upload File And Verify In Attachments    ${testdata}
    Log    Click on View Document Left to the Attachments in All Tab
    Log    Verify document is open in All Tab
    Verify Admin able to View Attachment and Remove    ${testdata}[File_Type]
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC_074 Negative: Validate file upload without selecting file and file type from Accessioning Module->Attachments
    ${testdata}    Read TestData From Excel    AC074    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Goto Quick Menu
    Log    Test Step 4 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5 :Go to Details tab and click on Attachments
    Click on First Element Details Button
    Log    Navigate to Attachments Page
    Navigate To Attachments Page in Accesioning    ${testdata}
    Log    Test Step 6: Click on Upload button
    Log    Test Step 7 : Click on Save button without selecting file and file type
    Log    Test Step 8 : Repeat same steps with selecting file and without selecting file type
    ${details_menu_hamburger}    Upload File And Verify In Attachments    ${testdata}
    Log    Test Step 9 : Navigate to All Page and Validate File Upload
    Click On All Menu in Accesioning
    Log    Go to Details tab
    Click on First Element Details Button
    Log    Navigate to Attachments Page
    Navigate To Attachments Page in Accesioning    ${testdata}
    Log    Click on Upload button
    Log    Click on Save button without selecting file and file type
    Log    Repeat same steps with selecting file and without selecting file type
    ${details_menu_hamburger}    Upload File And Verify In Attachments    ${testdata}

AC_078 Verify Print Requisition Form in Requisition-List (Left Menu)
    [Documentation]    This Test-Case is used to Verify Print Requisition Form in Requisition-List (Left-Menu)
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC078    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login as an Internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3: Goto Quick Menu
    Log    Test Step 4: Click on Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Print Requisition Form icon left to Requisition
    Get First Requisition Sample Id
    Click on Home-Page Requisitions Button    ${button.accesioning.req_list.print_req_form.by_replace_sample-id}    ${sample_id}
    Read and Remove File path
    Log    Test Step 6 : Navigate to All Page and Validate Print Requisition From Requisition List
    Click On All Menu in Accesioning
    Get First Requisition Sample Id
    Log    Click on Print Requisition form icon left to Requisition in All tab
    Click on Home-Page Requisitions Button    ${button.accesioning.req_list.print_req_form.by_replace_sample-id}    ${sample_id}
    Read and Remove File path
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC_079 Verify Print Labels in Requisition-List (Left Menu)
    [Documentation]    This Test-Case is used to Verify Print Labels in Requisition-List (Left-Menu)
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC079    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login as an Internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3: Goto Quick Menu
    Log    Test Step 4:Click on Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Select Requisitions of Facility Demo, LLC.Client Site
    Log    Get First Requisition Sampe Id in Pending Tab
    Get First Requisition Sample Id
    Log    Test Step 5: Click on Print Labels icon left to Requisition
    Click on Home-Page Requisitions Button    ${button.accesioning.req_list.print_label.by_replace_sample-id}    ${sample_id}
    Read and Remove File path
    Log    Verified that Labels opened in PDF Format
    Log    Test Step 6: Navigate to All Menu and Validate Print Labels In Requisition List
    Click On All Menu in Accesioning
    Log    Get First Requisition Sampe Id in All Tab
    Get First Requisition Sample Id
    Log    Click on Print Labels icon left to Requisition in All Tab
    Click on Home-Page Requisitions Button    ${button.accesioning.req_list.print_label.by_replace_sample-id}    ${sample_id}
    Read and Remove File path
    [Teardown]    Take Screenshot and Close Browsers

AC-081 Verify Complete from Requisition-List (Left Menu)
    [Documentation]    This Test-Case is used to Verify Complete from Requisition-List (Left-Menu)
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC081    Accesioning
    ${new_requisition_testdata}    Read TestData From Excel    AC081    NewRequisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login as an Internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3: Goto Quick Menu
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${new_requisition_testdata}
    Log    Test Step 4: Click on Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" page
    Search For Details In Home Page    ${sample_id}    Sample ID
    ${Rid}    Get R-id    ${sample_id}
    Log    Test Step 4: Search for Requisition in Accessioned State
    Log    Test Step 5: Click on "Complete" icon left to the Requisition(which is not in Complete or Rejected state)
    Log    Test step 6: Verify Labels PDF is Opened and Requisition Completed Message is displayed
    Click on Home-Page Requisitions Button    ${button.accesioning.requisition_left_menu_complete}    ${Rid}
    Log    Verified Requisition Form in PDF Format
    Log    Message -"Requisition Completed" is Displayed
    Perform Actions    No    ${MEDIUM_WAIT}
    Log    Clicked on "No"
    [Teardown]    Take Screenshot and Close Browsers

AC_085 Verify Single Requisition Record in Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select one Requisition and Verify Requisition Record in Batch-Review from Tool-Bar-Grid
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one Requisition and Click on Review Batch from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    1
    Log    Selected Requisition
    Navigate to Tool Bar Grid Buttons    Batch Review
    Log    "Batch Review" page is displayed.
    Switch New Window And Verify
    Log    Switched window to Billing Batch Review Page
    Verify Selected Requisition Details In Batch-Review    ${home_page_requisition_id}    ${requisition_id_count}
    Log    Verified Selected Requisition Record Details
    Switch to Default Window and Verify
    [Teardown]    Take Screenshot and Close Browsers

AC_086 Verify Multiple Requisition Record in Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select Multiple Requisitions and Verify Requisitions Record in Batch-Review from Tool-Bar-Grid
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on Review Batch from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    2
    Log    Selected Requisition
    Navigate to Tool Bar Grid Buttons    Batch Review
    Log    "Batch Review" page is displayed.
    Switch New Window And Verify
    Verify Selected Requisition Details In Batch-Review    ${home_page_requisition_id}    ${requisition_id_count}
    Log    Verified Selected Requisition Record Details
    Switch to Default Window and Verify
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_087 Verify Single Requisition Records Billing Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select one Requisition and Verify Requisition Record in Billing-Batch-Review from Tool-Bar-Grid
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition and Click on Billing Batch Review from Tool Bar Grid.
    Select Multiple Requisitions in Accessioning in Pending    1
    Log    Requisition Checkbox is Selected
    Navigate to Billing Batch Review Page
    Log    "Billing Batch Review" page is displayed.
    Switch New Window And Verify
    Log    Test Step 5: Click on Billing Review right side in the top.
    Verify Selected Requisition Details In Billing-Batch Review    ${home_page_requisition_id}    ${requisition_id_count}
    Log    Verified Billing Batch Review by Selecting SIngle Requisitions
    Switch to Default Window and Verify
    Log    Goto Accessioning Refresh the page and Verified that Selected Requisition Record is in Green Colour Tick Mark.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Screenshot.Take Screenshot

AC_088 Verify Multiple Requisition Records Billing Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select Multiple Requisition and Verify Requisition Record in Billing-Batch-Review from Tool-Bar-Grid
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on Billing Batch Review from Tool Bar Grid.
    Select Multiple Requisitions in Accessioning in Pending    2
    Log    Multiple Requisition Checkbox is Selected
    Navigate to Billing Batch Review Page
    Log    "Billing Batch Review" page is displayed.
    Switch New Window And Verify
    Log    Test Step 5: Click on Billing Review right side in the top.
    Verify Selected Requisition Details In Billing-Batch Review    ${home_page_requisition_id}    ${requisition_id_count}
    Log    Verified Billing Batch Review by selecting Multiple Requisitions
    Switch to Default Window and Verify
    Log    Goto Accessioning Refresh the page and Verified that Selected Requisition Record is in Green Colour Tick Mark.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

TC_096 Verifying Batch Labels from All data
    ${testdata}    Read TestData From Excel    AC096    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate to All Category Menu
    Log    Test Step 4:Select multiple requisitions and Click on Batch Labels from tool bar grid
    Navigate to Tool Bar Grid Buttons    ${testdata}[Tool_bar_grid_button]

AC_097 Verifying Reject Comments from All data
    ${testdata}    Read TestData From Excel    AC097    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Accessioning page***
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Navigate To All Category Screen
    Navigate to All Category Menu
    Log    Get First Requisition RID For Selecting Hamburger Option
    Select Filter Type in Accesioning    Status    ACCESSIONED
    ${RID}    Get First Requisition RID
    Log    Test Step 4:Select multiple requisitions and Click on Reject Comments from hamburger menu.
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    ${testdata}[Hamburger_submenu_option]
    Log    Navigate to Reject Comments Page
    Log    Test Step 5:Select Predefined Comment<<Enter the Comments and Click on Save.
    Select Predefined Comments in Reject Comments Page    ${testdata}
    Log    Selected Predefined Cmments
    Enter Requirement Comments    ${testdata}[Predefined_comment]
    Log    Save sample comments
    Save Activity    ${button.results.save_sample_comment}    ${testdata}[Message]    ${MEDIUM_WAIT}
    [Teardown]    Take Screenshot And Close Browsers

AC_098 Verify Rejected Requisition in Req_Hamburger -"Back to Pending" from "All" Tab.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC098    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Authenticated and Navigated to Home Page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Test Step 3: Click on "Accessioning" and click on "All".
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed
    Log    Test Step 4: Select Rejected Requisition and Click on Back to Pending from Hamburger Menu.
    Select Requisition and Perform Back to Pending    ${testdata}
    Log    Test Step 5: Enter the Comments and Click on Send Back For Testing Button.
    Enter Comments in Requisition Hamburger For "Back to Pending"    ${testdata}
    Log    Comments are Entered and Clicked on "Send back for Testing"
    Navigate to Module And Tab    Accessioning    Pending
    Search For Details In Home Page    ${RID}    ${testdata}[pending_searchcategory_checkbox]
    [Teardown]    Take Screenshot And Close Browsers

AC_039 Tracking Number Length Limitation with Invalid Data
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_039    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: \ Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Goto Quick Menu and Move to Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3: Select the Requisition and Click on the COMPLETE Icon (Right Mark)
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    Requisition Checkbox is Selected
    Log    Click on the COMPLETE Icon (Right Mark)
    Navigate to Tool_Bar Grid Buttons    Complete
    Log    User is Navigated to Requisition "Complete" Page.
    Log    Test Step 4: Enter Tracking Number and Click on "Start Processing" button
    Validate Error Messages in Complete Processing Page    ${testdata}

AC_195 Verify Print Preview from Requisition Hamburger in "All" Tab
    [Setup]
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_195    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on All.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${RID}    Get First Requisition RID
    Log    Requisition is Selected
    Log    Test Step 5 :Click on Print Preview
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Print Preview
    Log    Options are displayed. & Navigated to Requisition Hamburger "Print Preview" Page
    Log    Verifying the File is Downloaded When Clicked On Print Preview
    Verify Expected File is Downloaded into Local
    [Teardown]    Run Keywords    Remove Files in Directory    common.Take Screenshot And Close Browsers

AC_198 Verifying if Requisition form
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_198    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on All.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select multiple requisition and Click on Requisition form from tool bar grid.
    Select Multiple Requisitions in All    ${testdata}[requisition_checkbox_count]
    Log    Selected Requisitions
    Navigate to Tool Bar Grid Buttons For PDF    Requisition Form
    Log    "Requisition Form" is Clicked
    ${pdf_data}    Read Pdf Data
    Log    Pdf_data is Displayed
    Verify Pdf Data    ${pdf_data}    ${home_page_requisition_id}[0]
    Log    Requisition forms are displayed in new tab.
    [Teardown]    Run Keywords    Remove Files in Directory    common.Take Screenshot And Close Browsers

AC_102 Verifying Soft Delete requisition from All
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_102    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Select Filter Type in Accesioning    Status    ${test_data}[Filter_Status_Dropdown_Option]
    ${R_id}    Get First Requisition RID
    Log    Test Step 5:Select requisition and Click on Soft Delete from hamburger menu
    Navigate to Requisition Hamburger Sub Menu Options    ${R_id}    Soft Delete
    Log    Verify Expected Message
    Verify Text Message    Requisition Soft Deleted Successfully    ${MEDIUM_WAIT}

AC_110 Negative: Add Medical Necessity to Requisition without adding Mandatory fields from Accessioning module ->Medical Necessity
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    ${new_requisition_testdata}    Read TestData From Excel    AC118    NewRequisition
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${new_requisition_testdata}
    Log    Created New Requisition For New Sample ID
    Navigate To Main Menu    Accessioning
    Log    Search For Created Requisition Details in Home Page
    Search For Details In Home Page    ${sample_id}    ${new_requisition_testdata}[pending_searchcategory_checkbox]
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Medical Necessity
    Log    Click on Save and Verify Error Message
    Save Activity    ${button.accesioning.details.medical_neccesity.save}    Risk Assessments (select one) is a mandatory field    ${MEDIUM_WAIT}
    Log    Navigate to All Menu
    Click On All Menu in Accesioning
    Log    Search For Created Requisition Details in All Page
    Search For Details In Home Page    ${sample_id}    ${new_requisition_testdata}[pending_searchcategory_checkbox]
    Log    Click on Medical Necessity button in All Page
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Medical Necessity
    Log    Click on Save and Verify Error Message in All Page
    Save Activity    ${button.accesioning.details.medical_neccesity.save}    Risk Assessments (select one) is a mandatory field    ${MEDIUM_WAIT}
    [Teardown]    Take Screenshot And Close Browsers

AC_111 Search for the Documentation on Medical Necessity page Accessioning module ->Medical Necessity Tab
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_111    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    ${R-id}    Get First Requisition RID
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Medical Necessity
    Log    Validate Documentation in Medical Necessity
    Validate Documentation in Medical Neccesity    ${test_data}
    Log    Navigate to All Page
    Navigate to Tab    All
    ${R-id}    Get First Requisition RID
    Log    Click on Medical Necessity button in All Page
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Medical Necessity
    Log    Validate Documentation in Medical Necessity in All Page
    Validate Documentation in Medical Neccesity    ${test_data}

AC_112 Validate Add All Documentation on Medical Necessity to Requisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_111    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    ${R-id}    Get First Requisition RID
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Medical Necessity
    Log    Validate Documentation in Medical Necessity
    Validate Add All Documentation on Medical necessity
    Log    Navigate to All Page
    Navigate to Tab    All
    ${R-id}    Get First Requisition RID
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Medical Necessity
    Log    Validate Documentation in Medical Necessity
    Validate Add All Documentation on Medical necessity

AC_113 Remove All Documentation on Medical Necessity to Requisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_111    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    ${R-id}    Get First Requisition RID
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Medical Necessity
    Log    Validate Documentation in Medical Necessity
    Validate Add All Documentation on Medical necessity
    Log    Navigate to Missing Data Page
    Navigate to Tab    Missing data
    ${R-id}    Get First Requisition RID
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Medical Necessity
    Log    Validate Documentation in Medical Necessity
    Validate Add All Documentation on Medical necessity
    Log    Navigate to On Hold Page
    Navigate to Tab    On-Hold
    Log    Get First Requisition R-id
    ${R-id}    Get First Requisition RID
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Medical Necessity
    Log    Validate Documentation in Medical Necessity
    Validate Add All Documentation on Medical necessity
    [Teardown]    Take Screenshot And Close Browsers

AC_109 Add Medical Necessity Documentation to Requisition from Accessioning module
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_111    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Search For Details In Home Page    ${sample_id}    Sample ID
    Comment    ${R-id}    Get First Requisition Rid in Pending in Accesioning
    Log    Click on Medical Necessity button
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Medical Necessity
    Log    Drag and Drop First Documentation name from Available List
    Drag And Drop First Documentation To Selected List
    Log    Drag and Drop Second Documentation name from Available List
    Drag And Drop Second Documentation To Selected List

AC_115 Change Bill type of Requisition from Accessioning module
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_115    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    ${R_id}    Get First Requisition RID
    Change Bill Type    ${test_data}    ${R_id}    save_button=update
    Log    Navigate To General Tab and Check Updated Bill Type
    Navigate to General and Verify Bill Type is Updated    ${bill_type_option}

AC_117 Negative: Select empty bill type from Accessioning module
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_117    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    ${R_id}    Get First Requisition RID
    Log    Check Error Message When No Bill Type is Selected
    Verify Error Message When no Bill Type is Selected    ${R_id}

AC_119 Verify Error Message Without filling required fields from Accessioning module ->Insurance Tab
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC_119    Accesioning
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    ${R_id}    Get First Requisition RID
    Log    Verify admin able to change bill type
    Change Bill Type    ${test_data}    ${R_id}    Negative

AC-118 Negative: Change bill type at Requisition level and Verify Bill type updated at Patient Level
    [Setup]
    ${new_requisition_testdata}    Read TestData From Excel    AC118    NewRequisition
    ${testdata}    Read TestData From Excel    AC_118    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Refuse Alert for Notifications of News
    Log    Create New Requisition For Sample Id for Patient Name
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${new_requisition_testdata}    Infectious Disease
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Verify admin able to change bill type
    Change Bill Type    ${testdata}    ${sample_id}
    Log    Navigate To General Tab and Check Updated Bill Type
    Navigate to General and Verify Bill Type is Updated    ${bill_type_option}
    Log    Go to Client Portal page
    Navigate To Main Menu    Client Portal
    Log    Go to New Requisition Page to Validate Patient Bill Type
    Log    Go To New Order Page
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Log    Navigate Io Infectious Disease Menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Navigate to New Requisition page to Validate Patient Bill Type
    Create New Requisition To Validate Patient Bill Type    ${new_requisition_testdata}    ${bill_type_option}    negative
    [Teardown]    Take Screenshot And Close Browsers

AC_116 Change Bill type of Requisition and Patient from Accessioning module ->Insurance Tab
    ${new_requisition_testdata}    Read TestData From Excel    AC118    NewRequisition
    ${testdata}    Read TestData From Excel    AC_118    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Create New Requisition For Sample Id for Patient Name
    Refuse Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${new_requisition_testdata}
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Verify admin able to change bill type
    Change Bill Type    ${testdata}    ${sample_id}    save_button=update
    Log    Navigate To General Tab and Check Updated Bill Type
    Navigate to General and Verify Bill Type is Updated    ${bill_type_option}
    Log    Go to Client Portal page
    Navigate To Main Menu    Client Portal
    Log    Go to New Requisition Page to Validate Patient Bill Type
    Log    Go To New Order Page
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Log    Navigate Io Infectious Disease Menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Navigate to New Requisition page to Validate Patient Bill Type
    Create New Requisition To Validate Patient Bill Type    ${new_requisition_testdata}    ${bill_type_option}    positive
    [Teardown]    Take Screenshot And Close Browsers

AC_174 Reject Sample from Left menu from Accessioning Module->Samples Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_172    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Verify Reject Sample Functionality    ${testdata}
    Log    Go to On Hold Menu
    Navigate to Tab    On-Hold
    Verify Reject Sample Functionality    ${testdata}
    Log    Go To Missing Data Page
    Navigate to Tab    Missing data
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Verify Reject Sample Functionality    ${testdata}
    Log    Go to All Data Menu
    Navigate to Tab    All
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Verify Reject Sample Functionality    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

AC_172 Edit Samples from Accessioning Module->Samples Tab
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC_172    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Verify Edit Samples in Samples tab    ${Testdata}
    Navigate to Tab    On-Hold
    Verify Edit Samples in Samples tab    ${Testdata}
    Navigate to Tab    Missing data
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Verify Edit Samples in Samples tab    ${Testdata}
    Navigate to Tab    All
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Verify Edit Samples in Samples tab    ${Testdata}
    [Teardown]    Take Screenshot And Close Browsers

AC_193 Verifying View Ordering Physician Signature
    ${testdata}    Read TestData From Excel    AC028    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 3 : Navigate to Quick Manual to select "Accessioning"
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Screenshot.Take Screenshot
    Refuse Alert for Notifications of News
    Log    Click on down arrow
    Navigate to All Category Menu
    Log    Test Step 4: Select any one Requisition ID and click on Requisition Hamburger Menu
    ${RID}    Get First Requisition RID
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    ${testdata}[Hamburger_submenu_option]
    Log    5.Click on View Ordering Physician Signature
    Verify Order Physician Signature Label
    Log    Verified Physician Signature Label
    Logout From Healthtrack Application
    Log    Loggedout from HealthtrackRX application

AC_205 Verifying New Requisition Creation with Infectious Disease From Tool bar grid
    ${testdata}    Read TestData From Excel    AC205    NewRequisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 3 : Navigate to Quick Manual to select "Accessioning"
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Screenshot.Take Screenshot
    Refuse Alert for Notifications of News
    Log    Go to All Category Menu
    Navigate to Tab    All
    Log    Click on Infectious Disease buttons and Navigate to New Requisition Page
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Log    Create New Infectious Disease Requisition
    Create New Infectious Disease Requisition From Accesioning    ${testdata}    No
    [Teardown]    Run Keywords    Take Screenshot And Close Browsers    Remove Files in Directory

AC_083 Negative: Complete Requisition which is having errors from Accessioning
    ${testdata}    Read TestData From Excel    AC122    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 3 : Navigate to Quick Manual to select "Accessioning"
    Navigate To Main Menu    Accessioning
    Log    Navigated to Accessioning page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Verify User is Able to Add New Critical Error
    Add Critical Error For Negative Validation    ${testdata}
    Log    Go to Missing Data Menu
    Navigate to Tab    Missing data
    Log    Verify User is Able to Add New Critical Error
    Add Critical Error For Negative Validation    ${testdata}
    Log    Go to On Hold Menu
    Navigate to Tab    On-Hold
    Log    Verify User is Able to Add New Critical Error
    Add Critical Error For Negative Validation    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

AC_187 Change Bill type of Requisition on General Tab of Requisition from Accessioning module
    [Setup]    Take Screenshot And Close Browsers
    ${new_requisition_testdata}    Read TestData From Excel    AC205    NewRequisition
    ${testdata}    Read TestData From Excel    AC187    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Launch browser to healthtrackRX application url
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    Test Step 1: ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Login to application with valid credentials
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${new_requisition_testdata}
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed
    Log    Verify Change Bill Type in General Tab
    Validate Change Bill Type in General    ${testdata}
    Log    Search For Sample Id
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Verify User Able to Move Sample Id to On Hold Tab
    Verify User Able To Move Sample Id To On Hold
    Log    Verify Change Bill Type in General Tab
    Validate Change Bill Type in General    ${testdata}
    Log    Remove Sample Id From On Hold Page
    Remove Sample Id from on Hold

AC_176 Select Tests for Sample from Accessioning module->Samples Tab
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    ${testdata}    Read TestData From Excel    AC187    Accesioning
    Log    Launch browser to healthtrackRX application url
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    Test Step 1: ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Login to application with valid credentials
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Refuse Alert for Notifications of News
    ${details_button}    Search For Created Sample Details In Accesioning Module    ${testdata}    1    ${sample_id}
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Samples
    Log    Verify Drag And Drop in Available List
    Navigate to Select Tests and Validate Drag and Drop in Available List    ${sample_id}    Acinetobacter baumanii

AC_188 Change Bill type of Requisition and Patient on General Tab of Requisition from Accessioning module
    ${new_requisition_testdata}    Read TestData From Excel    AC188    NewRequisition
    ${testdata}    Read TestData From Excel    AC188    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    This Test Case Requires Sample Id and Patient Name Which We Are getting from AC_187 Test Case
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Refuse Alert for Notifications of News
    Log    "Accessioning Pending" data page is displayed.
    Validate Change Bill Type in General    ${testdata}    save and update
    Log    Go to Client Portal page
    Navigate To Main Menu    Client Portal
    Log    Go to New Requisition Page to Validate Patient Bill Type
    Log    Go To New Order Page
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Log    Navigate Io Infectious Disease Menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Navigate to New Requisition page to Validate Patient Bill Type
    Create New Requisition To Validate Patient Bill Type    ${new_requisition_testdata}    ${bill_type_option}    positive
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Move Sample Id to On Hold Page
    Verify User Able To Move Sample Id To On Hold
    Log    Verify admin able to change bill type
    Validate Change Bill Type in General    ${testdata}    save and update
    Log    Remove Sample Id From The On Hold Page
    Remove Sample Id from on Hold
    Log    Go to Client Portal page
    Navigate To Main Menu    Client Portal
    Log    Go to New Requisition Page to Validate Patient Bill Type
    Log    Go To New Order Page
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Log    Navigate Io Infectious Disease Menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Navigate to New Requisition page to Validate Patient Bill Type
    Create New Requisition To Validate Patient Bill Type    ${new_requisition_testdata}    ${bill_type_option}    positive

AC_190 Change Dr Signed on Paper on General Tab of Requisition from Accessioning module
    ${new_requisition_testdata}    Read TestData From Excel    AC188    NewRequisition
    ${testdata}    Read TestData From Excel    AC188    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Refuse Alert for Notifications of News
    Log    Validate Doctor Signed Functionality
    Navigate to General Tab and Verify Doctor Signed Functionality    ${testdata}
    Log    Move Sample Id to On Hold
    Verify User Able To Move Sample Id To On Hold
    Log    Validate Doctor Signed Functionality
    Navigate to General Tab and Verify Doctor Signed Functionality    ${testdata}
    Remove Sample Id from on Hold
    [Teardown]    Take Screenshot And Close Browsers

AC_182 Change Patient Details of Requisition both at Patient Level and Requisition Level from Accessioning module->General Tab
    ${new_requisition_testdata}    Read TestData From Excel    AC182    NewRequisition
    ${testdata}    Read TestData From Excel    AC182    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed
    Refuse Alert for Notifications of News
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Navigate to General Page for Selected Sample ID
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    General
    Log    Modify The Patient Details In General Tab
    Update Patient Details in General Tab    ${testdata}
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Create New Requisition for Sample ID to Vaildate Update Patient Details
    Create New Requisition For Sample Id    ${new_requisition_testdata}    patient_validation
    Navigate To Main Menu    Accessioning
    Refuse Alert for Notifications of News
    Log    Vaildate Updated Patient Details in General Tab with New Requisition
    Validate Updated Patient Details in Accesioning General Page    ${sample_id}    ${testdata}    ${patient_name}
    [Teardown]    Take Screenshot And Close Browsers

AC_184 Negative: Validate Invalid Email format on General Tab of Requisition from Accessioning module
    ${testdata}    Read TestData From Excel    AC188    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Refuse Alert for Notifications of News
    Log    Verify Invalid Email Format in General Tab
    Validate Invalid Email Format In General Tab    ${testdata}
    Log    Move Sample Id to On Hold Page
    Verify User Able To Move Sample Id To On Hold
    Handle Optional Alert
    Log    Verify Invalid Email Format in General Tab
    Validate Invalid Email Format In General Tab    ${testdata}
    Log    Remove sample id from On Hold section
    Remove Sample Id From On Hold and Handle Alert
    [Teardown]    Take Screenshot And Close Browsers

AC_181 Change Patient Details of Requisition from Accessioning module->General Tab
    ${testdata}    Read TestData From Excel    AC182    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Refuse Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed
    Refuse Alert for Notifications of News
    Log    Update Patient Details in General and Verify in General
    Modify Patient Details and Verify    ${testdata}
    Log    Go to All Category Menu
    Navigate to All Category Menu
    Log    Update Patient Details in General and Verify in General
    Modify Patient Details and Verify    ${testdata}

AC_170 Edit Location for Samples from Accessioning Module ->Samples Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC170    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and Click on Sample tab
    Log    Test Step 6: Click on Hamburger menu of Sample
    Log    Test Step 7: Click on Edit Location
    Log    Test Step 8: Edit the Location and Click on Save button
    Log    Test Step 9: Verify Location is added
    Edit Locations in Samples    ${testdata}
    Log    Verified with Editing Location of Samples

AC_171 Add Comments for Samples from Accessioning Module ->Samples Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC171    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and Click on Sample tab
    Log    Test Step 6: Click on Hamburger menu of Sample
    Log    Test Step 7: Click on Comments
    Log    Test Step 8: Enter Comments and Click on Save button
    Log    Test Step 9: Verify Comments are added
    Add Comments and Verify in Samples    ${testdata}
    Log    Verified with added Comments to Samples

AC_009 Create Infectious Disease Requisition form Accessioning module with Doctor Signature on Paper
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC009    NewRequisition
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4: Goto Quick Menu and Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Infectious Disease Requisition
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Log    Test Step 6: Select values for client site and ordering physician
    Log    Test Step 7: Click on Create new patient
    Log    Test Step 8: Select "Client Bill" for bill type and fill all the required fields.
    Log    Test Step 9: Select "Date received"
    Log    Test Step 10: Select "Yes" for "Dr Signed on paper"
    Log    Test Step 11: Fill all other required fields
    Log    Test Step 12: Click on Save Button
    Log    Test Step 13: Click on confirm Requisition
    Create New Infectious Disease Requisition From Accesioning    ${testdata}    Yes
    ${file_path}    Read Data From Pdf
    Log    Infectious Disease requisition is created from Accessioning module
    Log    Test Step 14: Navigate to Accessioning module
    Log    Test Step 15: Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition is displayed in the accessioning module
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC_010 Create Infectious Disease Requisition form Accessioning module without Doctor Signature on Paper
    [Setup]
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC010    NewRequisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4: Goto Quick Menu and Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Infectious Disease Requisition
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Log    Test Step 6: Select values for client site and ordering physician
    Log    Test Step 7: Click on Create new patient
    Log    Test Step 8: Select "Client Bill" for bill type and fill all the required fields.
    Log    Test Step 9: Select "Date received"
    Log    Test Step 10: Select "No" for "Dr Signed on paper"
    Log    Test Step 11: Fill all other required fields
    Log    Test Step 12: Click on Save Button
    Log    Test Step 13: Click on confirm Requisition
    Create New Infectious Disease Requisition From Accesioning    ${testdata}    No
    ${file_path}    Read Data From Pdf
    Log    Infectious Disease requisition is created from Accessioning module
    Log    Test Step 14: Navigate to Accessioning module
    Log    Test Step 15: Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition is displayed in the accessioning module
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

AC_177 Validate Question Forms Tab from Accessioning module
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC177    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Move to Accessioning.Click on Accessioning
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Covid Requisition and click on Question Forms Tab
    Search For Details In Home Page    ${testdata}[id_value]    ${testdata}[pending_searchcategory_checkbox]
    Log    "${testdata}[pending_searchcategory_checkbox]" Requisition of Value -"${testdata}[id_value]" is Visible
    Navigate to Details with Sub-Menu Button Page    ${testdata}[id_value]    Question Forms
    Log    Navigated to Question Forms Tab of Requisition -"${testdata}[id_value]"
    Log    Test Step 6: Edit Question Forms and Click on Save
    Edit Question Form    ${testdata}
    Log    Edited "${testdata}[question_form]" Answer as "${testdata}[question_form_editanswer]"
    Log    Test Step 7: Verify Changes are saved
    Verify Edited Answer in Question Form    ${testdata}
    Log    Changes are saved

AC_101 Verifying Un-Reject Selected Requisition from Tool Bar Grid.
    [Setup]    Take Screenshot And Close Browsers
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC101    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on All.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Test step 4: Select Multiple Requisitions and Click on "Un-Reject" from Tool Bar Grid.
    Log    Test Step 5 & 6:Click on Start Processing. & Click on Close Modal and refresh Grid.
    Verify Un Reject In All Tab    ${testdata}

AC_122 Add Error to Requisition from Accessioning module ->Errors
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC122    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Test Step 5: Click on Details of Requisition and click on Errors Tab
    Log    Test Step 6: Click on Add Button and Fill all the required fields.
    Log    Test Step 7: Click on Save Button
    Log    Test Step 8: Verify Error is added
    Add Errors to Requisition in Different Tabs    ${testdata}
    Log    Verified with the Added Error
    [Teardown]    Run Keywords    Take Screenshot And Close Browsers
    ...    AND    Get Added Error in Exceptions    ${testdata}

AC_157 Edit Error from Accessioning Module->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC157    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Test Step 5:Click on Details of Requisition and click on Errors Tab
    Log    Test Step 6: Click on Edit icon left to the Errors
    Log    Test Step 7&8: Change Error and Click on Save button
    Log    Test Step 9: Verify the Updated Error
    Edit the Existing Error in Details Errors Page in Different Tabs    ${testdata}
    Log    Verified the Updated Error Name
    [Teardown]    Take Screenshot And Close Browsers

AC_158 Delete Error from Requisition from Accessioning module ->Errors
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC158    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on Details of Requisition and Click on Error Tab
    Log    Test Step 6:Click on Hamburger menu and Click on Delete button
    Log    Test Step 7: Click on "No" button on Confirmation page and verify Error is not Deleted
    Log    Test Step 8: Click on Hamburger menu and Click on Delete button
    Log    Test Step 9: Click on "Yes" button on Confirmation page and verify Error is Deleted
    Delete Error in Errors Tab    ${testdata}
    Log    User is able to delete Errors
    [Teardown]    Take Screenshot And Close Browsers

AC_203 Select Requisition Record to perform Batch Review from Tool bar grid in All Tab.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC203    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on All Tab.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on Review Batch from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]"- Requisition Checkbox is Selected
    Navigate to Tool Bar Grid Buttons    Batch Review
    Log    "Batch Review" page is displayed.
    Log    "Batch Review" page is displayed and Selected Requisition Record Details.
    Switch New Window And Verify
    Log    Switched window to Billing Batch Review Page
    Log    Test Step 5: Click on reviewed forward button
    Verify Selected Requisition Details In Batch-Review    ${home_page_requisition_id}    ${requisition_id_count}
    Log    Selected Requisition home_page_req_id Record Details are displayed.
    Switch to Default Window and Verify

AC_204 Select Requisition Record to perform Billing Batch Review from Tool bar grid in All Tab.
    [Setup]    Take Screenshot And Close Browsers
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC204    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on All Tab.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Click Arrow Down Button    ${button.accesioning.details.arrow}    ${testdata}[home_page_arrow]
    Log    Clicked on Arrow Button
    Log    Test Step 4: Select Multiple Requisition and Click on Billing Batch Review from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]"-Requisition Checkbox is Selected
    Navigate to Billing Batch Review Page
    Log    "Billing Batch Review" page is displayed.
    Switch New Window And Verify
    Log    Test Step 5 & 6: Click on Billing Review right side in the top.Click on reviewed forward button.
    Verify Selected Requisition Details In Billing-Batch Review    ${home_page_requisition_id}    ${requisition_id_count}
    Switch to Default Window and Verify
    Log    Goto Accessioning Refresh the page and Verified that Selected Requisition home_page_req_id Record is displayed and in Green Colour Tick Mark.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application

AC_206 Verify Regenerate Requisition Form from Tool bar grid in All Tab.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC206    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on All Tab.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisitions and Click on Regenerate Requisition Form from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    Requisitions "${testdata}[requisition_checkbox_count]"- Checkbox is Selected
    Navigate to Tool Bar Grid Buttons    Regenerate Form
    Log    Navigated to ''Regenerate Form"
    Verify Message    ${message.successfully}    ${MEDIUM_WAIT}
    Log    Verified "Successfully" Pop-up Message.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application

AC_208 Verify Regenerate Requisition Form from Hamburger menu in All Tab.
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Logedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${RID}    Get First Requisition RID
    Log    Requisition-"${RID}" is Selected
    Log    Test Step 5: Click on "Regenerate Requisition Form".
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Regenerate Req Form
    Log    Options are displayed. & Navigated to Requisition Hamburger "Regenerate Requisition Form" Page
    Verify Message    ${message.successfully}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Log    Verified the Pop-up Message - "Successfully"
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application

AC_161 Resolve the Error from Accessioning Module ->Errors Tab
    [Setup]    Take Screenshot And Close Browsers
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC161    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Errors Tab
    Log    Test Step 6: Click on Resolved Button
    Log    Test Step 7: Verify Error is Resolved
    Resolve Error in Errors Tab    ${testdata}
    Log    Verified with the Resolved Error

AC_160 Add Comments to the Error from Accessioning Module ->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC160    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Errors Tab
    Log    Test Step 6: Click on Comments Button
    Log    Test Step 7: Add your Comments and click on Save
    Log    Test Step 8: Verify Comments is added to Error
    Add Comments to Errors in Errors    ${testdata}
    Log    Added Comments to the Error

AC_008 Tracking Number auditing
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    ${test_data}=    Read TestData From Excel    AC008    Accesioning
    ${requsition_testdata}    Read TestData From Excel    AC009    NewRequisition
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Infectious Disease Requisition
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Create New Infectious Disease Requisition From Accesioning    ${requsition_testdata}    Yes
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Go to All Category Page
    Navigate to All Category Menu
    Search For Details In Home Page    ${test_tracking_number}    ${test_data}[pending_searchcategory_checkbox]
    Validate Sample History in Audit Screen When Searched With Tracking Number

AC_018 Verify Audit View from Requisition Hamburger Menu
    [Documentation]    This Test-Case is used to Verify Audit View from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC018    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin with ${USERNAME} as username and ${PASSWORD} as password
    Log    User is Authenticated and Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger Menu.
    ${RID}    Get First Requisition RID
    Log    Requisition is Selected
    Log    Test Step 5: Click on Audit.
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Audit
    Log    Options are displayed. & Navigated to Requisition Hamburger ''Audit" Page
    Log    Verified Requisition Data History in Audit Page
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot And Close Browsers

AC_163 Validate Audit for Error from Accessioning Module ->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC163    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Errors tab
    Log    Test Step 6: Make changes to the error
    Log    Test Step 7: Click on Audit from Hamburger menu of Error
    Log    Test Step 8: Verify the changes history is displayed in Audit page
    @{Page_Name}    Create List    Pending    On-Hold    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        Get First Requisition RID
        Log    Search For The Details In Home Page    ${RID}    ${testdata}[pending_searchcategory_checkbox]
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
        ${button.acesioning.details.sub-menu_buttons.new}    Update Dynamic Value    xpath://div[contains(@id,"details_tabs")]//ancestor::ul//li/a[text()='replaceText']    Errors
        Click On The Element    ${button.acesioning.details.sub-menu_buttons.new}    Errors    ${LONG_WAIT}
        ${Error_Hamburger}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger}    ${RID}    <p>${testdata}[comment]</p>
        Wait Until Time    ${SHORT_WAIT}
        Click On The Element    ${Error_Hamburger}    Errors_Hamburger    ${LONG_WAIT}    selenium
        ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger_options}    ${RID}    <p>${testdata}[comment]</p>
        ${button.accesioning.req-details.errors.hamburger.sub-menu.new_locator}    Update Dynamic Value    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Audit
        Click On The Element    ${button.accesioning.req-details.errors.hamburger.sub-menu.new_locator}    Audit    ${LONG_WAIT}
        Screenshot.Take Screenshot
        Wait Until Element Is Visible    ${label.accessioning.details.errors.audit_page.last_changed_date}    ${LONG_WAIT}
        Comment    ${present_date}    DateTime.Get Current Date
        Comment    ${date_verification}    Get Text    ${label.accessioning.details.errors.audit_page.last_changed_date}
        Comment    @{splitted_date}    Split String    ${date_verification}
        Comment    Should Contain    ${present_date}    ${splitted_date}[0]
        Comment    Screenshot.Take Screenshot
        Click On The Element    ${button.cross(x)}    close_page    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"=="Pending"    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    On Hold
        Run Keyword If    "${Page_Name}[${key}]"=="On-Hold"    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Remove Hold
    END
    Log    History of changes with timestamp is displayed in Audit page
    Navigate to Tab    Missing data
    Log    Navigated to Accessioning "Missing data" Page
    ${RID}    Get First Requisition RID
    Log    "${RID}" is Received
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Errors
    Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
    Log    Navigated to "Errors" Page
    Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
    Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
    Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
    ${button.acesioning.details.sub-menu_buttons.new}    Update Dynamic Value    xpath://div[contains(@id,"details_tabs")]//ancestor::ul//li/a[text()='replaceText']    Errors
    Click On The Element    ${button.acesioning.details.sub-menu_buttons.new}    Errors    ${LONG_WAIT}
    ${Error_Hamburger}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger}    ${sample_id}    <p>${testdata}[comment]</p>
    Wait Until Time    ${SHORT_WAIT}
    Click On The Element    ${Error_Hamburger}    Errors_Hamburger    ${LONG_WAIT}
    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger_options}    ${sample_id}    <p>${testdata}[comment]</p>
    ${button.accesioning.req-details.errors.hamburger.sub-menu.new_locator}    Update Dynamic Value    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Audit
    Click On The Element    ${button.accesioning.req-details.errors.hamburger.sub-menu.new_locator}    Audit    ${LONG_WAIT}
    Screenshot.Take Screenshot
    Comment    Wait Until Element Is Visible    ${label.accessioning.details.errors.audit_page.last_changed_date}    ${LONG_WAIT}
    ${Last_Changed_By}    Get Text    ${label.accesioning.audit.last_changed_by_name}
    Should Be Equal    prakash.kamma    ${Last_Changed_By}
    [Teardown]    Take Screenshot

AC_164 Validate Audit for Panels from Accessioning Module ->Panels Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC164    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and Click on Panels tab
    Log    Test Step 6: Make changes to the Panels 9.Click on number (hyperlink) below changes column 10.Verify the changes
    Log    Test Step 7: Click on Audit from Hamburger menu of Panels
    Log    Test Step 8: Verify the changes history is displayed in Audit page
    Log    Test Step 9: Click on number (hyperlink) below changes column
    Log    Test Step 10: Verify the changes
    @{Page_Name}    Create List    Pending    On-Hold    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        Get First Requisition RID
        Navigate to Details with Sub-Menu Button Page    ${RID}    Panels
        Wait Until Page Contains Element    ${label.accessioning.details.panels.pagetitle}    ${MEDIUM_WAIT}
        Log    Navigated to "Panels" Page
        Click On The Element    ${button.accesioning.pending.add_panel}    Add Panel    ${MEDIUM_WAIT}
        Wait Until Element Is Not Visible    ${spinner.locator}    ${LONG_WAIT}
        Add Panel Name in Random    5
        Wait Until Time    ${MEDIUM_WAIT}
        Wait Until Page Contains    ${updated_panel_name}    ${MEDIUM_WAIT}
        ${panel_hamburger}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger}    ${RID}    ${updated_panel_name}
        Wait Until Time    ${SHORT_WAIT}
        Click On The Element    ${panel_hamburger}    Errors_Hamburger    ${LONG_WAIT}    selenium
        ${added_panel_hamburger}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger_options}    ${RID}    ${updated_panel_name}
        ${click_hamburger}    Update Dynamic Value    ${added_panel_hamburger}    Audit
        Click On The Element    ${click_hamburger}    Audit    ${LONG_WAIT}
        Wait Until Element Is Visible    ${label.accessioning.details.errors.audit_page.last_changed_date}    ${LONG_WAIT}
        Comment    ${date}    Get Text    //div[contains(@class,"ag-cell-not-inline-editing") and @col-id="date"]
        Comment    ${history_changes_page}    Update Dynamic Value    xpath://div[contains(@class,"ag-cell-not-inline-editing") and text()="replaceText"]//following-sibling::div[@aria-selected="true"]    ${date}
        Comment    Click On The Element    ${history_changes_page}    Changes    ${LONG_WAIT}
        Comment    ${history_panel}    Update Dynamic Value    //div[contains(@class,"ag-cell-not-inline-editing") and contains(text(),"replaceText")]    ${updated_panel_name}
        Comment    Wait Until Element Is Visible    ${history_panel}    ${LONG_WAIT}
        Comment    ${added_panel_name}    Get Text    ${history_panel}
        Comment    Should Contain    ${added_panel_name}    ${updated_panel_name}
        Click On The Element    ${button.cross(x)}    close_page    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"=="Pending"    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    On Hold
        Run Keyword If    "${Page_Name}[${key}]"=="On-Hold"    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Remove Hold
    END
    Log    History of changes with timestamp is displayed on the Audit page
    Navigate to Tab    Missing data
    Log    Navigated to Accessioning "Missing data" Page
    Select Filter Type in Accesioning    Status    RECEIVED
    ${RID}    Get First Requisition RID
    Log    "${RID}" is Received
    Navigate to Details with Sub-Menu Button Page    ${RID}    Panels
    Wait Until Page Contains Element    ${label.accessioning.details.panels.pagetitle}    ${MEDIUM_WAIT}
    Log    Navigated to "Panels" Page
    Click On The Element    ${button.accesioning.pending.add_panel}    Add Panel    ${MEDIUM_WAIT}
    Wait Until Element Is Not Visible    ${spinner.locator}    ${LONG_WAIT}
    Add Panel Name in Random    6
    Wait Until Time    ${MEDIUM_WAIT}
    Wait Until Page Contains    ${updated_panel_name}    ${MEDIUM_WAIT}
    ${Error_Hamburger}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger}    ${RID}    <p>${testdata}[comment]</p>
    Wait Until Time    ${SHORT_WAIT}
    Click On The Element    ${Error_Hamburger}    Errors_Hamburger    ${LONG_WAIT}
    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger_options}    ${RID}    <p>${testdata}[comment]</p>
    ${button.accesioning.req-details.errors.hamburger.sub-menu.new_locator}    Update Dynamic Value    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Audit
    Click On The Element    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Audit    ${LONG_WAIT}
    ${Last_Changed_By}    Get Text    ${label.accesioning.audit.last_changed_by_name}
    Should Be Equal    prakash.kamma    ${Last_Changed_By}

AC_185 Validate Guardian Details on General Tab of Requisition from Accessioning module
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC185    Accesioning
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Move to Accessioning.Click on Accessioning
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on General Tab
    Search For Details In Home Page    273397    ${testdata}[pending_searchcategory_checkbox]
    Log    "${testdata}[pending_searchcategory_checkbox]" Requisition of Value -"${testdata}[id_value]" is Visible
    Navigate to Details with Sub-Menu Button Page    ${testdata}[id_value]    General
    Log    Navigated to General Tab of Requisition -"${testdata}[id_value]"
    Log    Test Step 6 & 7: Enter Guardian First Name and Last Name and Select Guardian DOB
    Guardian Details    ${testdata}
    Log    Guardian Details are Updated
    Guarantor Details    ${testdata}
    Log    Guarantor Details are Updated
    Log    Test Step 7: Click on Save button
    Save Requisition in General Tab
    Log    Requisition is Saved
    Log    Test Step 8: .Verify Guardian details are Saved
    Verify Updated Guardian Details    ${testdata}
    Log    Verified with updated guardian details

AC_001 Add Requisition to a Batch in Results Review
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC001    NewRequisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Navigate To Main Menu    Accessioning
    Log    Select Infectious Disease Requisition
    Navigate to Tool Bar Grid Buttons    Infectious Disease
    Create New Infectious Disease Requisition From Accesioning    ${testdata}    Yes
    Get Sample Id and Sent Back to Pending In Accesioning    ${testdata}
    Navigate to Module And Tab    Accessioning    Pending
    Navigate to Tool Bar Grid Buttons    Complete
    Perform Actions in Complete Page From Tool Bar Grid Buttons    ${testdata}    Requisition Complete All    "Close Modal and Refresh Grid"
    Log    Requisition id-"${sample_id}" from Accessioning is sent to Results Review
    Navigate To Main Menu    Results Review
    Log    Navigated to "Results_Review" page
    Log    Test Step 11:Attempt to add requisition to a batch in results review.
    Verify Created Batch    ${testdata}    ${sample_id}
    Log    Added Requistion-"${sample_id}" details displayed in batch.
    Log    Requisition-"${sample_id}" is created and visible in Results_Review
    Input All Fields in Create New Patient Page
