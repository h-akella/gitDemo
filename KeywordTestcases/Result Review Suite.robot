*** Settings ***
Resource          ../Global/super.robot

*** Test Cases ***
RR_034 Verify the display of Print Labels in new tab for multiple requisitions selected.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR034    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ER_1:User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and Sign in.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_2:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Click on "Result Review" and Click on "Pending Result Tab".
    Navigate To Main Menu    Results Review
    Log    ER_3:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select Multiple Requisitions and Click on "Print Labels" from tool bar grid.
    Log    Test Step 5:Select Label Template and click on Print button.
    Verify Print Labels with Multiple Requisitions    ${testdata}
    Log    ER_4:Verified that the Print Labels Modal is displayed.
    Log    ER_5:Verified that the print labels are displayed in new tab.
    Log    Verified the Print Labels by Selecting "${sample_id}" Requisitions
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_039 Select multiple requisitions in pending results, process the results and verify if raw result value is changed to 25 for all empty results
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR039    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ER_1:User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_2:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_3:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select Multiple Requisition and Click on "Cross Tab" from tool bar grid.
    Log    Test Step 5:Click on "Raw Result 25" button.
    Log    Test Step 6:Click on "Start Processing" button and Click on "Close Modal and Refresh Grid".
    Verify Raw Result in Cross Tab with Multiple Requisitions    ${testdata}
    Log    ER_4:Verified that the Cross Tab result review Modal is displayed.
    Log    ER_5:Start processing page is displayed.
    Log    ER_6:Verified that "Changed the raw result value to 25 for all empty result" popup message is displayed.Verified Raw Result is changed in Cross Tab by Selecting "${sample_id}" Requisitions
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_041 Select Complete a requisition and verify the requisition under Results completed tab
    DependencyLibrary.Depends On Test    RR_039 Select multiple requisitions in pending results, process the results and verify if raw result value is changed to 25 for all empty results
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR041    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ER_1:User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_2:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_3:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on "Complete Tab" from tool bar grid.
    Log    Test Step 5: Click on "Start Processing" Button and Click on "Close Modal and Refresh Grid".
    Verify Requisition Moved to Results Completed Tab    ${testdata}
    Log    ER_4:Verified that the Result samples complete all Modal is displayed. and Processed completed successfully.
    Log    ER_5:Verified that the Selected "${sample_id}"-Requisition are removed from Requisition Grid and displayed under "Result Completed" Tab.
    [Teardown]

RR_043 Select requisitions, clear results in Sent back to accessioning and verify that requisitions are removed from requisition grid and displayed in Accessioning tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR043    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ER_1:User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_2:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_3:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select Multiple Requisitions and Click on "Sent Back to Accessioning" Tab from tool bar grid.
    Log    Test Step 5:Click on "Clear Result and Send Back" button.
    Log    Test Step 6:Click on "Start Processing" button and Click on "Close Modal and Refresh Grid".
    Search for Removed Requisitions from Results Review in Accessioning    ${testdata}
    Log    ER_4:Verified that the Sent back to Accessioning Modal is displayed.
    Log    ER_5:Sent back to Accessioning module is displayed.
    Log    ER_6:Verified that the Selected Requisitions of Sample-Id's - "${sample_id}" are Removed from Requisition Grid and displayed in Accessioning tab.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_044 Select requisitions under pending results, process and verify that requisitions are displayed in Preliminary Sent tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR043    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ER_1:User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_2:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_3:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select Multiple Requisition and Click on "Send Preliminary Report" tab from tool bar grid.
    Log    Test Step 5:Click on "Start Processing" button and Click on "Close Modal and Refresh Grid".
    Select Requisitions and Navigate to Send Preliminary Report Tab    ${testdata}
    Log    ER_4:Verified that the Send Preliminary Report Modal is displayed.
    Log    ER_5:Verified that "Preliminary Report Sent!" popup message is displayed.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_049 Verify if user is able to Reject a Requisition
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR049    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 1:Login to HealthTrackRx. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_1:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 2:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_2:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Select any one Requisition ID and Click on Requisition Hamburger Menu.
    Log    Test Step 4:Click on Validity Rejection
    Log    Test Step 5:Select Reject type "YES" and Enter Reject reason and Click on Save button.
    Log    Test Step 6:Select Reject type "NO"and Enter Reject reason and Click on Save button.
    Navigate to Validity Rejection with Selected Requisitions    ${testdata}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_050 Verify if user is able to cancel a test in a requisition
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR050    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 1:Login to HealthTrackRx. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_1:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 2:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_2:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Select any one Requisition ID and Click on Requisition Hamburger Menu.
    Log    Test Step 4:Click on Cancel Test and Click on add button.
    Log    Test Step 5:Select any one reason for cancelling the test and Select cancelled test and click on save button.
    Cancel Test from Hamburger in Different Tabs    ${testdata}
    [Teardown]

RR_062 Verify if user is able to Reject Requisition through Hamburger Reject Requisition
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR062    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 1:Login to HealthTrackRx. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_1:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 2:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_2:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Select any one Requisition ID and Click on Requisition Hamburger Menu.
    Log    Test Step 4:Click on Reject Requisition.
    Log    Test Step 5:Select any one Predefined Comment and Enter the comments and Click on Save Button.
    Navigate to Hamburger Reject Requisition with Sample-id    ${testdata}
    Log    "Reject Requisition Modal" is displayed."Requisition Rejected" popup message is displayed and "Reject Requisition" Record is Removed from Tab.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_063 Clear the results in 'Sent Back to Accessioning' for a requisition and verify that record is removed from the grid
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR063    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 1:Login to HealthTrackRx. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_1:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 2:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_2:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Select any one Requisition ID and Click on Requisition Hamburger Menu.
    Log    Test Step 4:Click on Sent Back to Accessioning.
    Log    Test Step 5:Click on "Clear Result and Send Back" button.
    Select Requisitions and Perform Requisition Hamburger "Send back to Accessioning" in different Tabs    ${testdata}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_066 Select Back to Testing For Multiple Requisitions and Verify the Selected Requisition Remove From Requisition Grid and Displayed in Pending Result Tab
    Log    Read Test Data from Excel File
    ${testdata}    Read TestData From Excel    RR066    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_1:User is Navigated to Home Page
    Log    Test Step 2 : Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_2:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Navigate to Results Completed Screen
    Navigate to Module And Tab    Results Review    Results Completed
    Log    Test Step 3:Select multiple requisition and Click on Back to Testing from tool bar grid.
    Select Multiple Requisition Checkboxes in Result Review    2
    Log    Test Step 4.Click on Yes Button.
    Click on Back For Testing in Tool Bar Grid
    Log    ER_3:Conformation modal is displayed.
    Log    Click on Pending Results Button
    Navigate to Tab    Pending results
    Log    Search For Created Sample Details
    Search For Created Sample Details In Accesioning Module    ${testdata}    2    ${sample_id}
    Log    Verify that the selected requisition remove from requisition grid and displayed in pending result tab.
    Navigate to Module And Tab    Results Review    All
    Log    Select multiple requisition and Click on Back to Testing from tool bar grid.
    Select Multiple Requisition Checkboxes in Result Review    2
    Log    Click on Yes Button.
    Click on Back For Testing in Tool Bar Grid
    Log    Conformation modal is displayed.
    Log    Click on Pending Results Button
    Navigate to Tab    Pending results
    Log    Search For Created Sample Details
    Search For Created Sample Details In Accesioning Module    ${testdata}    2    ${sample_id}
    Log    Verify that the selected requisition remove from requisition grid and displayed in pending result tab.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_078 Verify If The User Is Able To Preview the Report For a Requisition
    Log    Read Test Data from Excel File
    ${testdata}    Read TestData From Excel    RR066    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Click on Result Review and Click on All Tab.
    Navigate to Module And Tab    Results Review    All
    Log    "Results Review" All Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Select Multiple Requisition Checkboxes
    Select Multiple Requisition Checkboxes in Result Review    2
    Log    Click on Preview Report Button From Tool Bar Grid
    Navigate to Tool_Bar Grid Buttons    Preview Report
    Log    Verify MOLECULAR PATHOLOGY Report is Downloaded
    Read Coloured Pdf and Verify    MOLECULAR PATHOLOGY REPORT
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_002 Verify Add Sample Comments to the Requisition from Results review
    Log    Read Test Data from Excel File
    ${testdata}    Read TestData From Excel    RR002    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2 : Log in as an internal user into LIMSABC
    Log    Test Step 3: Goto Quick Menu.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 4 : Click on Result Review Module.
    Navigate To Main Menu    Results Review
    Log    "Results Review" All Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Go to Details tab on Pending Results
    Log    Test Step 6: Click on Sample Comments
    Log    Test Step7 : Enter Comments
    Log    Test Step 8: Click on Save Button
    Validate Sample Comments In Result Review    ${testdata}
    Log    ER: Sample comment should be added to the Requisition
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_061 Verify if user is able to Cancel Specimen for the selected requisition
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR061    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 1:Login to HealthTrackRx. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    ER_1:User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 2:Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    ER_2:"Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Select any one requisition ID and click on requisition hamburger menu.
    Log    Test Step 4:Click on Cancel Specimen.
    Log    Test Step 5:Select any one reason of cancelling and Click on save button.
    Cancel Specimen from Hamburger in different Tabs    ${testdata}
    [Teardown]

RR_067 Verify if the user is able to preview the report for a requisition
    Log    Read Test Data from Excel File
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step A1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    Test Step E1:User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step A2 : Click on Result Review and Click on Results Completed Tab.
    Navigate To Main Menu    Results Review
    Log    Test Step E2 : "Results Review" All Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Validate Preview Report In Pending Results tab
    Log    Test Step A3 : Go to requisition quick features and Click on Preview report.
    Validate Preview Report in Result Review
    Log    Test Step E3 : Verify the display of preview report in new tab.
    Log    Test Step A4 : Verify the display of preview report in Preliminary Sent tab.
    Navigate to Module And Tab    Results Review    Preliminary Sent
    Validate Preview Report in Result Review
    Log    Successfully Verified the display of preview report in new tab.
    Log    Test Step A5 : Verify the display of preview report in Preliminary Sent tab.
    Navigate to Module And Tab    Results Review    Results Completed
    Validate Preview Report in Result Review
    Log    Successfully Verified the display of preview report in new tab.
    Log    Test Step A6 : Verify the display of preview report in Preliminary Sent tab.
    Navigate to Module And Tab    Results Review    All
    Validate Preview Report in Result Review
    Log    Successfully Verified the display of preview report in new tab.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_035 Verify the display of Print Labels for given number of samples in new tab for multiple requisitions selected
    Log    Read Test Data from Excel File
    ${test_data}    Read TestData From Excel    RR035    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step A1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    Test Step E1:User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Log    Test Step A2:Enter credentials and Sign in
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step E2:User is Navigated to Home Page
    Log    Test Step A3 : Click on Result Review and Click on Pending Results Tab.
    Navigate To Main Menu    Results Review
    Log    Test Step E3 : "Results Review" Pending Results data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Validate Preview Report In All tabs
    Verify Print Label in All Tabs In Result Review    ${test_data}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_65 Export the grid data in PDF and Verify that the grid data is downloaded in the PDF format
    Log    Read Test Data from Excel File
    ${test_data}    Read TestData From Excel    RR035    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step A1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    Test Step E1:User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Log    Enter credentials and Sign in
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step A2 : Click on Result Review and Click on Pending Results Tab.
    Navigate To Main Menu    Results Review
    Log    Test Step E2 : "Results Review" Pending Results data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Validate Preview Report In Pending Results tab
    Log    Test Step A3 : Click on Export icon from tool bar grid.
    Log    Test Step A4 : Click on Export PDF
    Validate Export Icon In Result Review
    Log    Test Step E3.Export CSV, Export XLS, Export PDF Options should be displayed.
    Log    Test Step E 4: Data should be downloaded in PDF format and verify the data in UI and Downloaded PDF are matching.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

RR_003 Add Test to the Requisition from Results review
    Log    Read Test Data from Excel File
    ${testdata}    Read TestData From Excel    RR066    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Log in as an internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Goto Quick Menu
    Log    Test Step 4 : Click on Result Review
    Navigate To Main Menu    Results Review
    Log    "Results Review" All Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Select Multiple Requisition Checkboxes
    Log    Test Step 5.Go to Details tab on Pending Results
    Log    Test Step 6.Click on Add Test
    Log    Test Step 7.Add New Test and Click on Save Button
    Log    Test Step 8.Verify Test is added to the Requisition
    Verify Add Tests from Tool Bar Grid in All Tabs    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers
