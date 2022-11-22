*** Settings ***
Test Teardown     Take Screenshot
Resource          ../Global/super.robot

*** Test Cases ***
LP_054 User to Login to HealthTrack Rx
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: Enter Valid UserName & Password Click on Sign-in.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    [Teardown]

LP_056 Forgot Password Functionality in Login Page
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Click on Forgot your Password link.
    Click Element    ${button.login.forgot_password_link}
    Log    User is Navigated to a New Tab with Enter Email Field
    Log    Test Step 3: Enter Invalid Email id and Click on Send.
    Perform Actions in Forgot Password Page    ${environment_data}[InvalidPassword]
    Wait Until Page Contains Element    ${message.login.forgot_password_link.email_textbox}
    Screenshot.Take Screenshot
    Log    Error Text "This email is not registered in our database" is displayed.
    Log    Test Step 4: Enter Registered Email and Click on Send
    Perform Actions in Forgot Password Page    prakash.kamma@qualizeal.com
    Comment    Wait Until Element Is Visible    //input[@name="limsabc_qa_securityQuestions_form_answer_622"]    ${MEDIUM_WAIT}
    Comment    Input Text    //input[@name="limsabc_qa_securityQuestions_form_answer_622"]    kamma
    Comment    Wait Until Element Is Visible    //input[@name="limsabc_qa_securityQuestions_form_answer_623"]    ${MEDIUM_WAIT}
    Comment    Input Text    //input[@name="limsabc_qa_securityQuestions_form_answer_623"]    sweety
    Comment    Wait Until Element Is Visible    //input[@name="limsabc_qa_securityQuestions_form_answer_624"]    ${MEDIUM_WAIT}
    Comment    Input Text    //input[@name="limsabc_qa_securityQuestions_form_answer_624"]    kurnool
    Comment    Perform Actions    ${button.actions}    Send    ${MEDIUM_WAIT}
    Comment    Log    User Received an Email \ with Reset Password Link.
    [Teardown]    Take Screenshot and Close Browsers

CP_068 Negative: Create Toxicology Requisition without mandatory fields
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    ${testdata}    Read TestData From Excel    CP068    ClientPortal
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    Test Step 1: ${BROWSER_NAME} browser is launched with ${URL} URL
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigated to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Toxicology
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Comment    Save Requition and Verify Error Messages
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Select Order Physician    ${testdata}
    Log    Test Step 7 : Selected ${test_data}[orderphysician_name] as order physician
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Comment    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Selected ${testdata}[syndromic_filter_category] as Syndromic FIlter Category
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Comment    Select ICS code for new requisition
    Select ICS code    ${testdata}
    Log    Selected ${testdata}[icd_code]
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Comment    Select Medication code for new requisition
    Select Medication Code    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[panel_error_message]    ${SHORT_WAIT}
    Log    Select Ketamine Option in Syndromic Menu Filter Category
    Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Log    Selected Ketamine As Syndromic Menu Filter Category and Provided Time
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Log    Validate Medical Neccesity
    Validate Medical Neccesity While Creating Toxicology Requisition    ${testdata}[patientrisklevel]    ${testdata}[receivedfrom]    ${testdata}[medicalneccesitydocumentation]    ${testdata}[error_message]

CP_072 Verify whether Newly Added Comments are displayed in Comments Page.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP072    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module And Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    Log    Test Step 5&6 :Click on Comments. Enter comments and click on Add button.
    Navigate to First Requisition Comments Page    ${testdata}
    Log    Options are displayed
    Log    Comments page is displayed and Comments Added in the "${sample_id}" Comments page.
    Log    Test Step 7: Refresh the New Report Page
    Search For Details In Home Page    ${RID}    ${testdata}[pending_searchcategory_checkbox]
    Log    Searched for the sample-id - ${RID} and is displayed successfuly.
    Validate comments icon
    Log    "Comments" Message Box icon is displayed.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

CP_077 Verifying regenerate requisition form
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    ${testdata}    Read TestData From Excel    CP077    ClientPortal
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    Test Step 1: ${BROWSER_NAME} browser is launched with ${URL} URL
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigated to Quick Manual to select "Client Portal"
    Log    Test Step 4 : Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Refuse Alert for Notifications of News
    Navigate to Module And Tab    Results Review    Pending results
    Navigate to Result Review To Send Preliminary Report
    Regenerate Requisition Form In Client Portal New Reports Menu and Verify Attachment Icon    ${testdata}

CP_084 Negative: Create Ordering Physician without required fields
    ${testdata}    Read TestData From Excel    CP084    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Validate Create New Order Physician without filling Mandatory Fields    ${testdata}

CP_085 Create Ordering Physician from Create Requisition page
    ${testdata}    Read TestData From Excel    CP085    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Create New Order Physician and Verify    ${testdata}

CP_087 Verify User is able to Upload Documents with out Selecting File type.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP087    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module And Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    ${RID}    Navigate to First Requisition View Documents
    Log    Navigated to Requisition -"${RID}" "View Documents" Page
    Log    Test Step 6: Click on Upload icon.
    Log    Test Step 7: Click on choose file and click on save.
    Upload File in View Documents and Save    ${testdata}    ${upload_file_path_in_clientportal_for_view_document}
    Log    Upload Modal is Displayed and Verified the error Message after Clicking Save without Selecting File Type.
    [Teardown]    Take Screenshot and Close Browsers

CP_088 Verify User is able to Upload Documents by Selecting File type
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP088    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module And Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    Log    Test Step 5: Click on View Documents.
    ${RID}    Navigate to First Requisition View Documents
    Log    Options are displayed and Requisition-id -"${RID}" View Documents page is displayed
    Log    Test Step 6: Click on Upload icon.
    Log    Test Step 7: Click on Choose File and Select File with File type and Save.
    Upload File with File Type in View Documents and Save    ${testdata}    ${upload_file_path_in_clientportal_for_view_document}
    Log    Upload Modal is Displayed and Verified with Uploaded File in View Documents Page
    [Teardown]    Take Screenshot and Close Browsers

CP_092 Verifying for requisition final reports.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP092    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module And Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one Requisition ID and Click on Preview Report.
    Send Requisitions with Finalized Status to Preview Report    ${testdata}
    Log    Final Reports for Requisition Modal is displayed.
    [Teardown]    Take Screenshot and Close Browsers

CP-094 Verify that the Selected Record is Removed from the Requisition List.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP094    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" Pending Lab Work Button..
    Navigate to Module And Tab    Client Portal    Pending Lab Work
    Log    Navigated to "Client Portal" and Pending Lab Work page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    Log    Test Step 5: Click on Cancel then click on yes.
    ${RID}    Click on Cancel Button in Hamburger
    Log    Navigated to Requisition-id -"${RID}" "Cancel" Page
    Search ID Value and Verify    ${testdata}    ${RID}
    Log    Searched for "${RID}" - Value
    [Teardown]    Take Screenshot and Close Browsers

CP_098 Negative: Cancel the Create Patient Form after filling the Details and Verify Patient is Created
    ${testdata}    Read TestData From Excel    CP098    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Select Client Site    ${testdata}
    Log    Selected ${testdata}[clientsitetotype] as client site
    Select Order Physician    ${testdata}
    Log    Selected ${testdata}[orderphysician_name] as client site
    Log    Cancel Create New Patient And Verify Patient is not Created
    Cancel Create Patient and Verify    ${testdata}

CP_099 Update Patient Details from Create Requisition form
    ${testdata}    Read TestData From Excel    CP099    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Select Client Site    ${testdata}
    Log    Selected ${testdata}[clientsitetotype] as client site
    Select Order Physician    ${testdata}
    Log    Selected ${testdata}[orderphysician_name] as client site
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Edit the Created Patient And Verify Patient is not Created
    Comment    Perform Actions    Save    ${MEDIUM_WAIT}
    Log    Update Created Patent
    Update Patient    ${testdata}
    Log    Verify Created and Updated patient
    Verify Updated Patient    ${testdata}

CP_105 Negative: Create Requisition without uploading file for Insurance Attached bill type
    ${testdata}    Read TestData From Excel    CP105    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Input Mandatory Fields For New Requisition With Patient Bill Type Insurance Attached    ${testdata}
    Log    Verify Alert Message With Insurance Attached as Bill Type Option
    Validate Documents Page Screen With Insurance Bill Type For Patient

CP_106 Negative: Upload Other than PDF and PNG Files on Create Requisition Documents page for Insurance attached bill type
    [Setup]    Take Screenshot And Close Browsers
    ${testdata}    Read TestData From Excel    CP106    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Verify Alert Message With Insurance Attached as Bill Type Option
    Upload Files in Documents Page and Validate Error Messages

CP_110 Delete attachment from Pending Lab Work details menu for a requisition
    ${testdata}    Read TestData From Excel    CP110    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Create Requisition With Insurance Attached Patient Bill Type
    Create Requisition With Patient Bill Type Insurance Attached and Upload FIle In Documents Page    ${testdata}
    Log    Search Requisition Using Patient name Filter
    Search Requisition To Apply Filter Using Patient Name
    Log    Verify Delete Attachment of requsition of Insurance Attached Bill Type
    Navigate To Attachments to Verify Delete Attachment Functionality

CP_039 Validate creation of Infectious Disease requisition with new patient and provider/delegate acknowledgement
    ${testdata}    Read TestData From Excel    CP039    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Create New Requisition to Validate Doctor Signature
    Create New Requisition For Sample Id    ${testdata}
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]

CP_41 Validate creation of Covid Only requisition with new patient and provider/delegate acknowledgement
    ${testdata}    Read TestData From Excel    CP041    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Create New Requisition to Validate Doctor Signature
    Log    Test Step 3 : Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    Test Step 5 : User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    COVID Only
    Log    Test Step 6 : Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${testdata}
    Log    Navigate to Quick Manual to select "Accesioning"
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]

CP_100 Negative: Cancel the Create Patient form after filling the details and verify Patient is created
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP100    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 : Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated to "New Order"
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    "Infectious Disease Requisition" Form is Displayed
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Select Order Physician    ${testdata}
    Log    Selected "${test_data}[orderphysician_name]" as Order Physician
    Input All Fields in Create New Patient Page    ${testdata}
    Log    New Patient with Name-"${patient_name}" is Created
    Log    Test Step 8:Click on Edit Patient Details
    Log    Test Step 9:Modify the Patient Details
    Log    Test Step 10:Click on Cancel Button
    Validate Edited Name in Edit Patient Details    ${testdata}
    Log    Verified that the Patient Update form is closed and Patient Details are not changed
    [Teardown]    Take Screenshot and Close Browsers

CP_086 Verifying that the selected requisition bill type.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP086    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu and Click on Client Portal.Click on pending lab work button.
    Navigate to Module And Tab    Client Portal    Pending Lab Work
    Log    Navigated to "Client Portal Pending Lab Work" page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select any one requisition ID and click on requisition details.
    ${RID}    Get First Requisition RID
    Log    "${RID}" is received
    Click Details Button    R0${RID}
    Log    Requisition details of Value-"${RID}" displayed.Insurance Tab is Clicked
    Log    Test Step 5:Select "Please, Select" value for Bill Type Dropdown and click on save button.
    Log    Test Step 6:Verify Error "Bill is a mandatory filed"
    Log    Test Step 7:Select any value for Bill type dropdown other than "Please, select" and Click on save button.
    Log    Test Step 8:Verify Bill type is saved
    Verify Requisition Bill type with Invalid and Valid Bills    Please, select    Client Bill
    Log    Verified with the Error "Bill is a mandatory field" by passing "Please, select" value in Bill type.
    Log    Verified the message "Saved" for Selecting Bill type other than "Please, Select".
    [Teardown]    Take Screenshot and Close Browsers

CP_083 Negative: Create Ordering Physician with Special Characters
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP083    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 :Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated \ to "New Order" page
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Log    Test Step 7:Select value for Client Site
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Log    Test Step 8:Click on Create new Ordering Physician
    Log    Test Step 9:Enter Special Characters in First Name and Last Name and Fill all other mandatory fields
    Log    Test Step 10:Click on save button
    Validate Ordering Provider with Special Characters    ${testdata}
    Log    Verified that the Ordering Physician is not Created by passing Special Characters into Ordering Physician First Name and Last name fields
    [Teardown]    Take Screenshot and Close Browsers

CP_081 Verifying that the requisition edit collection data record.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP081    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and \ sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3: Goto Quick Menu and Click on Client Portal.Click on pending lab work button.
    Navigate to Module And Tab    Client Portal    Pending Lab Work
    Log    Navigated to "Client Portal Pending Lab Work" page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select any one requisition ID<<Advance features and click on edit collection date(future date).
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Edit Collection Date
    Log    User is Navigated to "Edit Collection Date" page.
    Log    Test Step 5:Enter the collection date and click on start processing button.
    Set Future Month Date to Edit Collection Date and Verify Error    20
    Log    Verified that the collection date received is unsuccessful.
    [Teardown]    Take Screenshot and Close Browsers

CP_058 Edit the order column name verify that the updated column name is displayed in requisition records.
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3: Goto Quick Menu and Click on Client Portal.
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal Pending Lab Work" page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Click on settings icon.
    Settings Icon
    Log    Navigated to order column page.
    Log    Test Step 5:Click on edit icon beside any column name.
    Edit Order Column    samples_ids
    Log    Edit column modal is displayed.
    Log    Test Step 6:Edit column name and save.
    Edit Field name in Order Column and Verify    Sample id(s)
    Log    Verified with "Edited" success message.
    Log    Test Step 7:Click on save."
    Verify Updated Field Name in Data grid    Sample id(s)
    Log    Updated column name is displayed in the data grid.
    Settings Icon
    Edit Order Column    samples_ids
    Edit Field name in Order Column and Verify    Sample ID(s)
    Verify Updated Field Name in Data grid    Sample ID(s)
    [Teardown]    Take Screenshot and Close Browsers

CP_059 Change the grid order and verify that the requisition records are displayed in the save order.
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3: Goto Quick Menu and Click on Client Portal.
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal Pending Lab Work" page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Click on settings icon.
    Get Order Position from Data Grid
    Settings Icon
    Log    Navigated to order column page.
    Log    Test Step 5:Drag a column and change the order and click on save.
    Exchange Data Grid Positions and Verify
    Log    "Grid order saved successfully" message is displayed.
    Log    Test Step 6:Verify that requisition records are displayed in the saved order.
    Should Not Be Equal    ${grid_position}    Patients Name
    Log    Verified that Requisition records are displayed in the saved order.
    [Teardown]    Take Screenshot and Close Browsers

CP_063 Verify that the Export icon the grid data in External user.
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Go to profile page change External role and click on save button.
    Change Profile Page Role    External
    Log    Verified that the "Success" popup message is displayed.
    Log    Test Step 4:Click on client portal.
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" page***.client portal page is displayed.
    Log    Test Step 5:Verify Export icon displayed or not from tool bar grid
    Validate Export icon in External Role
    Log    Export icon is not displayed.
    [Teardown]    Take Screenshot and Close Browsers

CP_080 Verifying that the requisition advance features.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP080    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Click on pending lab work button.
    Navigate to Module And Tab    Client Portal    Pending Lab Work
    Log    Navigated to "Client Portal Pending Lab Work" page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select advance features click on any one dropdown options.
    Navigate to Advance Features    Edit Collection Date
    Verify Message    ${label.clientportal.no_requisition_selected.advance_features.click_sub-menu.error_message}    ${SHORT_WAIT}
    Log    Verified the Error text "Please, select requisition" is displayed.
    Log    Test Step 7:Select any one requisition ID<<Advance features and click on edit collection date.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Edit Collection Date
    Log    User is navigated to edit collection date page.
    Log    Test Step 8:Enter the collection date and click on start processing button.
    Set Date in Edit Collection Date    30
    Log    Verified that the collection date received successful.
    Log    Test Step 9:Select any one requisition ID<<Advance features<< Batch cancel then click on yes.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Batch Cancel
    Actions in Batch Cancel Page    Yes
    Log    User is navigated to batch cancel page.
    Log    Test Step 10:Click on start processing button.
    Navigate to Start Process and Close Modal Grid
    Log    Verified that the batch cancel process is successful.
    Log    Test Step 5:Select any one requisition ID<<Advance features and click on print labels.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Print Labels
    ${pdf_data}    Read Pdf Data
    Verify Pdf Data and Remove Pdf File    ${pdf_data}    ${updated_sample_id}[0]    ${file_path}
    Log    Verified that the print label is displayed in new tab.
    Log    Test Step 6:Select any one requisition ID<<Advance features and click on requisition form.
    Navigate to Advance Features    Requisition Form
    ${pdf_data}    Read Pdf Data
    Verify Pdf Data and Remove Pdf File    ${pdf_data}    ${updated_sample_id}[0]    ${file_path}
    Log    Verified that the requisition form is displayed in new tab.
    Log    Test Step 11:Select any one requisition ID<<Advance features and click on download.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Download
    ${pdf_data}    Read Pdf Data
    Verify Pdf Data and Remove Pdf File    ${pdf_data}    ${updated_sample_id}[0]    ${file_path}
    Log    Verified that the data is downloaded as new tab.
    Log    Test Step 12:Select any one requisition ID<<Advance features and click on zip & download.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Zip & Download
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    Log    Verified that the data is downloaded as zip file.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_090 Verifying uploading documents with select choose file.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP090    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Click on new report button.
    Navigate to Module And Tab    Client Portal    New Report
    Log    "New Report" data page is displayed.
    Log    Test Step 4:Select any one requisition ID and click on requisition hamburger menu.
    Log    Test Step 5:Click on View Documents.
    ${RID}    Navigate to First Requisition View Documents
    Log    Options are displayed.
    Log    "View Documents" page is displayed.
    Log    Test Step 6:Click on Upload icon.
    Log    Test Step 7:Click on choose file upload a pdf file, and select images as file type.
    Upload File with File Type in View Documents and Save    ${testdata}    ${upload_file_path_in_clientportal_for_view_document}
    Log    "Upload" modal is displayed.
    Log    Verified that the file is uploaded successfully.
    [Teardown]    Take Screenshot and Close Browsers

CP_093 Verifying the requisition downloading data.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP093    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Click on new report button.
    Navigate to Module And Tab    Client Portal    New Report
    Log    Navigated to "Client Portal New Report" page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select advance features click on download or zip & download.
    Navigate to Advance Features    Zip & Download
    Verify Message    ${label.clientportal.no_requisition_selected.advance_features.click_sub-menu.error_message}    ${SHORT_WAIT}
    Log    Verified the Error text "Please, select requisition".
    Log    Test Step 5:Select any one requisition ID<<Advance features and click on download.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Download
    ${pdf_data}    Read Pdf Data
    Verify Pdf Data and Remove Pdf File    ${pdf_data}    ${updated_sample_id}[0]    ${file_path}
    Log    Verified that E-requisition report is displayed in new tab
    Log    Test Step 6:Select any one requisition ID<<Advance features and click on zip & download.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisition checkbox is Clicked
    Navigate to Advance Features    Zip & Download
    Read and Remove File path
    Log    Verified that the data is downloaded as zip file.
    [Teardown]    Take Screenshot and Close Browsers

CP_052 Negative: Cancel the requisition form after filling the details and verify requisition is created
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP052    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Log in as an internal user into LIMSABC. Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 : Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated to "New Order"
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    "Infectious Disease Requisition" Form is Displayed
    Log    Test Step 7:Fill all the required fields
    Select Client Site    ${testdata}
    Select Order Physician    ${testdata}
    Input All Fields in Create New Patient Page    ${testdata}
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Log    Required Details are Entered
    Log    Test Step 8:Click on Cancel Button
    Perform Actions    CANCEL    ${MEDIUM_WAIT}
    Log    Test Step 9:Verify "Are you sure to Cancel with Yes & No" popup should be displayed
    Log    "Are you sure?" popup message is displayed
    Log    Test Step 10:Click on "No" and verify form should not be cancelled
    Cancel Created Requisition    No
    Log    "Are you sure?" popup message is displayed
    Log    Test Step 11:Click on Cancel Button
    Perform Actions    CANCEL    ${MEDIUM_WAIT}
    Log    Test Step 12:Verify "Are you sure to Cancel with Yes & No" popup should be displayed
    Log    Test Step 13:Click on "Yes" and Verify form should be cancelled
    Cancel Created Requisition    Yes
    Log    "Are you sure?" popup message is displayed
    Log    Requisition form is closed and Requisition is not created

CP_097 Negative: Validate Phone number on Create Ordering Physician Page from Create Requisition
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP097    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Log in as an internal user into LIMSABC. Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 : Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated to "New Order"
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    "Infectious Disease Requisition" Form is Displayed
    Select Client Site    ${testdata}
    ${mobile_no}    Split String    ${testdata}[phone_number]    |
    Log    Test Step 7:Click on Create new Ordering Physician
    Log    Test Step 8:Fill all required fields
    Create New Ordering Provider    ${testdata}
    Log    Test Step 9:Enter Alpha Numeric Characters and Click on Save button
    Log    Test Step 10:Verify error "Invalid Phone Format"
    Verify Order Physician Phone Number    ${mobile_no}[0]
    Log    "Invalid Phone Format" Error is thrown and Patient is not created
    Log    Test Step 11:Enter Alphabets and Click on Save button
    Log    Test Step 12:Verify error "Invalid Phone Format"
    Verify Order Physician Phone Number    ${mobile_no}[1]
    Log    "Invalid Phone Format" Error is thrown and Patient is not created
    Log    Test Step 13:Enter Special Characters and Click on Save button
    Log    Test Step 14:Verify error "Invalid Phone Format"
    Verify Order Physician Phone Number    ${mobile_no}[2]
    Log    "Invalid Phone Format" Error is thrown and Patient is not created
    Log    Test Step 15:Enter Numbers of length below 10 digits and click on Save button
    Log    Test Step 16:Verify error "Invalid Phone Format"
    Verify Order Physician Phone Number    ${mobile_no}[3]
    Log    "Invalid Phone Format" Error is thrown and Patient is not created
    Log    Test Step 17:Enter Numbers of length above 10 digits and click on Save button
    Log    Test Step 18:Verify error "Invalid Phone Format"
    Verify Order Physician Phone Number    ${mobile_no}[4]
    Log    "Invalid Phone Format" Error is thrown and Patient is not created

CP_064 Validate creation of Patient with Bill Type "Other Insurance" from client portal requisition form for Infectious Disease
    ${testdata}    Read TestData From Excel    CP064    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
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
    Create New Requisition For Sample Id    ${testdata}
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_45 Validate creation of Toxicology requisition with new patient and provider/delegate acknowledgement
    ${testdata}    Read TestData From Excel    CP045    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Log in as an internal user into LIMSABC. Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 : Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated to "New Order"
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Toxicology
    Log    "Infectious Disease Requisition" Form is Displayed
    Validate Create New Toxicology Requisition With New Patient    ${testdata}
    Navigate To Main Menu    Accessioning
    Search For Details In Home Page    ${sample_id}    Sample ID
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_139 Verify if test data in ordering physician should be displayed the data grid
    ${testdata}    Read TestData From Excel    CP139    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${testdata}
    Log    Navigate to New Requisition page to Validate Patient Bill Type
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Doctor Signature    ${SHORT_WAIT}
    Verify Created Order Physician in Doctor Signature Page
    [Teardown]    Run Keywords    Take Screenshot And Close Browsers    Remove Files in Directory

CP_101 Create Patient form Requisition form and search for the same Patient in the new Requisition
    ${testdata}    Read TestData From Excel    CP101    ClientPortal
    ${new_requisition_testdata}    Read TestData From Excel    AC118    NewRequisition
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${testdata}
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
    Create New Requisition To Validate Patient Bill Type    ${new_requisition_testdata}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_138 Verify if test data in ordering physician the data grid
    ${testdata}    Read TestData From Excel    CP138    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Test Step 2: Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Create New Requisition For Sample Id    ${testdata}
    Log    Navigate to New Requisition page to Validate Patient Bill Type
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Doctor Signature    ${SHORT_WAIT}
    Verify Created Order Physician in Doctor Signature Page
    [Teardown]    Take Screenshot And Close Browsers

CP_051 Negative: Create Requisition without mandatory fields
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP051    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Log in as an internal user into LIMSABC. Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 : Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated to "New Order"
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    "Infectious Disease Requisition" Form is Displayed
    Log    Test Step 7:Click on Save button without filling required fields
    Log    Test Step 8:Verify error "Please fill in all required fields"
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 10:Select value for Client site and click on Save button
    Log    Test Step 11:Verify error "Please fill in all required fields"
    Select Client Site    ${testdata}
    Log    Client site-"${testdata}[clientsitetotypeforlocating]" is selected
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 12:Select value for Ordering Physician and click on Save button
    Log    Test Step 13:Verify error "Please fill in all required fields"
    Select Order Physician    ${testdata}
    Log    "${test_data}[orderphysician_name]" is selected
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 14:Select value for Contact and click on Save button
    Log    Test Step 15:Verify error "Please fill in all required fields"
    Select Site Contact    ${testdata}
    Log    "${testdata}[site_contact_name]" is selected
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 16:Select value for Patient and click on Save button
    Log    Test Step 17:Verify error "Please fill in all required fields"
    Input All Fields in Create New Patient Page    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 18:Select value for Syndromic filter and click on save button
    Log    Test Step 19:Verify error "Please select at least one Panel"
    Click and Select Syndromic Menu Filter Category    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[panel_error_message]    ${MEDIUM_WAIT}
    Log    "Please select at least one Panel" error is displayed and requisition is not created
    Log    Test Step 20:Select Panel and click on save button
    Log    Test Step 21:Verify error "Please select the Sample source(s)"
    Click On The Element    ${button.create_new_requisition.syndromic_menu_filter.pnuemonia_disease_category}    Bacterial_Puenomonia    ${LONG_WAIT}
    Click On The Element    ${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.baumanii}    Syndromic menu filter subcategory    ${LONG_WAIT}
    Save Activity    ${button.new_requisition.save}    ${testdata}[sample_name_error_message]    ${MEDIUM_WAIT}
    Log    "Please select the Sample source(s)" error is displayed and requisition should is not created
    Log    Test Step 24:Select Panel and click on save button
    Log    Test Step 25:Verify error "Please select the collection date for each collected sample"
    Click On The Element    ${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}    Swab site dropdown    ${LONG_WAIT}
    ${swap_site_category}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[swap_site_category]
    Click On The Element    ${swap_site_category}    Syndromic menu filter    ${LONG_WAIT}
    Save Activity    ${button.new_requisition.save}    ${testdata}[collection_dates_error_message]    ${MEDIUM_WAIT}
    Log    "Please select the collection date for each collected sample" error is displayed and requisition is not created"
    Log    Test Step 22:Select value for ICD and click on Save button
    Log    Test Step 23:Verify error "Please select the sample source(s)"
    Select Updated Ics Code    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[collection_dates_error_message]    ${MEDIUM_WAIT}
    Log    "Please select the collection date for each collected sample" error is displayed and requisition is not created"
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_069 Negative: Create Covid Only Requisition without mandatory fields
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP069    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Log in as an internal user into LIMSABC. Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 : Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated to "New Order"
    Log    Test Step 6:Select COVID Only Requisition
    Navigate To New Order Sub Menu    COVID Only
    Log    "COVID Only Requisition" Form is Displayed
    Log    Test Step 7:Click on Save button without filling required fields
    Log    Test Step 8:Verify error "Please fill in all required fields"
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 10:Select value for Client site and click on Save button
    Log    Test Step 11:Verify error "Please fill in all required fields"
    Select Client Site    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 12:Select value for Ordering Physician and click on Save button
    Log    Test Step 13:Verify error "Please fill in all required fields"
    Select Order Physician    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 14:Select value for Contact and click on Save button
    Log    Test Step 15:Verify error "Please fill in all required fields"
    Select Site Contact    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Log    Test Step 16:Select value for Patient and click on Save button
    Log    Test Step 17:Verify error "Please fill in all required fields"
    Input All Fields in Create New Patient Page    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[panel_error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and requisition is not created
    Select Race And Ethnicity For Patient    ${testdata}
    Provide Patient Address    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[panel_error_message]    ${MEDIUM_WAIT}
    Log    "Please select at least one Panel" error is displayed and requisition is not created
    Log    Test Step 18:Select Panel and click on save button
    Log    Test Step 19: Verify error "Please select the Sample source(s)"
    Click On The Element    ${checkbox.create_new_requisition.covid_only}    Covid disease checkbox    ${SHORT_WAIT}
    Save Activity    ${button.new_requisition.save}    ${testdata}[sample_name_error_message]    ${MEDIUM_WAIT}
    Log    "Please select the Sample source(s)" error is displayed and requisition should is not created
    Log    Test Step 20: Select value for Swab Site and click on Save button
    Log    Test Step 21: Verify error "Please select the collection date for each collected sample"
    Click On The Element    ${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}    Swab site dropdown    ${LONG_WAIT}
    ${swap_site_category}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[swap_site_category]
    Click On The Element    ${swap_site_category}    Syndromic menu filter    ${LONG_WAIT}
    Save Activity    ${button.new_requisition.save}    ${testdata}[collection_dates_error_message]    ${MEDIUM_WAIT}
    Log    "Please select the collection date for each collected sample" error is displayed and requisition is not created
    Log    Test Step 22: Select value for ICD and click on Save button
    Log    Test Step 23: Verify error "Please select the collection date for each collected sample"
    Select Updated Ics Code    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[collection_dates_error_message]    ${MEDIUM_WAIT}
    Log    "Please select the collection date for each collected sample" error is displayed and requisition is not created
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_70 Negative: Create New patient without mandatory fields from New Requisition
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP070    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Log in as an internal user into LIMSABC. Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 & 4 : Goto Quick Menu and Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Navigated to "New Order"
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    "Infectious Disease Requisition" Form is Displayed
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    Client site-"${testdata}[clientsitetotypeforlocating]" is selected
    Select Order Physician    ${testdata}
    Log    "${test_data}[orderphysician_name]" is selected
    Log    Test Step 8:Click on Create new patient
    Log    Test Step 9:Click on Save button without entering required fields
    Log    Test step 10:Verify error "Please fill in all required fields"
    ${create_new_patient_locator}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    patient
    Click On The Element    ${create_new_patient_locator}    Create New Patient    ${LONG_WAIT}    seleniumClick
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and Patient is not created.
    Log    Test step 11:Select "Bill type" and click on Save button
    Log    Test step 12:Verify error "Please fill required field"
    Click On The Element    ${textbox.new_requisition.create_new_patient.patient_bill_category}    Bill_Category    ${LONG_WAIT}
    ${patient_bill_dropdown}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    ${testdata}[patient_bill]
    Click On The Element    ${patient_bill_dropdown}    Patient_Bill    ${LONG_WAIT}
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and Patient is not created.
    Log    Test Step 13:Select "First Name" and click on Save button
    Log    Test Step 14:Verify error "Please fill required field"
    ${patient_name}    Set Variable    ${testdata}[patient_first_name]    ${testdata}[patient_last_name]
    Set Global Variable    ${patient_name}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.first_name}    ${LONG_WAIT}    Patient first name textbox is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${textbox.new_requisition.create_new_patient.first_name}    ${patient_name}[0]
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and Patient is not created.
    Log    Test Step 15:Select "Last Name" and click on Save button
    Log    Test Step 16:Verify error "Please fill required field"
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.last_name}    ${LONG_WAIT}    Patient first name textbox is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${textbox.new_requisition.create_new_patient.last_name}    ${patient_name}[1]
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and Patient is not created.
    Log    Test Step 17:Select future date for "Date of Birth" and click on Save button
    Log    Test Step 18:Verify error "Date of birth should be less than current date"
    ${date}    Get Future Date
    Input Text    ${textbox.new_requisition.create_new_patient.DOB}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Save Activity    ${button.new_requisition.save}    ${testdata}[patient_dob_error_message]    ${MEDIUM_WAIT}
    Log    "Date of birth should be less than current date" error is displayed and Patient is not created.
    Log    Test Step 19:Select "Date of Birth" which is less than current date and click on Save button
    Log    Test Step 20:Verify error "Please fill required field"
    ${date}    Get 2 Days Previous Date
    Input Text    ${textbox.new_requisition.create_new_patient.DOB}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    "Please fill in all required fields" error is displayed and Patient is not created.
    Log    Test Step 21:Select "Gender" and click on Save button"
    Click On The Element    ${textbox.new_requisition.create_new_patient.select_gender}    Gender    ${LONG_WAIT}
    ${select_gender_option}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[gender]
    Click On The Element    ${select_gender_option}    Gender_option    ${LONG_WAIT}
    Perform Actions    Save    ${MEDIUM_WAIT}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_115 Verify if the user is able to save the requisition when save the mothers age is given less than sons age.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP115    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Launch HealthTrack Rx URL.
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Enter credentials and sign in.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Click on Client Portal and click on pending lab works.
    Navigate to Module And Tab    Client Portal    Pending Lab Work
    Log    Navigated to "Client Portal Pending Lab Work" page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4:Select any one requisition ID and click on requisition details.
    Log    Test Step 5:Click on requisition details.
    Navigate to Insurance Page and Select Bill Type in Client Portal
    Log    Test Step 6:Change Insurance Guarantor Relationship to "Mother" and Fill all the required fields.
    Log    Test Step 7:Enter Mother DOB less than Son's DOB by one year.
    Edit Requisition Details In Insurance Tab in Client Portal    ${testdata}
    Log    Test Step 8:Click on Save and update the patient Button.
    Perform Actions    Save and Update the Patient    ${LONG_WAIT}
    Verify Text Message    Verify Patient DOB    ${LONG_WAIT}
    Log    "Verify Patient DOB" is displayed when mothers age is given less than son' age.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_046 Validate creation of Patient with Bill Type "Financial hardship" from client portal requisition form for Infectious Disease
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP046    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to "Infectious Disease" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Create new patient
    Log    Test Step 9:Select "Financial hardship" for bill type
    Log    Test Step 10:Select first name nad last name
    Log    Test Step 11:DOB and Gender
    Log    Test Step 12:Address and phone number
    Log    Test Step 13:Click on Save Button
    Create Patient with Patient Portal Bill Type    ${testdata}
    Log    Patient is created with bill type "Financial hardship"
    Log    Test Step 14:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Log    "${testdata}[syndromic_filter_category]" is selected with the Swab Site Category of "${testdata}[swap_site_category]"
    Select Updated Ics Code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Save Requisition
    Log    Test Step 15:Click the Collector Acknowledgement Box identified by the language labeling it
    Click Provider Acknowledgement Button
    Log    Collector Acknowledgement Box is Clicked
    Log    Test Step 16:Click on confirm Requisition
    Confirm Requisition
    Log    Requisition is created with new patient and bill type "Financial hardship"
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 17:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 18:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_047 Validate creation of Patient with bill type "Medicaid" from client portal requisition form for Infectious Disease
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP047    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to "Infectious Disease" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Create new patient
    Log    Test Step 9:Select "Medicaid" for bill type
    Log    Test Step 10:Select first name and last name
    Log    Test Step 11:DOB and Gender
    Log    Test Step 12:Fill Address and phone number
    Log    Test Step 13:Fill Guarantor EmailID and Phone number
    Log    Test Step 14:Guarantor Relationship and first name and last name
    Log    Test Step 15:DOB and Gender and Address
    Log    Test Step 16:Primary insurance and Primary relationship to insure
    Log    Test Step 17:Primary Insured first name and last name
    Log    Test Step 18:DOB and Gender
    Log    Test Step 19:Address and policy number
    Log    Test Step 20:Click on Save Button
    Create Patient with Medicaid Bill Type    ${testdata}
    Log    ER 1:Patient is created with bill type "Medicaid"
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Log    "${testdata}[syndromic_filter_category]" is selected with the Swab Site Category of "${testdata}[swap_site_category]"
    Select Updated Ics Code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Save Requisition
    Log    Test Step 21:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 22:Click the Collector Acknowledgement Box identified by the language labeling it
    Click Provider Acknowledgement Button
    Log    Collector Acknowledgement Box is Clicked
    Log    Test Step 23:Click on confirm Requisition
    Confirm Requisition
    Log    ER 2:Requisition is created with new patient and bill type "Medicaid"
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 24:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 25:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    ER 3:Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_040 Validate creation of Infectious Disease requisition with Existing patient and Collector acknowledgement
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP040    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to "Infectious Disease" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Select Existing Patient Details
    Select Existing Patient    ${testdata}
    Log    Patient Name of Value- "${testdata}[patient_name]" is selected
    Log    Test Step 9:Fill all the required fields.
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Log    "${testdata}[syndromic_filter_category]" is selected with the Swab Site Category of "${testdata}[swap_site_category]"
    Select Updated Ics Code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Log    Test Step 10:Click on Save Button
    Log    Test Step 11:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 12:Click the Collector Acknowledgement Box identified by the language labeling it
    Log    Test Step 13:Verify Doctor Signature is not present
    Verify Doctor Signature Label in Collector Acknowledgement
    Log    Collector Acknowledgement Box is Clicked
    Log    Verified that Doctor signature is not present on the Acknowledgement page
    Log    Test Step 14:Click on confirm Requisition
    Confirm Requisition
    Log    Requisition is created
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 15:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 16:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_066 Validate creation of Patient with Bill Type "Client Bill" from client portal requisition form for Covid Only
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP066    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select "COVID Only" Requisition
    Navigate To New Order Sub Menu    COVID Only
    Log    Navigated to "COVID Only" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Click on Create new patient
    Log    Test Step 9:Select "Client Bill" for bill type and fill all the required fields.
    Log    Test Step 10:Click on Save Button
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Patient is created with bill type "Client Bill".Created Patient Name- "${patient_name}" with Bill_Type of Value- "${testdata}[patient_bill]"
    Log    Test Step 11:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Select Covid Disease Category and Swap Site    ${testdata}
    Log    "${testdata}[syndromic_filter_category]" is selected with the Swab Site Category of "${testdata}[swap_site_category]"
    Provide Patient Address    ${testdata}
    Log    "${test_data}[patient_adress]" is selected
    Select Updated Ics Code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 12:Click the Collector Acknowledgement Box identified by the language labeling it
    Click Provider Acknowledgement Button
    Log    Collector Acknowledgement Box is Clicked
    Log    Test Step 13:Click on confirm Requisition
    Confirm Requisition
    Log    Requisition is created with new patient"${patient_name}" and bill type "Client Bill"
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 14:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 15:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_095 Negative: Complete Requisition by creating Ordering Physician without Doctor Signature
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP095    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to "Infectious Disease" Page
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Log    Test Step 7:Click on Create new Ordering Physician
    Log    Test Step 8:Fill all required fields
    Log    Test Step 9:Click on save button
    Create New Order Physician and Verify    ${testdata}
    Log    "Ordering Physician" is created
    Log    Test Step 10:Fill all required fields on create Requisition form
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Created Patient Name- "${patient_name}" with Bill_Type of Value- "${testdata}[patient_bill]"
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Log    "${testdata}[syndromic_filter_category]" is selected with the Swab Site Category of "${testdata}[swap_site_category]"
    Log    Test Step 11:Click on Save
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 12:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 13:Click the Provider/Delegate Acknowledgement Box identified by the language labeling it
    Log    Test Step 14:Do not Add Doctor Signature on the acknowledgement page
    Click Provider Acknowledgement Button
    Log    "Provider acknowledgement" button is clicked
    Log    Test Step 15:Click on confirm Requisition
    Confirm Requisition
    Log    Confirmed the requisition***
    Log    Test Step 16:Requisition should not be created without Doctor Signature
    Verify Text Message    Signature(s) required    ${MEDIUM_WAIT}
    Log    "Signature(s) required" error is displayed and requisition is not created
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_043 Negative: Validate Error while creation of Covid Only requisition with invalid Date of Symptoms
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP043    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an inter user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on "New Order Page"
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    "Infectious Disease" Page is Displayed
    Log    Test Step 7:Select 'Facility Demo, LLC' for client site and 'Physician demonstration' for ordering physician
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Select Order Physician    ${testdata}
    Log    Selected ${test_data}[orderphysician_name] as client site
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Created Patient Name- "${patient_name}" with Bill_Type of Value- "${testdata}[patient_bill]"
    Click and Select Syndromic Menu Filter Category    ${testdata}
    Log    Selected ${testdata}[syndromic_filter_category]
    Log    Test Step 8:Select COVID-19 Coronavirus from Special Target
    Log    Selected COVID-19 Coronavirus from Special Target
    Log    Test Step 9:Fill all the required fields.
    Select Covid-19 Category in Infectious Disease    ${testdata}
    Log    Selected COVID-19 Coronavirus from Special Target
    Log    Test Step 10:Click on AOE button(Bottom right to the screen)
    Click AOE Button
    Log    "AOE" button is clicked
    Log    Test Step 11:Fill all the required fields and select Covid-19 Symptoms Yes
    Select Covid-19 Symptoms Option in AOE    Yes
    Log    "Yes" Option is Clicked
    Log    Test Step 12:Select Future Date for Date of Symptom onset and Verify "Date can not be in future error"
    Select Future Date for Covid-19 Symptoms and Verify
    Log    "Date can not be in future" error is displayed for future date
    Log    Test Step 13:Select Older date which older than 60 days for Date Of Symptoms onset and Verify "Date can not be older than 60 days" error
    Select Previous Date for Covid-19 Symptoms and Verify
    Log    "Date can not be older than 60 days" error is displayed for 60 days older date
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_003 Create, complete new requisition as provider and verify that no records are displayed under Reviewed critical tab_Provider/Delegate Box
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP003    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to "Infectious Disease" Page
    Log    Test Step 7:Fill all the required fields.
    Log    Test Step 8:Click on Save Button
    Log    Test Step 9:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 10:Click the Provider/Delegate Acknowledgement Box identified by the language labeling it
    Log    Test Step 11:Save Requisition.
    Create New Requisition    ${testdata}    infectious_syndromic_menu
    Log    Read Data From PDF For Sample ID
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is received from PDF
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 12:Check Accessioning module to make sure exception has not created for case.
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" module
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in Accessioning
    Log    Test Step 13:Click on Details Icon. Check for Errors in Errors Tab
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Errors
    Log    Navigated to "${sample_id}-Errors" page
    Verify Message    //div[contains(@id,"view_accessioning_error")]//div[text()="No Records Found"]    ${MEDIUM_WAIT}
    Log    "No Records found" is displayed
    Log    Test Step 14:Click on Exception
    Navigate to Module And Tab    Exceptions    Reviewed Critical
    Log    Navigated to "Exceptions Reviewed Critical" Tab
    Log    Test Step 15:Exception should resolve automatically, and the exception case should not visible under the Reviewed critical tab.
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in Exceptions Reviewed Critical Page
    Verify Message    ${message.result_review.no_record_found}    ${MEDIUM_WAIT}
    Log    "No Records Found" is displayed
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_005 Create, complete new requisition as provider and verify that no records are displayed under On Hold Ready_Provider/Delegate Box
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP005    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to "Infectious Disease" Page
    Log    Test Step 7:Fill all the required fields.
    Log    Test Step 8:Click on Save Button
    Log    Test Step 9:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 10:Click the Provider/Delegate Acknowledgement Box identified by the language labeling it
    Log    Test Step 11:Save Requisition.
    Create New Requisition    ${testdata}    infectious_syndromic_menu
    Log    Requisition is Created
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is received from PDF
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 12:Check Accessioning module to make sure exception has not created for case.
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" module
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in Accessioning
    Log    Test Step 13:Click on Details Icon. Check for Errors in Errors Tab
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Errors
    Log    Navigated to "${sample_id}-Errors" page
    Verify Message    //div[contains(@id,"view_accessioning_error")]//div[text()="No Records Found"]    ${MEDIUM_WAIT}
    Log    "No Records found" is displayed
    Log    Test Step 14:Click on Exception
    Navigate to Module And Tab    Exceptions    On-Hold Ready
    Log    Navigated to "Exceptions On-Hold Ready" Tab
    Log    Test Step 15:Exception should resolve automatically, and the exception case should not visible under the On Hold Ready.
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in Exceptions On-Hold Ready page.
    Verify Message    ${message.result_review.no_record_found}    ${MEDIUM_WAIT}
    Log    "No Records Found" is displayed
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_042 Validate creation of Covid Only requisition with Existing patient and Collector acknowledgement
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP042    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select "COVID Only" Requisition
    Navigate To New Order Sub Menu    COVID Only
    Log    Navigated to "COVID Only" Page
    Log    Test Step_7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8.Select Existing Patient Details
    Select Existing Patient    ${testdata}
    Log    Patient Name- "${testdata}[patient_name]" is selected
    Log    Test Step 9:Fill all the required fields.
    Log    Test Step 10:Select COVID-19 Coronavirus from Special Target.
    Select Covid Disease Category and Swap Site    ${testdata}
    Log    "${testdata}[syndromic_filter_category]" is selected with the Swab Site Category of "${testdata}[swap_site_category]"
    Provide Patient Address    ${testdata}
    Log    "${test_data}[patient_adress]" is selected
    Select Updated Ics Code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Log    Test Step 11:Click on AOE button(Bottom right to the screen)
    Click AOE Button
    Log    "AOE" button is clicked
    Log    Test Step 12:Fill all the required fields and select Covid-19 Symptoms No.
    Log    Test Step 13:Click on Done button
    Covid-19 Symptoms Yes or No in AOE    No
    Log    Test Step 14:Click on Save Button.
    Log    Test Step 15:Complete requisition form to the stage where the acknowledgement checkbox must be selected.
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 16:Click the Collector Acknowledgement Box identified by the language labeling it.
    Log    Test Step 17:Verify Doctor Signature is not present.
    Verify Doctor Signature Label in Collector Acknowledgement
    Log    Collector Acknowledgement Box is Clicked
    Log    Verified that Doctor signature is not present on the Acknowledgement page
    Log    Test Step 18:Click on confirm Requisition.
    Confirm Requisition
    Log    Requisition is created with existing Patient name "${testdata}[patient_name]" and with Covid-19 Symptoms No
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 19:Navigate to Accessioning module.
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 20:Search for requisition with sample ID.
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_044 Validate creation of Toxicology requisition with Existing patient and Collector acknowledgement
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP044    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Toxicology Requisition
    Navigate To New Order Sub Menu    Toxicology
    Log    Navigated to "Toxicology" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Select Existing Patient Details
    Select Existing Patient    ${testdata}
    Log    Patient Name of Value- "${testdata}[patient_name]" is selected
    Log    Test Step 9:Fill all the required fields.
    Select Ics Code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Select Medication Code    ${testdata}
    Log    "${testdata}[medication_code]" is selected
    Log    Test Step 10:Select any test from Urine/Blood/Oral
    Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Log    Selected Ketamine As Syndromic Menu Filter Category.
    Perform Actions    SAVE    ${MEDIUM_WAIT}
    Log    Test Step 11:Click on Medical Necessity button(Bottom right to the screen)
    Log    Test Step 12:Fill all the required fields
    Log    Test Step 13:Click on Done button
    Enter Medical Neccesity Fields and Submit    ${testdata}[patientrisklevel]    ${testdata}[receivedfrom]    ${testdata}[medicalneccesitydocumentation]
    Log    Patient risk level of value-"${testdata}[patientrisklevel]" , Received Dateof value- "${testdata}[receivedfrom]" and Medical necessity documentation of value-"${testdata}[medicalneccesitydocumentation]" is selected.
    Log    Test Step 14:Click on Save Button
    Log    Test Step 15:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 16:Click the Collector Acknowledgement Box identified by the language labeling it.
    Log    Test Step 17:Verify Doctor Signature is not present
    Verify Doctor Signature Label in Collector Acknowledgement
    Log    Collector Acknowledgement Box is Clicked
    Log    ER 2:Verified that Doctor signature is not present on the Acknowledgement page
    Log    Test Step 18:Click on confirm Requisition
    Confirm Requisition
    Log    ER 1:Requisition is created with existing Patient
    ${file_path}    Read Data From Pdf
    Remove Files in Directory
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 19:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 20:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    ER 3:Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_049 Validate creation of Patient with bill type "Patient Portal Only" from client portal requisition form for Toxicology
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP049    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Toxicology Requisition
    Navigate To New Order Sub Menu    Toxicology
    Log    Navigated to "Toxicology" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Select any test from Urine/Blood/Oral
    Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Log    Selected Ketamine As Syndromic Menu Filter Category.
    Log    Test Step 9:Create new patient
    Log    Test Step 10:Select "Patient Portal only" for bill type and fill all the required fields
    Create Patient with Patient Portal Bill Type    ${testdata}
    Log    ER 1: Patient Name of Value- "${patient_name}" is created with bill type of value-"${testdata}[patient_bill]"
    Select ICS code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Select Medication Code    ${testdata}
    Log    "${testdata}[medication_code]" is selected
    Perform Actions    SAVE    ${MEDIUM_WAIT}
    Log    Test Step 11:Click on Medical Necessity button(Bottom right to the screen)
    Log    Test Step 12:Fill all the required fields
    Log    Test Step 13:Click on Done button
    Enter Medical Neccesity Fields and Submit    ${testdata}[patientrisklevel]    ${testdata}[receivedfrom]    ${testdata}[medicalneccesitydocumentation]
    Log    Patient risk level of value-"${testdata}[patientrisklevel]" , Received Dateof value- "${testdata}[receivedfrom]" and Medical necessity documentation of value-"${testdata}[medicalneccesitydocumentation]" is selected.
    Log    Test Step 14:Click on Save Button
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 15:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 16:Click the Collector Acknowledgement Box identified by the language labeling it.
    Click Provider Acknowledgement Button
    Log    Collector Acknowledgement Box is Clicked
    Log    Test Step 17:Click on confirm Requisition
    Confirm Requisition
    Log    ER 2:Requisition is created with new patient and bill type "Patient Portal Only"
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 18:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 19:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    ER 3:Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_048 Validate creation of Patient with bill type "Workers compensation" from client portal requisition form for Toxicology
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP048    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Toxicology Requisition
    Navigate To New Order Sub Menu    Toxicology
    Log    Navigated to "Toxicology" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Wait For Spinner To Disappear    ${spinner.locator}
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Select any test from Urine/Blood/Oral
    Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Log    Selected Ketamine As Syndromic Menu Filter Category.
    Log    Test Step 9:Create new patient
    Log    Test Step 10:Select "Workers Compensation" for bill type and fill all the required fields
    Create Patient with Workers Compensation Bill Type    ${testdata}
    Log    ER 1: Patient Name of Value- "${patient_name}" is created with bill type of value-"${testdata}[patient_bill]"
    Select ICS code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Select Medication Code    ${testdata}
    Log    "${testdata}[medication_code]" is selected
    Perform Actions    SAVE    ${MEDIUM_WAIT}
    Log    Test Step 11:Click on Medical Necessity button(Bottom right to the screen)
    Log    Test Step 12:Fill all the required fields
    Log    Test Step 13:Click on Done button
    Enter Medical Neccesity Fields and Submit    ${testdata}[patientrisklevel]    ${testdata}[receivedfrom]    ${testdata}[medicalneccesitydocumentation]
    Log    Patient risk level of value-"${testdata}[patientrisklevel]" , Received Dateof value- "${testdata}[receivedfrom]" and Medical necessity documentation of value-"${testdata}[medicalneccesitydocumentation]" is selected.
    Log    Test Step 14:Click on Save Button
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 15:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 16:Click the Collector Acknowledgement Box identified by the language labeling it.
    Click Provider Acknowledgement Button
    Log    Collector Acknowledgement Box is Clicked
    Log    Test Step 17:Click on confirm Requisition
    Confirm Requisition
    Log    ER 2:Requisition is created with new patient and bill type "Workers compensation"
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 18:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 19:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    ER 3:Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_050 Validate creation of Patient with bill type "medicare" from requisition form Covid only
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP050    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL or Launch Health TrackRX URL
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3:Goto Quick Menu.
    Log    Test Step 4:Click on Client Portal
    Navigate To Main Menu    Client Portal
    Log    Navigated to "Client Portal" Page
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5:Click on New Order
    Navigate To New Order Menu
    Log    Clicked on New Order Menu
    Log    Test Step 6:Select Toxicology Requisition
    Navigate To New Order Sub Menu    Toxicology
    Log    Navigated to "Toxicology" Page
    Log    Test Step 7:Select values for client site and ordering physician
    Wait For Spinner To Disappear    ${spinner.locator}
    Select Client Site    ${testdata}
    Log    ClientSite of Value-"${testdata}[clientsitetotype]" is selected
    Select Order Physician    ${testdata}
    Log    Order Physician of Value-"${test_data}[orderphysician_name]" is selected
    Select Site Contact    ${testdata}
    Log    Site Contact of Value-"${testdata}[site_contact_name]" is selected
    Log    Test Step 8:Select any test from Urine/Blood/Oral
    Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Log    Selected Ketamine As Syndromic Menu Filter Category.
    Log    Test Step 9:Create new patient
    Log    Test Step 10:Select "Medicare" for bill type and fill all the required fields
    Create Patient with Medicare Bill Type    ${testdata}
    Log    ER 1: Patient Name of Value- "${patient_name}" is created with bill type of value-"${testdata}[patient_bill]"
    Select ICS code    ${testdata}
    Log    "${testdata}[icd_code]" is selected
    Select Medication Code    ${testdata}
    Log    "${testdata}[medication_code]" is selected
    Perform Actions    SAVE    ${MEDIUM_WAIT}
    Log    Test Step 11:Click on Medical Necessity button(Bottom right to the screen)
    Log    Test Step 12:Fill all the required fields
    Log    Test Step 13:Click on Done button
    Enter Medical Neccesity Fields and Submit    ${testdata}[patientrisklevel]    ${testdata}[receivedfrom]    ${testdata}[medicalneccesitydocumentation]
    Log    Patient risk level of value-"${testdata}[patientrisklevel]" , Received Dateof value- "${testdata}[receivedfrom]" and Medical necessity documentation of value-"${testdata}[medicalneccesitydocumentation]" is selected.
    Log    Test Step 14:Click on Save Button
    Save Requisition
    Log    "Save" button is clicked
    Log    Test Step 15:Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 16:Click the Collector Acknowledgement Box identified by the language labeling it.
    Click Provider Acknowledgement Button
    Log    Collector Acknowledgement Box is Clicked
    Log    Test Step 17:Click on confirm Requisition
    Confirm Requisition
    Log    ER 2:Requisition is created with new patient and bill type "Medicare"
    ${file_path}    Read Data From Pdf
    Log    "${sample_id}" is Received
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Requisition of "${sample_id}" is Created
    Log    Test Step 18:Navigate to Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Acccessioning" Module
    Log    Test Step 19:Search for requisition with sample ID
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    ER 3:Requisition-"${sample_id}" is displayed in the accessioning module.
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_104 Remove Files on Create Requisition Documents page for Insurance Attached bill type
    ${testdata}    Read TestData From Excel    CP110    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual.
    Log    Test Step 4 : Click on "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5: Click on New Order
    Navigate To New Order Menu
    Log    Test Step 6 : Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Create Requisition With Insurance Attached Patient Bill Type
    Log    Test Step 7 : Select Client site and ordering physician
    Log    Test Step 8 : Create new patient select Bill type "Insurance Attached"
    Log    Test Step 9 : Fill all the required fields.
    Log    Test Step 10 : Click on Save Button
    Log    Test Step 11 : Fill all the required fields.
    Input Mandatory Fields For New Requisition With Patient Bill Type Insurance Attached    ${testdata}
    Log    Test Step 12 : Click on Documents button(bottom right)
    Log    Test Step 13 : Click on Capture and take picture with camera
    Log    Test Step 14 : Upload PDF file
    Log    Test Step 15 : Click on Delete button Delete PDF file and Image from Document page
    Log    Test Step 16 : Click on Done Button
    Validate Delete Documents in Documents Page    ${testdata}
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_108 View the attached documents to the Patient on Create Requisition for insurance attached bill type
    ${testdata}    Read TestData From Excel    CP110    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual.
    Log    Test Step 4 : Click on "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5: Click on New Order
    Navigate To New Order Menu
    Log    Test Step 6 : Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Create Requisition With Insurance Attached Patient Bill Type
    Log    Test Step 7 : Select Client site and ordering physician
    Log    Test Step 8 : Create new patient select Bill type "Insurance Attached"
    Log    Test Step 9 : Fill all the required fields.
    Log    Test Step 10 : Click on Save Button
    Log    Test Step 11 : Fill all the required fields.
    Input Mandatory Fields For New Requisition With Patient Bill Type Insurance Attached    ${testdata}
    Log    Test Step 12 : Click on Documents button(bottom right)
    Log    Test Step 13 : Upload PDF file
    Upload PDF File in Requisitions Documents Page    ${testdata}[file_type]    ${testdata}[file_type_index]
    Log    Test Step 14 : Capture Image and Save
    Capture Image in Documents Page
    Log    Test Step 15 : Click on View button for both PDF and Image
    Select File Type and Perform Save in Documents Page    ${testdata}
    Log    Provide Acknowledgement for Confirming Requisition
    Provide Acknowledgement    ${testdata}
    Log    Confirm Created Requisition
    Confirm Requisition
    Validate Downloaded Image and Pdf Files of Requisition in Local
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

CP_103 Create Requisition with Bill type "Insurance Attached" with Capturing Image
    ${testdata}    Read TestData From Excel    CP110    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3 : Navigate to Quick Manual.
    Log    Test Step 4 : Click on "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step 5: Click on New Order
    Navigate To New Order Menu
    Log    Test Step 6 : Select Infectious Disease Requisition
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Log    Create Requisition With Insurance Attached Patient Bill Type
    Log    Test Step 7 : Select Client site and ordering physician
    Log    Test Step 8 : Create new patient select Bill type "Insurance Attached"
    Log    Test Step 9 : Fill all the required fields.
    Log    Test Step 10 : Click on Save Button
    Log    Test Step 11 : Fill all the required fields.
    Input Mandatory Fields For New Requisition With Patient Bill Type Insurance Attached    ${testdata}
    Log    Test Step 12 : Click on Documents button(bottom right)
    Log    Test Step 13 : Click on Capture and take picture with camera and click on Done button
    Capture Image in Documents Page
    Select File Type and Perform Save in Documents Page    ${testdata}
    Log    Test Step 14 : Complete requisition form to the stage where the acknowledgement checkbox must be selected
    Log    Test Step 15 : Click the Provider/Delegate Acknowledgement Box identified by the language labeling it
    Provide Acknowledgement    ${testdata}
    Log    Test Step 16 : Click on confirm Requisition
    Confirm Requisition
    Log    Test Step 17 : Search for the requisition with sample ID in Pending Lab Work
    Search Requisition To Apply Filter Using Patient Name
