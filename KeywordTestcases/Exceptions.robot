*** Settings ***
Resource          ../Global/super.robot

*** Test Cases ***
EX_001 Add panels to the Requisition from Exceptions Module Panels
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX001    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Search For Requisition with Sample ID
    Log    Test Step 6:Click on Details
    Log    Test Step 7:Navigate to Panels Tab
    Log    Test Step 8:Click on Add Panels
    Log    Test Step 9:Select any panel and click on Order
    Log    Test Step 10:Verify Panel is added
    Log    Repeating All Test Steps from 5-10 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Add Panels in Exceptions    ${testdata}
    Log    ER_Panels are added to the Requisition
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_002 Add panels to Requisition from Exceptions Module On-Hold Ready Panels Select panels
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX002    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 & 4 : Goto Quick Menu.Click on Exceptions.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Search For Requisition with Sample ID
    Log    Test Step 6: Click on Details
    Log    Test Step 7: Navigate to Panels Tab
    Log    Test Step 8: Click on Add Panels
    Log    Test Step 9: Select any panel and click on Order
    Log    Test Step 10: Verify Panel is added
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Select Filter Type in Accesioning    Requisition Status    New
        Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Panels
        Wait For Spinner To Disappear    ${spinner.locator}
        ${panels_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.accessioning.details.panels.pagetitle}    ${MEDIUM_WAIT}
        Log    "${panels_page_title}"
        Log    "Panels" Page is Displayed
        Click On The Element    ${button.accesioning.pending.panels.select_panel}    Select Panels    ${MEDIUM_WAIT}
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Click On The Element    ${textbox.accessioning.details.panel.select_panel.panel_name}    Panels_dropdown_text    ${MEDIUM_WAIT}
        Send Text To Textfield    ${textbox.accessioning.details.panel.select_panel.panel_name}    Panels_dropdown_text    ${MEDIUM_WAIT}    IMP, NDM, VIM Groups
        Press Keys    None    RETURN
        Comment    ${select_panels_from_dropdown}    Update Dynamic Value    //div[contains(text(),"replaceText")]    IMP,NDM,VIM Groups
        Comment    Wait Until Time    ${SHORT_WAIT}
        Comment    Click On The Element    ${select_panels_from_dropdown}    Select_Panels_dropdown    ${MEDIUM_WAIT}    SeleniumClick
        Comment    Click On The Element    ${page.accessioning.details.panel.select_panel}    Select_panels_page    ${MEDIUM_WAIT}    SeleniumClick
        Comment    Wait Until Time    ${MINI_WAIT}
        Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    Order_button    ${MEDIUM_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        ${panels_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.accessioning.details.panels.pagetitle}    ${MEDIUM_WAIT}
        Log    "${panels_page_title}"
        Wait Until Time    ${MINI_WAIT}
        ${selected_panel_name}    Update Dynamic Values    ${label.accessioning.details.panels.verify_added_panel}    ${RID}    IMP, NDM, VIM Groups
        Wait Until Page Contains Element    ${selected_panel_name}    ${LONG_WAIT}
        Screenshot.Take Screenshot
    END
    Log    ER_Panels are added to the Requisition
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_004 Negative: Add panels to Requisition without selecting Panel from Exceptions Module Panels
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX004    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Search For Requisition with Sample ID
    Log    Test Step 6:Click on Details
    Log    Test Step 7:Navigate to Panels Tab
    Log    Test Step 8:Click on Add Panels
    Log    Test Step 9:Click on Order without selecting any panel
    Log    Test Step 10:Verify Panel is added
    Log    Repeating All Test Steps from 5-10 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Verify Error Message without Adding Panel in Panels    ${testdata}
    Log    ER_"Must be select at least one panel" Error is displayed and panel is not added
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_017 Negative: Reject Requisition without filling mandatory fields from Exceptions Module from Samples
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX017    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Go to Details tab and click on Samples
    Log    Test Step 6:Click on Reject
    Log    Test Step 7:Click on save button without Filling mandatory fields.
    Log    Test Step 8:Verify error "Reason Rejection is a mandatory field"
    Log    Repeating All Test Steps from 5-8 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Reject Sample without Providing Reason and Verify Error Message    ${testdata}
    Log    ER_1:Requisition is not Rejected and error ""Reason Rejection is a mandatory field"" is displayed.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_032 Negative: Select empty bill type from Exceptions Module in Insurance Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX032    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on Details of Requisition and click on Insurance Tab.
    Log    Test Step 6:Select blank value for bill type.
    Log    Test Step 7:Click on Save Button.
    Log    Test Step 8:Verify error "Bill is a mandatory field"
    Log    Test Step 9:Click on Save and Update the Patient Button
    Log    Test Step 10:Verify error "Bill is a mandatory field"
    Log    Repeating All Test Steps from 5-10 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Validate Error Message without Selecting any Bill in Insurance Tab    ${testdata}
    Log    ER_1:"Bill is a mandatory field" error is displayed.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_034 Negative: Save bill type without filling required fields from Exceptions Module in Insurance Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX034    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on Details of Requisition and click on Insurance Tab.
    Log    Test Step 6:Select Other Insurance for bill type and do not enter any value for mandatory fields
    Log    Test Step 7:Click on Save Button.
    Log    Test Step 8:Verify error "mandatory field"
    Log    Test Step 9:Click on Save and Update the Patient Button
    Log    Test Step 10:Verify error "mandatory field"
    Log    Repeating All Test Steps from 5-10 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Validate Error message without Mandatory Fields by selecting Other Insurance Bill    ${testdata}
    Log    ER_1:"mandatory field" Error is displayed.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_022 Negative: Add Samples to Requisition without filling mandatory fields from Exceptions Module in Samples Tab.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX022    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5.Go to Details tab and click on Samples
    Log    Test Step 6:Click on Add Samples
    Log    Test Step 7:Click on save button without Filling mandatory fields
    Log    Test Step 8:Verify error "Type is mandatory field"
    Log    Repeating All Test Steps from 5-8 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Validate Error Message without Adding Samples in Exceptions    ${testdata}
    Log    ER_1:Sample is not added and error "Type is mandatory field" is displayed.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_042 Negative: Validate file upload without selecting file and file type from Exceptions Module in Attachments
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX042    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Go to Details tab and click on Attachments.
    Log    Test Step 6:Click on Upload button.
    Log    Test Step 7:Click on Save button without selecting file and file type.
    Log    Test Step 8:Repeat same steps with selecting file and without selecting file type.
    Log    Repeating All Test Steps from 5-8 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Validate Error without Selecting File and Filetype to Upload in Attachments    ${testdata}
    Log    ER_1:Document is not uploaded and "file type is mandatory field" error is displayed.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_079 Search for the Requisition from Exceptions Module in Tool bar search
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX079    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Enter Requisition ID in the search box.
    Log    Test Step 6:Verify results are displayed based on search.
    Log    Test Step 7:Remove Requisition from the search box.
    Log    Test Step 8:Verify all Requisitions are displayed.
    Log    Repeating All Test Steps from 5-8 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Search for Requisition in Tool Bar in Different Tabs and Verify    ${testdata}
    Log    ER_1:Results are displayed based on search.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_081 Negative: Validate Search on Exceptions Module
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX081    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Enter Sample ID in the search box and Select Requisition ID Check box
    Log    Test Step 6:Click on Search button and Verify results are not displayed
    Log    Test Step 7:Enter Requisition ID in the search box and Select Sample ID Check box
    Log    Test Step 8:Click on Search button and Verify results are not displayed
    Log    Test Step 9:Enter Sample# in the search box and Select Order# Check box
    Log    Test Step 10:Click on Search button and Verify results are not displayed
    Log    Repeating All Test Steps from 5-10 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Search Requisition in Menu Bar with Invalid checkbox type in Different Tabs and Verify    ${testdata}
    Log    ER_1:Results are not displayed for invalid type selection
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_010 Add Comments for Samples from Exceptions Module->Samples Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX010    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Samples
    Log    Test Step 6:.Click on Hamburger menu of Sample
    Log    Test Step 7:Click on Comments
    Log    Test Step 8: Enter Comments and Click on Save button
    Log    Test Step 9: Verify Comments are added
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Verify Add Comments in Exceptions    ${testdata}
    Log    ER_"Must be select at least one panel" Error is displayed and panel is not added
    [Teardown]    Take Screenshot And Close Browsers

EX_011 Edit Location for Samples from Exceptions Module->Samples Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX011    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Samples
    Log    Test Step 6: Click on Edit icon left to the Samples
    Log    Test Step 7: Edit Sample
    Log    Test Step 8: Click on Save button
    Log    Test Step 9: Verify Sample is updated
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Verify Edit Locations in Exceptions    ${testdata}
    Log    ER:Sample should be updated
    [Teardown]    Take Screenshot And Close Browsers

EX_012 Edit Samples from Exceptions Module->Samples Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX012    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Samples
    Log    Test Step 6: Click on Edit icon left to the Samples
    Log    Test Step 7: Edit Sample
    Log    Test Step 8: Click on Save button
    Log    Test Step 9: Verify Sample is updated
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Verify Edit Samples in Exceptions    ${testdata}
    Log    ER:Sample should be updated
    [Teardown]    Take Screenshot And Close Browsers

EX_014 Reject Sample from Left menu from Exceptions Module->Samples Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX014    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Samples
    Log    Test Step 6: Click on Edit icon left to the Samples
    Log    Test Step 7: Edit Sample
    Log    Test Step 8: Click on Save button
    Log    Test Step 9: Verify Sample is updated
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Validate Reject Samples in Exceptions    ${testdata}
    Log    ER:Sample should be updated
    [Teardown]    Take Screenshot And Close Browsers

EX_038 Print requisition form and Attachments from Exceptions Module->Attachments
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX038    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Samples
    Log    Test Step 6:.Click on Hamburger menu of Sample
    Log    Test Step 7:Click on Comments
    Log    Test Step 8: Enter Comments and Click on Save button
    Log    Test Step 9: Verify Comments are added
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Validate Print Requisition Form in Exceptions    ${testdata}
    [Teardown]    Run Keywords    Take Screenshot And Close Browsers    Remove Files in Directory

EX_080 Validate Search on Exceptions Module.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX080    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Enter Requisition ID in the search box and Select Requisition ID Check box
    Log    Test Step 6:Click on Search button and Verify results are displayed based on the search
    Log    Test Step 7:Enter Sample ID in the search box and Select Sample ID Check box
    Log    Test Step 8:Click on Search button and Verify results are displayed based on the search
    Log    Test Step 9:Enter Sample# in the search box and Select Sample# Check box
    Log    Test Step 10:Click on Search button and Verify results are displayed based on the search
    Log    Repeating All Test Steps from 5-10 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Search Requisition in Menu Bar with Valid checkbox type in Different Tabs    ${testdata}
    Log    ER_1:Results are displayed based on search.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_083 Negative: Validate Search on Exceptions Module from Menu bar
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX083    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Enter random data in the search box on the Menu bar
    Log    Test Step 6:Click on Search icon and Verify results are not displayed
    Log    Repeating All Test Steps from 5-6 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Search Requisition with Invalid Id_value in Different Tabs    ${testdata}
    Log    ER_1:Results are not displayed for invalid data
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_082 Validate Search on Exceptions Module from Tool bar.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX082    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Enter Requisition ID in the search box on the Tool bar.
    Log    Test Step 6:Click on Search Icon and Verify results are displayed based on the search.
    Log    Test Step 7:Enter Sample ID in the search box on the Tool bar.
    Log    Test Step 8:Click on Search Icon and Verify results are displayed based on the search.
    Log    Test Step 9:Enter Sample# in the search box on the Tool bar.
    Log    Test Step 10:Click on Search Icon and Verify results are displayed based on the search.
    Log    Test Step 11:Remove text from search box and verify all the results are displayed.
    Log    Repeating All Test Steps from 5-11 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Search Different Requisitions in Tool Bar Search in Different Tabs.    ${testdata}
    Log    ER_1:Results are displayed based on search
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_075 Validate Requisition Notifications from Exceptions Module in Send Notification
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX075    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on Send Notification Button left to the Requisition
    Log    Test Step 6:Enter notify Contacts
    Log    Repeating All Test Steps from 5-6 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Send Notification to Contacts in Different Tabs    ${testdata}    Yes
    Log    ER_1:User is able to add contacts
    Log    ER_2:User is able to Create Notifications
    [Teardown]    Take Screenshot And Close Browsers

EX_076 Negative: Validate Notifications Requisition without filling mandatory fields from Exceptions Module in Send Notification
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX076    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on Send Notification Button left to the Requisition.
    Log    Test Step 6:Click on Submit button without filling mandatory fields.
    Log    Test Step 7:Verify error "Notify contact is a Mandatory field"
    Log    Repeating All Test Steps from 5-7 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Send Notification to Contacts in Different Tabs    ${testdata}    No
    Log    ER_1:Error 'Notify Contact is a mandatory field' is displayed.
    [Teardown]    Take Screenshot And Close Browsers

EX_055 Search for the Error with name from Exceptions Module->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX076    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Go to Details tab and click on Errors Tab
    Log    Test Step 6: Enter Error name in the search box
    Log    Test Step 7: Verify results are displayed based on search
    Log    Test Step 8: Remove Error name from the search box
    Log    Test Step 9: Verify all Errors are displayed
    Log    Test Step 9: Repeat The Same Steps For All Tabs in Exceptions Module
    Verify Search in Exceptions Errors Tab    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

EX_049 Add Error to Requisition from Exceptions Module->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX049    Exceptions
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
    Log    Test Step 3 : Goto Quick Menu.
    Log    Test Step 4 : Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Accessioning" page is displayed.
    Log    Test Step 5: Click on Details of Requisition and click on Errors Tab
    Log    Test Step 6: Click on Add Button.
    Log    Test Step 7: Fill all the required fields
    Log    Test Step 8: Click on Save Button
    Log    Test Step 9: Verify Error is added
    Log    Repeating All Test Steps from in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Add New Error in Exceptions    ${testdata}
    Log    Verified with the Added Error
    [Teardown]    Run Keywords    Take Screenshot And Close Browsers
    ...    AND    Get Added Error in Exceptions    ${testdata}

EX_053 Add Comments to the Error from Exceptions Module->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX053    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Goto Quick Menu.Click on Accessioning.
    Log    Test Step 4 : Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Details of Requisition and click on Errors Tab
    Log    Test Step 6: Click on Comments Button
    Log    Test Step 7: Add your Comments and click on Save
    Log    Test Step 8: Verify Comments is added to Error
    Log    Test Step 9: Repeat the same steps from in all tabs
    Add Comments to Error in Exceptions    ${testdata}
    Log    Added Comments to the Error
    [Teardown]    Take Screenshot And Close Browsers

EX_054 Resolve the Error from Exceptions Module->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX053    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application. ${URL} URL in ${BROWSER_NAME}
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Goto Quick Menu
    Log    Test Step 4.Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Accessioning" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5 : Click on Details of Requisition and click on Errors
    Log    Test Step 6 : Click on Resolved Button
    Log    Test Step 7: Verify Error is resolved
    Log    Test Step 8: Repeat the Sam eSteps in All tabs
    Verify Resolve Error in Exceptions    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

EX_051 Edit Error from Exceptions Module->Errors Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX051    Exceptions
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
    Log    Test Step 3 : Goto Quick Menu.
    Log    Test Step 4 : Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Accessioning" page is displayed.
    Log    Test Step 5: Click on Details of Requisition and click on Errors Tab
    Log    Test Step 6: Click on Add Button.
    Log    Test Step 7: Fill all the required fields
    Log    Test Step 8: Click on Save Button
    Log    Test Step 9: Verify Error is added
    Log    Repeating All Test Steps from in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Verify Edit Error in Exceptions    ${testdata}
    EX_037 Validate File Upload from Exceptions Module in Attachments.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX037    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Go to Details tab and click on Attachments.
    Log    Test Step 6:Click on Upload button.
    Log    Test Step 7:Choose file and select file type.
    Log    Test Step 8:Click on Save button.
    Log    Test Step 9:Verify on attachments tab the document is displayed.
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Upload and Delete Attachment in Details Attachment Tab in Different Tabs and Verify    ${testdata}    no
    Log    ER_1:User is able to upload file.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_040 Edit Attachments from Exceptions Module in Attachments tab
    DependencyLibrary.Depends On Test    EX_037 Validate File Upload from Exceptions Module in Attachments.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX040    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Go to Details tab and click on Attachments Tab.
    Log    Test Step 6:Click on Edit icon left to the Attachments Tab.
    Log    Test Step 7:Edit file type.
    Log    Test Step 8:Click on Save button.
    Log    Test Step 9:Verify file type is updated.
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Edit Attachment in Details Attachment in Diffent Tabs in Exceptions and Verify    ${testdata}
    Log    ER_1:File type is updated.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_046 Search for the Attachment with name from Exceptions Module in Attachments tab
    DependencyLibrary.Depends On Test    EX_037 Validate File Upload from Exceptions Module in Attachments.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX046    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Go to Details tab and click on Attachments Tab.
    Log    Test Step 6:Enter Attachments name in the search box.
    Log    Test Step 7:Verify results are displayed based on search.
    Log    Test Step 8:Remove POCT name from the search box.
    Log    Test Step 9:Verify all Attachments are displayed.
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Search Attachment Name in Exceptions on Details Attachment Search field and Verify    ${testdata}
    Log    ER_1:Results are displayed based on search.
    [Teardown]    Take Screenshot And Close Browsers

EX_039 Delete Attachment from Requisition from Exceptions Module in Attachments.
    DependencyLibrary.Depends On Test    EX_037 Validate File Upload from Exceptions Module in Attachments.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX039    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is navigated to HealthTrack Rx application."${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is navigated to home page.Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab.
    Navigate To Main Menu    Exceptions
    Log    "Exceptions" page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Go to Details tab and click on Attachments Tab.
    Log    Test Step 6:Click on Hamburger menu and Click on delete button.
    Log    Test Step 7:Click on "No" button on confirmation page and verify Attachment is not deleted.
    Log    Test Step 8:Click on Hamburger menu and Click on delete button.
    Log    Test Step 9:Click on "Yes" button on confirmation page and verify Attachment is Deleted.
    Log    Repeating All Test Steps from 5-9 in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Upload and Delete Attachment in Details Attachment Tab in Different Tabs and Verify    ${testdata}    yes
    Log    ER_1:User is able to delete Attachment.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

EX_021 Reject Requisition from Exceptions Module->Samples
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX021    Exceptions
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
    Log    Test Step 3 : Goto Quick Menu.
    Log    Test Step 4 : Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Accessioning" page is displayed.
    Log    Test Step 5: Click on Details of Requisition and click on Samples Tab
    Log    Test Step 6: Click on Reject Button.
    Log    Test Step 7: Select predefined comment on Reject requisition
    Log    Test Step 8: Fill all mandatory fields and click on Save button
    Log    Test Step 9: Search for the requisition from Exceptions Module->Rejected Search
    Log    Repeating All Test Steps from in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Verify Reject Requisition in Exceptions Samples    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

EX_030 Change Bill type of Requisition from Exceptions Module->Insurance Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    EX030    Exceptions
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
    Log    Test Step 3 : Goto Quick Menu.
    Log    Test Step 4 : Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Accessioning" page is displayed.
    Log    Test Step 5: Click on Details of Requisition and click on Insurance Tab
    Log    Test Step 6: Change Bill type to Client Bill
    Log    Test Step 7: Click on Save Button
    Log    Test Step 8: Navigate to General tab
    Log    Test Step 9: Verify Bill Type is Changed to Client Bill
    Log    Test Step 10: Click on Details of Requisition and click on Insurance Tab
    Log    Test Step 11: Change Bill type to Financial Hardship
    Log    Test Step 12: Click on Save Button
    Log    Test Step 13: Navigate to General tab
    Log    Test Step 14: Verify Bill Type is Changed to Financial Hardship
    Log    Repeating All Test Steps from in MBI,On-Hold,Lab Exception,Rejected,Reviewed Critical.
    Verify Change Bill Type in Exceptions    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

EX_031 Change Bill type of Requisition and Patient from Exceptions Module->Insurance Tab
    ${new_requisition_testdata}    Read TestData From Excel    AC118    NewRequisition
    ${testdata}    Read TestData From Excel    EX031    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Create New Requisition For Sample Id for Patient Name
    Refuse Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Exceptions"
    Navigate To Main Menu    Exceptions
    Log    "Accessioning Pending" data page is displayed.
    Navigate to Tab    MBI
    Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
    ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
    Log    "${RID}" is Received
    Set Test Variable    ${RID}
    Log    Verify admin able to change bill type
    Change Bill Type    ${testdata}    ${RID}    save_button=update
    Log    Navigate To General Tab and Check Updated Bill Type
    Navigate to General and Verify Bill Type is Updated    ${bill_type_option}
    ${patient_name}    Get Text    //tbody[@class='grid_body']//tr[1]//td[9]
    @{patient_name}    Split String    ${patient_name}    ${SPACE}
    Set Test Variable    @{patient_name}
    Log    Go to Client Portal page
    Navigate To Main Menu    Client Portal
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition To Validate Patient Bill Type    ${new_requisition_testdata}    ${bill_type_option}    negative
    [Teardown]    Take Screenshot And Close Browsers

EX__061 Change Patient Details of Requisition from Exceptions Module->General Tab
    ${testdata}    Read TestData From Excel    EX061    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Refuse Alert for Notifications of News
    Log    Test Step 3 : Navigate to Quick Manual to select "Exceptions"
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptios On Hold Ready" data page is displayed
    Refuse Alert for Notifications of News
    Log    Test Step 5 :Click on Details of Requisition and click on General Tab
    Log    Test Step 6.Change Patient First Name and Last Name
    Log    Test Step 7 :Change DOB and Gender
    Log    Test Step 8 :Fill required fields
    Log    Test Step 9 :Click on Save Button
    Log    Test Step 10 : Repeat the same steps from 4 to 9 on MBI
    Change Patient Details in General Tab In Exceptions    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

EX_064 Negative: Validate invalid Email format on General Tab of Requisition from Exceptions Module->General Tab
    ${testdata}    Read TestData From Excel    EX064    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Refuse Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Accesioning"
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold
    Navigate To Main Menu    Exceptions
    Log    "Exceptios On Hold Ready" data page is displayed
    Refuse Alert for Notifications of News
    Log    Test Step 5 :Click on Details of Requisition and click on General Tab
    Log    Test Step 6 :Enter invalid email format and Click on Save button
    Log    Test Step 7 :Verify error "Error in mail"
    Log    Test Step 9 : Repeat the same steps from 4 to 9 on MBI
    Validate Invalid Email in General Tab in Exceptions    ${testdata}
    [Teardown]    Take Screenshot And Close Browsers

EX_067 Change Bill type of Requisition on General Tab of Requisition from Exceptions Module->General Tab
    ${testdata}    Read TestData From Excel    AC187    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Log in as an internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Refuse Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Accesioning"
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions On Hold Ready" data page is displayed
    Refuse Alert for Notifications of News
    Log    Test Step 5 :Click on Details of Requisition and click on General Tab
    Log    Test Step 6 : Select bill type
    Log    Test Step 7 : Click on Save Button
    Log    Test Step 8 : Navigate to General tab
    Log    Test Step 9 : Verify bill type is changed
    Log    Test Step 10 : Repeat the same steps from in All Tabs
    Change Bill Type in General In Exceptions    ${testdata}

EX_70 Change Dr Signed on Paper on General Tab of Requisition from \ Exceptions Module->General Tab
    ${testdata}    Read TestData From Excel    EX070    Exceptions
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Log in as an internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Refuse Alert for Notifications of News
    Log    Navigate to Quick Manual to select "Accesioning"
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Click on Exceptions Module and Click on On-Hold Ready Tab
    Navigate To Main Menu    Exceptions
    Log    "Exceptions On Hold Ready" data page is displayed
    Refuse Alert for Notifications of News
    Log    Test Step 5 :Click on Details of Requisition and click on General Tab
    Log    Test Step 6 : Select bill type
    Log    Test Step 7 : Click on Save Button
    Log    Test Step 8 : Navigate to General tab
    Log    Test Step 9 : Verify bill type is changed
    Log    Test Step 10 : Repeat the same steps from in All Tabs
    Verify Doctor Signed Functionality in General in Exceptions    ${testdata}
