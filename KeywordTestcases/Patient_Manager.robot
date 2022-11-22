*** Settings ***
Resource          ../Global/super.robot

*** Test Cases ***
PM_006 Validate Document View, Download and Delete on Upload Signature Page from Patient Manager:Hamburger menu
    [Setup]
    Log    Read test data from excel file
    ${environment_data}    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Refuse Alert for Notifications of News
    Log    Navigate to Patient Signature Page
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Verify Admin Able to Upload Signature and Delete
    Validate Upload Signature in Patient Manager Module
    [Teardown]    Run Keywords    Remove Files in Directory    Take Screenshot And Close Browsers

PM_010 Add Site to the Patient from Patient manager : Sites
    [Setup]
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM010    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Refuse Alert for Notifications of News
    Log    Navigate to Patient Signature Page
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Validate Patient Manager Page and Click on Details
    Navigate to Patient Manager Details Sub-Menu    Sites
    Verify Admin is Able to Add Site in Patient Manager    ${testdata}

PM_048_Download Requisitions From Patient Manager Requisitions
    Log    Step_1.Open URL
    Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    Step_2_E: Login to HealthTrackRx with credentials
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Step_2_A: User is navigated to home page
    Log    Handiling the push popup message
    Refuse Alert for Notifications of News
    Log    Step_3_E:Navigate to Patient Manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Step_3_A:User is navigated to Patient Manager module
    Log    Navigate to Patient name search bar tab
    Search The Patient Name From Patient Manager Search Bar
    Log    Step 4_E:Select any one patient and Click on Details tab
    Get First Patient Name Details From Patient Manager
    Log    Step 4_A:Selected patient details should be displayed
    Log    Step 5_E:Click on Requisitions tab and select Requisition
    Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Step 5_A:Patient requisition details should be displayed
    Log    Step 6_E:Click and Download button
    Click On Download PDF From Patient Manager
    Log    Step 6_A:User should be able to download Requisition PDF from Patient

PM_049_Validate Reports Requisition From Patient Manager Requisitions
    Log    Step_1.Open URL
    common.Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    Step_2_E:Login to HealthTrackRx with credentials
    common.Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Step_2_A: User is navigated to home page
    Log    Handiling the push popup message
    Refuse Alert for Notifications of News
    Log    Step_3_E:Navigate to Patient Manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Step_3_A:User is navigated to Patient Manager module
    Log    Navigate to Patient name search bar tab
    Search The Patient Name From Patient Manager Search Bar
    Log    Step 4_E:Select any one patient and Click on Details tab
    Get First Patient Name Details From Patient Manager
    Log    Step 4_A:Selected patient details should be displayed
    Log    Step 5_E:Click on Requisitions tab and select Requisition
    Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Step 5_A:Patient requisition details should be displayed
    Log    Step 6_E:Hamburger menu and Click on Reports button adn Verify reports is displayed
    Click On Hamburger Menu Repoers From Patient Manager
    Log    Step 6_A:User able to view Reports

PM_050_Validate Zip & Download Requisition Details From Patient Manager Requisitions
    Log    Step_1.Open URL
    common.Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    Step_2_E: Login to HealthTrackRx with credentials
    common.Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Step_2_A: User is navigated to home page
    Log    Handiling the push popup message
    Refuse Alert for Notifications of News
    Log    Step_3_E:Navigate to Patient Manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Step_3_A:User is navigated to Patient Manager module
    Log    Navigate to Patient name search bar tab
    Search The Patient Name From Patient Manager Search Bar
    Log    Step 4_E:Select any one patient and Click on Details tab
    Get First Patient Name Details From Patient Manager
    Log    Step 4_A:Selected patient details should be displayed
    Log    Step 5_E:Click on Requisitions tab and select Requisition
    Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Step 5_A:Patient requisition details should be displayed
    Log    Step 6_E:Click on ZIp & Download button
    Click On ZIP Download From Patient Manager
    Log    Step 6_A:User should be able to Zip & Download

PM_051_Validate Document View, Download and Delete on Upload Attachments From Patient Manager Attachments
    Log    Step_1.Open URL
    common.Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    Step_2_E: Login to HealthTrackRx with credentials
    common.Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Step_2_A: User is navigated to home page
    Log    Handiling the push popup message
    Refuse Alert for Notifications of News
    Log    Step_3_E:Navigate to Patient Manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Step_3_A:User is navigated to Patient Manager module
    Log    Navigate to Patient name search bar tab
    Search The Patient Name From Patient Manager Search Bar
    Log    Step 4_E:Select any one patient and Click on Details tab
    Get First Patient Name Details From Patient Manager
    Log    Step 4_A:Selected patient details should be displayed
    Log    Navigate to patient manager details
    Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Step 5_E:Click on Attachments tab
    Click On Attachments From Patient Manager
    Log    Step 5_A: User should be able to attachments tab
    Log    Step 6_E:Click on Click on Upload button
    Click On Upload Button From Patient Manager
    Log    Step 6_A: User should be able to Upload tab
    Log    Step 7_E:Click on Choose file and Upload
    Wait for The Element to be Visible    ${button.patient.manager.upload.file}    Upload File    ${LONG_WAIT}
    Choose File    ${button.patient.manager.upload.file}    ${upload_file_path_in_clientportal_for_view_document}
    Log    Step 7_A: User should be able to file Upload tab
    Log    Step 8_E:Click on Download button
    Click On Download Attachments From Patient Manager
    Log    Step 8_A: User should be able to download Requisition PDF from Patient
    Log    Step 9_E:Click on View button
    Click on Attachment View Button From Patient Manager
    Log    Step 9_A: User should be able to Verify Document is opened for view
    Log    Step 10_E:Click on Delete button
    Click On Attachments Delete From Patient Manager
    Log    Step 10_A: User should be able to verify Document is Deleted

PM_053_Delete Attachments from Patient From Patient Manager Attachments
    ${testdata}    Read TestData From Excel    PM053    Patient_Manager
    Log    Step_1.Open URL
    common.Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    Step_2_E: Login to HealthTrackRx with credentials
    common.Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Step_2_A: User is navigated to home page
    Log    Handiling the push popup message
    Refuse Alert for Notifications of News
    Log    Step_3_E:Navigate to Patient Manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Step_3_A:User is navigated to Patient Manager module
    Log    Navigate to Patient name search bar tab
    Search The Patient Name From Patient Manager Search Bar
    Log    Step 4_E:Select any one patient and Click on Details tab
    Get First Patient Name Details From Patient Manager
    Log    Step 4_A:Selected patient details should be displayed
    Log    Navigate to patient manager details
    Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Step 5_E:Click on Attachments tab
    Click On Attachments From Patient Manager
    Log    Step 5_A: User should be able to attachments tab
    Log    Navigate to Upload button
    Click On Upload Button From Patient Manager
    Log    Navigate to Choose file and Upload
    Click On Choose File From Patient Manager    ${testdata}
    Log    Navigate to file delete button
    Click On Attachments Delete From Patient Manager

PM_055_Negative: Upload Attachment_Without Selecting Attachment To Patient_Attachments
    Log    Step_1.Open URL
    common.Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    Step_2_E: Login to HealthTrackRx with credentials
    common.Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Step_2_A: User is navigated to home page
    Log    Handiling the push popup message
    Refuse Alert for Notifications of News
    Log    Step_3_E:Navigate to Patient Manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Step_3_A:User is navigated to Patient Manager module
    Log    Navigate to Patient name search bar tab
    Search The Patient Name From Patient Manager Search Bar
    Log    Step 4_E:Select any one patient and Click on Details tab
    Get First Patient Name Details From Patient Manager
    Log    Step 4_A:Selected patient details should be displayed
    Log    Navigate to patient manager details
    Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Step 5_E:Click on Attachments tab
    Click On Attachments From Patient Manager
    Log    Step 5_A: User should be able to attachments tab
    Log    Step 6_E:Click on Click on Upload button
    Click On Upload Button From Patient Manager
    Log    Step 6_A: User should be able to Upload tab
    Log    Step 7.Without upload attachment click on save button
    Click On Save Button From Patient Manager

PM_057_Validate View Document From Patient Manager Attachments
    ${testdata}    Read TestData From Excel    PM053    Patient_Manager
    Log    Step_1.Open URL
    common.Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    Step_2_E: Login to HealthTrackRx with credentials
    common.Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Step_2_A: User is navigated to home page
    Log    Handiling the push popup message
    Refuse Alert for Notifications of News
    Log    Step_3_E:Navigate to Patient Manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Step_3_A:User is navigated to Patient Manager module
    Log    Navigate to Patient name search bar tab
    Search The Patient Name From Patient Manager Search Bar
    Log    Step 4_E:Select any one patient and Click on Details tab
    Get First Patient Name Details From Patient Manager
    Log    Step 4_A:Selected patient details should be displayed
    Log    Navigate to patient manager details
    Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Step 5_E:Click on Attachments tab
    Click On Attachments From Patient Manager
    Log    Step 5_A: User should be able to attachments tab
    Log    Navigate Click on Click on Upload button
    Click On Upload Button From Patient Manager
    Log    Navigate to User should be able to Upload tab
    Log    Navigate to Choose file and Upload
    Click On Choose File From Patient Manager    ${testdata}
    Log    Navigate to click on save button
    Click On Save Button From Patient Manager
    Log    Step 6_E:Click on view document
    Click On Attachments View Document From Patient Manager    ${test_data_file_name}    ${test_data_file_name}
    Log    Step 6_A: User able to view the document

PM_001 Create new Patient from Patient Manager
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM001    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Test Step 4:Click add Patient
    Navigate to Patient Manager Add Patient Page
    Log    "Add Patient" is Clicked
    Log    Test Step 5:Fill all mandatory fields and Click on save button
    Create New Patient in Patient Manager    ${testdata}
    Log    Test Step 6:Search for newly created Patient on Search bar
    Search Patient Name in Search Bar in Patient Manager    ${testdata}
    Log    Test Step 7:Verify Patient is displayed
    Verify Text Message    ${testdata}[first_name] ${testdata}[last_name]    ${MEDIUM_WAIT}
    Log    "${testdata}[first_name] ${testdata}[last_name]" is displayed
    Log    New Patient is Created
    [Teardown]    Take Screenshot And Close Browsers

PM_061 Negative: Edit Details of Patient without entering mandatory fields from patient manager Module
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM061    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Test Step 7:Click on Edit icon left to the patient
    Edit First Patient in Patient Manager
    Log    "Edit" button is clicked
    Log    Test Step 8:Enter empty values for mandatory fields and click on save button
    Log    Test Step 9:Verify error" is a mandatory fields" is displayed
    Edit First Patient Details in Patient Manager and Validate Error
    Log    Verifed thet Details not saved with blank values in mandatory fields
    [Teardown]    Take Screenshot And Close Browsers

PM_018 Delete Medication of Patient from Patient Manager->Medication
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM018    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL.Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Login to HealthTrackRx with credentials .Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Navigated to "Patient Manager" page
    Log    Test Step 4:Select any one Patient
    Log    Test Step 5:Click on Details Button
    Validate Patient Manager Page and Click on Details
    Log    "Details" button is clicked
    Log    Test Step 6:Click on Medication Tab
    Navigate to Patient Manager Details Sub-Menu    Medication
    Log    Medication Tab is Displayed
    ${medicate_name}    Validate Medication Page and Add Medication    ${testdata}[medication_name]
    Log    Test Step 7: Click on Hamburger menu and click on delete button
    Log    Test Step 8: Click on "No" button on confirmation page and verify Patient is not deleted
    Delete First Medication in Details Medication page    No
    Page should contain    ${medicate_name}
    Log    Verified that Medication- "${medicate_name}" is not deleted
    Log    Test Step 9: Click on "Yes" button on confirmation page and verify Patient is Deleted
    Delete First Medication in Details Medication page    Yes
    Wait For Spinner To Disappear    ${spinner.locator}
    Verify Text Message    ${testdata}[error_message]    ${LONG_WAIT}
    Page Should Not Contain    ${medicate_name}
    Log    ER_1:Verified that the Medication-"${medicate_name}" is removed
    [Teardown]    Take Screenshot And Close Browsers

PM_019 Edit Medication from Patient manager Module->Medication
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM019    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL.Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Login to HealthTrackRx with credentials.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Navigated to "Patient Manager" page
    Log    Test Step 4:Select any one Patient
    Log    Test Step 5:Click on Details Button
    Validate Patient Manager Page and Click on Details
    Log    "Details" button is clicked
    Log    Test Step 6:Click on Medication Tab
    Navigate to Patient Manager Details Sub-Menu    Medication
    Log    Medication Tab is Displayed
    ${add_medicate_name}    Split String    ${testdata}[medication_name]    |
    ${medicate_name}    Validate Medication Page and Add Medication    ${add_medicate_name}[0]
    Log    Test Step 7:Click on Edit icon left to the Medication
    Log    Test Step 8:Change Medication
    Log    Test Step 9:Click on Save button
    Edit First Medication in Details Medication Page    ${add_medicate_name}[1]    positive validation
    Log    Medicate name-"${add_medicate_name}[1]" is replaced with"${add_medicate_name}[0]"
    Log    Test Step 10:Verify Medication is updated
    Page Should Contain    ${add_medicate_name}[1]
    Log    ER_1:Verified with the Updated Medication."${add_medicate_name}[1]" is displayed
    ${medication_page_title validation}    Run Keyword And Return Status    Page Should Contain    Medication
    Log    "${medication_page_title validation}"
    Delete First Medication in Details Medication page    Yes
    [Teardown]    Take Screenshot And Close Browsers

PM_020 Negative: Add Medication to the Patient without selecting Medication from Patient manager -> Medication
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM020    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Open URL. Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Login to HealthTrackRx with credentials.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Navigated to "Patient Manager"
    Log    Test Step 4:Select any one Requisition and Click on Details tab
    Validate Patient Manager Page and Click on Details
    Log    Details button is clicked
    Log    Test Step 5:Click on Medication tab
    Log    Test Step 6:Click and Add button
    Log    Test Step 7:Without selecting Medication and click on Save button
    Save Medication without Adding Medication type
    Log    Save button is clicked without selecting Medication
    Log    Test Step 8:Verify error "medication is a mandatory field"
    Verify Text Message    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    ER_1: Verified that the User is not being able to Add empty Medication to Patient
    [Teardown]    Take Screenshot And Close Browsers

PM_021 Negative: Edit Medication from Patient manager Module->Medication
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM021    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL.Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Login to HealthTrackRx with credentials.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Navigated to "Patient Manager" page
    Log    Test Step 4:Select any one Patient
    Log    Test Step 5:Click on Details Button
    Validate Patient Manager Page and Click on Details
    Log    "Details" button is clicked
    Log    Test Step 6:Click on Medication Tab
    Navigate to Patient Manager Details Sub-Menu    Medication
    Log    Medication Tab is Displayed
    ${medicate_name}    Validate Medication Page and Add Medication    ${testdata}[medication_name]
    Log    "${testdata}[medication_name]" is added
    Log    Test Step 7:Click on Edit icon left to the Medication
    Log    Test Step 8:Remove Medication
    Log    Test Step 9:Click on Save button
    Edit First Medication in Details Medication Page    ${testdata}[medication_name]    negative validation
    Log    Test Step 10:Verify Empty Medication not added
    Verify Text Message    ${testdata}[error_message]    ${LONG_WAIT}
    Log    ER_1: Verified that the "${testdata}[error_message]" is displayed.User is not being able to add empty medication to patient
    Click on The Element    ${button.cross(x)}    page_close    ${LONG_WAIT}
    Delete First Medication in Details Medication page    Yes
    [Teardown]    Take Screenshot And Close Browsers

PM_056 Negative: Edit attachment from Patient manager Module-> Attachments
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM056    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1:Open URL.Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Login to HealthTrackRx with credentials.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Navigated to "Patient Manager" page
    Log    Test Step 4:Select any one Patient
    Log    Test Step 5:Click on Details Button
    Validate Patient Manager Page and Click on Details
    Log    "Details" button is clicked
    Log    Test Step 6:Click on Attachments Tab
    Navigate to Patient Manager Details Sub-Menu    Attachments
    Log    Attachments page is Displayed
    Upload File with File Type in View Documents and Save    ${testdata}    ${upload_file_path_in_clientportal_for_view_document}
    Log    File with path-"${upload_file_path_in_clientportal_for_view_document}" is uploaded into attachments
    Log    Test Step 7:Click on Edit icon left to the attachments
    Log    Test Step 8:Edit patient attachment
    Log    Test Step 9:Without selecting any file type
    Log    Test Step 10:Click on Save button
    Wait For Spinner To Disappear    ${spinner.locator}
    Edit Attachment FileType in Details Attachment Tab in Patient Manager
    Log    "Save" is clicked
    Log    Test Step 11:Verify error "file type is a mandatory fields"
    Verify Text Message    ${testdata}[error_message]    ${LONG_WAIT}
    Log    ER_1: Verified the error message- "${testdata}[error_message]" is displayed. User is not being able to update empty file type to patient
    [Teardown]    Take Screenshot And Close Browsers

PM_060 Edit Details of Patient from Patient Manager Module
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM060    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step 2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    Log    Test Step 7:Click on Edit icon left to the patient
    Edit First Patient in Patient Manager
    Log    "Edit" button is clicked
    Log    "Edit" button is clicked
    Log    Test Step 5:Update First Name, Last Name, DOB and Gender under Patient details section
    Log    Test Step 6:Update Guarantor relationship, Guarantor First Name and Last Name, guarantor DOB, guarantor Gender and Guarantor address under primary insurance section,select bill
    Log    Test Step 7:Update Primary Insurance and Primary Relationship to insured, Primary Insured first name and last name, Primary Insured DOB and address and Primary insured policy number under primary insurance section
    Log    Test Step 8:Update guarantor Email and Phone Number
    Log    Test Step 9.Click on save button
    Edit Patient Details with Other Insurance Bill in Patient Manager    ${testdata}
    Log    Edited Patient Details
    Log    Test Step 10:Verify changes are saved
    Edit First Patient in Patient Manager
    Wait Until Page Contains    ${testdata}[first_name]    ${LONG_WAIT}
    Wait Until Page Contains    ${testdata}[last_name]    ${LONG_WAIT}
    Log    Verified that user is able to edit patient details
    [Teardown]    Take Screenshot And Close Browsers

PM-0012-Delete Site from Patient from Patient Manager
    [Setup]
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM013    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step_1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step_2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step_3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    log    Test Step_4:Select patient from patient manager
    log    Test Step_:5.Click on Details Button
    Click on First Element Details button of Patient from Patient Manager
    log    Test Step_6: Click on sites tab
    Navigate to Patient Manager Details Sub-Menu    Sites
    log    Test Step_7: ick on Hamburger menu and Click on delete button
    log    Test Step _:8.Click on "No" button on confirmation page and verify Patient \ is not deleted
    Delete site from patient manager    No
    log    Test Step _:9.Click on "Yes" button on confirmation page and verify Patient is Deleted
    Delete site from patient manager    Yes

PM-013_Edit Site of Patient from Patient manager Module
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM013    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step_1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step_2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step_3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    log    Test Step_4:Select patient and click on Details tab
    Click on First Element Details button of Patient from Patient Manager
    log    Test Step_5: Click on sites tab
    Navigate to Patient Manager Details Sub-Menu    Sites
    Log    Test Step_6:Click on Edit icon left to the Sites
    log    Test Step_7:Change Site
    log    Test Step_8:Click on Save button
    log    Test Step_9:Verify Site should is updated
    Validate Edit_Site of Patinet from Patinet Manager

PM-014_Add Empty Site to Patient from Patient Manager
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM014    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step_1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step_2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step_3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    log    Test Step_4:Select Requistion and Click on Details icon
    Click on First Element Details button of Patient from Patient Manager
    log    Test Step_5: Click on sites tab
    Navigate to Patient Manager Details Sub-Menu    Sites
    Log    Test Step_6:Click and Add button
    Log    Test Step_7: Click on save button Without Entering site value
    Log    Test Step_8: Verify error "site is a mandatory field"
    Add empty site to patient from Patient Manager

PM-015-Edit Site and Save empty Site to Patient from Patient Manager
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM015    Patient_Manager
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step_1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    "${environment_data}[Browser_name]" browser is launched with "${environment_data}[Url]"
    Log    Test Step_2:Log in as an internal user into LIMSABC.Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Log    Test Step_3:Navigate to Patient manager
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    log    Test Step_4:Select patient and click on Details tab
    Click on First Element Details button of Patient from Patient Manager
    log    Test Step_5: Click on sites tab
    Navigate to Patient Manager Details Sub-Menu    Sites
    log    Test Step_6:Click on Edit icon left to the Sites
    log    Test Step_7:Click on save button without select site value
    log    Test Step_8: Verify error" Site is a mandatory field"
    Edit and Add Empty Site to Patient from Patient Manager

PM-017-Add Medication to Patient from Patient manager
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    PM017    Patient_Manager
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Refuse Alert for Notifications of News
    Log    Step 3:Navigate to Patient Manager Page
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    log    Step 4:Select patient and click on Details tab
    Click on First Element Details button of Patient from Patient Manager
    log    Step 5: Click on Medication tab
    Navigate to Patient Manager Details Sub-Menu    Medication
    log    Step 6 :Click and Add button to add medication to the patient
    Add Medication to Patient from Patient Manager    ${testdata}

PM-54-Edit Attachment File type from Patient Manager
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${BROWSER_NAME}    ${URL}
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Refuse Alert for Notifications of News
    Log    Step 3:Navigate to Patient Manager Page
    Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page    Patients    ${MEDIUM_WAIT}
    log    Test Step 4:Select Requistion
    log    Test Step 5:Click on Details Button
    Click on First Element Details button of Patient from Patient Manager
    log    Test Step 6: Click on sites tab
    Navigate to Patient Manager Details Sub-Menu    Attachments
    log    Click on Edit icon left to the attachments
    Edit filetype of Patient from Attahcments
