*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Navigate to Batch Review Page with Selected Sample-id
    Comment    select sample id check-box
    sleep    3
    Javascript Click    ${checkbox.result_review.sample id-grid}
    Comment    Click on batch review from grid-tool bar
    Wait Until Element Is Visible    ${button.result_review.batch_review grid}    ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    ${button.result_review.batch_review grid}

Search Id in Results review searchbar
    Comment    Verify user is able to search using sample id
    Wait Until Page Contains Element    ${textbox.result_review.searchbar}    ${MEDIUM_WAIT}    searchbox in pending menu is not displayed after waiting ${MEDIUM_WAIT} seconds
    Input Text    ${textbox.result_review.searchbar}    ${sample_id}
    Wait Until Page Contains Element    ${checkbox.result_review.batch_review.sample#}    ${MEDIUM_WAIT}    checkbox for selecting sample# is not displayed after waiting ${MEDIUM_WAIT} seconds
    Javascript Click    ${checkbox.result_review.batch_review.sample#}
    Comment    Verify user is able to click on search button
    Wait Until Element Is Visible    ${button.result_review.batch_review.search}    ${MEDIUM_WAIT}    search button is not displayed after waiting ${MEDIUM_WAIT} seconds
    Javascript Click    ${button.result_review.batch_review.search}
    Log    ${sample_id} id details is displayed

Create Attachment in Batch Reviews
    [Arguments]    ${test_data}
    Comment    Click on Attachments
    Click on Attachments in Batch Review
    Comment    Click on upload button
    Upload Attachment
    Comment    Verify user is able to complete upload form
    Verify User is Able to Complete Upload Form    ${test_data}
    Log    ${choose file.jpg} and ${Attachments file-type.batch_Review} is displayed
    Screenshot.Take Screenshot

Create Medication in Batch Review
    Comment    Click on Medication button in Batch Review
    sleep    3
    Javascript Click    ${button.result_review.batch_review.Medication}
    Comment    Click on Add_Medication button in Batch Review
    Wait Until Element Is Visible    ${button.result_review.batch_review.Medication.add_medication}    ${MEDIUM_WAIT}
    Javascript Click    ${button.result_review.batch_review.Medication.add_medication}
    Comment    Click on Add prescribed
    Go to Add prescribed Medication Page in Batch Review and Verify
    Screenshot.Take Screenshot

Create POCT in Batch Review
    [Arguments]    ${test_data}
    comment    Click on POCT button
    Click on POCT button in Batch Review
    comment    Click on Add-poct
    Click on Add POCT button in Batch Review
    comment    Poct form is displayed
    Select POCT type in Batch Review    ${test_data}
    Screenshot.Take Screenshot

Create Comments in Batch review
    [Arguments]    ${test_data}
    comment    click on comments menu button
    Wait Until Element Is Visible    ${button.result_review.batch_review.savepoct.cross}    ${MEDIUM_WAIT}
    Javascript Click    ${button.result_review.batch_review.savepoct.cross}
    sleep    3
    Javascript Click    ${button.result_review.batch_review.comment_menu.sample_comment}
    sleep    3
    Input Text    ${textbox.accesioning.sample_commentpredefinedcomment}    ${test_data}[Predefined_comment]
    Press Keys    ${textbox.accesioning.sample_commentpredefinedcomment}    RETURN
    Enter Requirement Comments    ${test_data}
    comment    Save sample comments
    sleep    3
    Javascript Click    ${button.result_review.batch_review.save_sample_comment}
    sleep    3

Send Preliminary reports in Result Reviews
    comment    Click on send preliminary reports
    sleep    3
    Wait Until Element Is Visible    ${button.result_review.batch_review.send-peliminary}    ${MEDIUM_WAIT}
    Javascript Click    ${button.result_review.batch_review.send-peliminary}
    comment    click on Alertstab
    Wait Until Element Is Visible    ${button.result_review.batch_review.alerts-preliminary}    ${LONG_WAIT}
    Click On The Element    ${button.result_review.batch_review.alerts-preliminary}    Alerts    ${LONG_WAIT}

Click on Attachments in Batch Review
    Wait Until Element Is Visible    ${button.result_review.batch_review.attachments}    ${MEDIUM_WAIT}    Attachments is not visible after ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    ${button.result_review.batch_review.attachments}

Upload Attachment
    Wait Until Element Is Visible    ${button.result_review.batch_review.attachments.upload}    ${MEDIUM_WAIT}    upload is not visible after ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    ${button.result_review.batch_review.attachments.upload}

Verify User is Able to Complete Upload Form
    [Arguments]    ${test_data}
    Wait Until Element Is Visible    ${button.result_review.batch_review.attachments.choose_file}    ${MEDIUM_WAIT}    choose file \ is not visible after ${MEDIUM_WAIT}
    sleep    3
    Choose File    ${button.result_review.batch_review.attachments.choose_file}    ${choose file.jpg}
    Comment    Click on Filetype
    Wait Until Element Is Visible    ${button.result_review.batch_review.attachments.choose_file.filetype}    ${MEDIUM_WAIT}    Filetype is not visible after ${MEDIUM_WAIT}
    comment    3
    Input Text    ${button.result_review.batch_review.attachments.choose_file.filetype}    ${test_data}[Attachment_File_Type]
    Press Keys    None    RETURN
    Save Attachment in Batch Review

Save Attachment in Batch Review
    Comment    Click on save button
    sleep    3
    Javascript Click    ${button.batchreview_attachment.Save}

Display Reports in New Window
    comment    click on display reports
    Javascript Click    ${button.result_review.batch_review.display_reports}
    comment    click on quick summarized reports
    sleep    3
    Javascript Click    ${button.result_review.batch_review.infectious-disease}
    comment    click on covid only option
    Javascript Click    ${checkbox.result_review.batch_review.view_report_in_another_window}
    sleep    5
    Javascript Click    ${checkbox.result_review.batch_review.covid-only_report}
    Javascript Click    ${checkbox.result_review.batch_review.view_report_in_another_window}
    Javascript Click    ${checkbox.result_review.batch_review.view_report_in_another_window}

Click on Add_Medication button in Batch Review

Go to Add prescribed Medication Page in Batch Review and Verify
    Send Text To Textfield    ${textbox.batch_review.add_medication}    medication textbox    ${MEDIUM_WAIT}    Clorazepate
    Wait Until Element Is Visible    ${text.result_review.add_prescribed_medication.dropdown}    ${MEDIUM_WAIT}
    Wait Until Time    3
    Javascript Click    ${text.result_review.add_prescribed_medication.dropdown}
    Comment    Click on save button
    Javascript Click    ${button.result_review.batch_review.add_prescribed_medication.save}

Click on POCT button in Batch Review
    Wait Until Element Is Visible    ${button.result_review.batch_review.add_poct}    ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    ${button.result_review.batch_review.add_poct}

Click on Add POCT button in Batch Review
    Wait Until Element Is Visible    ${button.result_review.batch_review.add}    ${MEDIUM_WAIT}
    sleep    3
    Click On The Element    ${button.result_review.batch_review.add}

Select POCT type in Batch Review
    [Arguments]    ${test_data}
    comment    Click on Select poct
    Wait Until Element Is Visible    ${textbox.result_review.batch_review.select.poct}    ${MEDIUM_WAIT}
    Input Text    ${textbox.result_review.batch_review.select.poct}    ${test_data}[POCT]
    Press Keys    None    RETURN
    comment    Click on select poct-results
    Wait Until Element Is Visible    ${textbox.result_review.batch_review.select.poct-result}    ${MEDIUM_WAIT}
    Input Text    ${textbox.result_review.batch_review.select.poct-result}    ${test_data}[POCT_type]
    Press Keys    None    RETURN
    comment    Click on save button
    Wait Until Element Is Visible    ${button.result_review.batch_review.savepoct}    ${MEDIUM_WAIT}
    Javascript Click    ${button.result_review.batch_review.savepoct}
    Wait Until Element Is Visible    ${button.result_review.batch_review.savepoct.cross}    ${MEDIUM_WAIT}
    Javascript Click    ${button.result_review.batch_review.savepoct.cross}

Comments_batch-review.Result-review

Comment_add-comment_batch-review_Result-review

Comments_add-comment_comment-frame_batch-review_Result-review

Enter Requirement Comments
    [Arguments]    ${test_data}
    Comment    Select frame and pass the comment
    Wait For The Element to be Visible    ${frame.results_review.create_sample_comment.}    frame    ${LONG_WAIT}
    Select Frame And Input Req Comments    ${test_data}    ${frame.results_review.create_sample_comment.}

Verify Reports in Result Review
    [Arguments]    ${testdata}
    sleep    5
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${quick_summary_report_data}    read_coloured_pdf    ${file_path}[0]
    sleep    3
    ${covid_report_data}    Read Pdf    ${file_path}[1]
    Should Contain    ${quick_summary_report_data}    ${testdata}[Comment]
    Should Contain    ${covid_report_data}    ${testdata}[POCT]
    Should Contain    ${covid_report_data}    ${testdata}[POCT_type]
    FOR    ${file}    IN    @{file_path}
        Remove File    ${file}
        sleep    5
    END

Add Data in Batch Review Page
    [Arguments]    ${test_data}
    Comment    Navigates to batch review page
    sleep    3
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Comment    Verify whether user is able to create Attachments in batch_review
    Create Attachment in Batch Reviews    ${test_data}
    Log    Clicked on Attachments and upload${choose file.jpg} and file type${Attachments file-type.batch_Review} and save it
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to create Medications in batch_review
    Create Medication in Batch Review
    Log    Clicked on Medications and created medication
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to create Medications in batch_review
    Create POCT in Batch Review    ${test_data}
    Log    Clicked on POCT and created POCT
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to create Comments in batch_review
    Create Comments in Batch review    ${test_data}
    Log    Clicked on Comments and created a comment
    Screenshot.Take Screenshot

Verify User Able to View Reports
    [Arguments]    ${testdata}
    Comment    Verify whether user is able to generate preliminary reports in batch_review
    Send Preliminary reports in Result Reviews
    Log    Click on Send preliminary reports
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to click on display reports and check the reports
    Display Reports in New Window
    Log    Click on Display report and click on Quick Summarized report and click on Covid rapid test
    Screenshot.Take Screenshot
    Verify Reports in Result Review    ${testdata}

Select Frame And Input Req Comments
    [Arguments]    ${test_data}    ${frame_locator}
    Wait For The Element to be Visible    ${frame_locator}    frame    ${MEDIUM_WAIT}
    Select Frame    ${frame_locator}
    Input Text    ${textbox.Results.reqcomment}    ${test_data}
    Unselect Frame

Navigate To Validity Rejection Page and Select Reject Reason
    [Arguments]    ${validity_yes_or_no}
    Javascript Click    ${dropdown.result_review.reject_validation.arrow_for_selecting_yes}
    sleep    2
    ${dropdown_locator}    Update Dynamic Value    ${dropdown.result_review.reject_validation.select_yes_or_no}    ${validity_yes_or_no}
    Javascript Click    ${dropdown_locator}
    Select Frame    ${frames.result_review.validity_rejection}
    Input Text    ${textbox.Results.reqcomment}    qa_comment
    Unselect Frame
    SeleniumLibrary.Wait Until Element Is Visible    ${button.review_results.validity_rejection.save}    ${MEDIUM_WAIT}    Save button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.review_results.validity_rejection.save}

Verify Validity Rejection Details in Home Page
    [Arguments]    ${Key}
    SeleniumLibrary.Wait Until Element Is Visible    ${messages.result_review.reject_validation.enter_comment.save}    ${MEDIUM_WAIT}    Success message is not visible after waiting ${LONG_WAIT} seconds
    sleep    3
    Run Keyword If    ${Key}==0    SeleniumLibrary.Wait Until Element Is Visible    ${icon.result_review.validity_rejection}    ${MEDIUM_WAIT}    Validity icon is not visible after waiting ${LONG_WAIT} seconds
    Run Keyword If    ${Key}==1    Page Should Not Contain Element    ${icon.result_review.validity_rejection}    ${MEDIUM_WAIT}    Validity icon is not visible after waiting ${LONG_WAIT} seconds
    sleep    3

Select First Requsition Sample Id for Sending Back for Testing
    ${element_for_sample_attribute}    Update Dynamic Value    ${label.accesioning.details.attribute_for_sample_id}    1
    ${sample_id}    Get Element Attribute    ${element_for_sample_attribute}    title
    ${element_1_checkbox}    Update Dynamic Value    ${checkbox.accesioning.details.dynamic_sampleid}    ${sample_id}
    Click On The Element    ${element_1_checkbox}    First Requisition Checkbox    ${LONG_WAIT}    seleniumclick
    Javascript Click    ${button.result_review.results_completed.back_for_testing}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.result_review.results_completed.back_for_testing.select_yes}    ${LONG_WAIT}    Select Yes for confirming back for testing \ is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.result_review.results_completed.back_for_testing.select_yes.spinner}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${button.result_review.results_completed.back_for_testing.select_yes.spinner}    ${LONG_WAIT}    Spinner is still visible after waiting ${LONG_WAIT} seconds
    SeleniumLibrary.Wait Until Element Is Not Visible    ${element_1_checkbox}    ${LONG_WAIT}    Selected sample id is still visible after waiting ${LONG_WAIT} seconds
    [Return]    ${element_1_checkbox}

Verify if "Changed the raw result value to 25 for all empty result"
    Comment    Verify "Changed the raw result value to 25 for all empty result" popup message is displayed
    Wait Until Element Is Visible    ${message.result_review.raw_result_value}    ${LONG_WAIT}    Changed the raw result value to 25 for all empty result" popup message is displayed after waiting ${LONG_WAIT} seconds

Navigate to Cross Tab Start Processing Page
    Comment    Verify User able to Navigate to Cross Tab Start Processing Page
    Wait Until Element Is Visible    ${button.result_review.tool_bar.cross_tab.raw_result}    ${LONG_WAIT}    ${button.result_review.tool_bar.cross_tab.raw_result} in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    sleep    3
    Javascript Click    ${button.result_review.tool_bar.cross_tab.raw_result}
    Wait Until Element Is Visible    ${textbox.accesioning.requisition_completeall.start_processing}    ${LONG_WAIT}    Start processing in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    sleep    3
    Javascript Click    ${textbox.accesioning.requisition_completeall.start_processing}
    Wait Until Element Is Visible    ${label.accesioning.requisition_completeall.complete_100%_process}    ${LONG_WAIT}    Process complete label in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Log    Requisition completed success message is displayed***
    Javascript Click    ${textbox.accesioning.requisition_completeall.closemodal}

Navigate to Cross Tab Result Review Page
    Comment    Verify User able to Navigate to Cross Tab Result Review Page
    Javascript Click    ${checkbox.result_review.select_first_requisition}
    Javascript Click    ${checkbox.result_review.select_second_requisition}
    Javascript Click    ${button.result_review.tool_bar.cross_tab}
    sleep    3
    Javascript Click    ${button.result_review.tool_bar.cross_tab.raw_result}

Actions done in Sent Back to Accessioning
    [Arguments]    ${testdata}
    Wait For The Element to be Visible    ${title.result_review.sent_back_to_accessioning}    title for sent back to accessioning    ${LONG_WAIT}
    Click On The Element    ${button.result_review.sent_back_to_accesioning.clear_results_and_send_back}    Clear Results and Send Back    ${LONG_WAIT}
    Log    "Clear Results and Send Back" button is Clicked
    Wait Until Page Contains    Please click on the button "START PROCESSING" to start the Requisitions Back to Accessioning process!    ${LONG_WAIT}    "Start Processing" message is not displayed until ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Navigate to Start Process and Close Modal Grid
    Log    Navigated to "Strt Process nd Close Modal Grid" page
    Wait Until Page Contains    Results Review    ${MEDIUM_WAIT}    "Results Review" page is not displayed until ${MEDIUM_WAIT} seconds
    Screenshot.Take Screenshot

Verify Selected Requisitions are Removed from Requistion List
    [Arguments]    ${req_id_count}    ${sample-id}    ${testdata}    ${message}=None
    FOR    ${key}    IN RANGE    ${req_id_count}
        Send Text To Textfield    ${textbox.results_review.searchbar}    search bar    ${LONG_WAIT}    ${sample-id}[${key}]
        Log    "${sample-id}[${key}]" is entered into search-bar
        ${new.checkbox.accesioning.home_page.search_category}    Update Dynamic Value    ${checkbox.accesioning.home_page.search_category}    ${testdata}[result_review_searchcategory_checkbox]
        ${class}    Get Element Attribute    ${new.checkbox.accesioning.home_page.search_category}    class
        Run Keyword If    '$(class)'=='radio'    Click On The Element    ${new.checkbox.accesioning.home_page.search_category}    "${testdata}[result_review_searchcategory_checkbox]"-checkbox    ${LONG_WAIT}
        Log    "${testdata}[result_review_searchcategory_checkbox]" Checkbox is Clicked
        Click On The Element    ${button.homepage.common_search}    search button    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Run Keyword If    '${message}'!='None'    Wait Until Element Is Visible    ${message.result_review.no_record_found}    ${MEDIUM_WAIT}
        Screenshot.Take Screenshot
    END

Select Label Template
    [Arguments]    ${testdata}
    Click On The Element    ${button.maximize_window}    maximize button    ${LONG_WAIT}
    Click On The Element    ${textbox.results_review.print_labels.label_template}    label_template textbox    ${LONG_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Select_label_Template]
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${new.label.accesioning.details.submenu}    ${MEDIUM_WAIT}
    Run Keyword If    ${status}==True    Click Element    ${new.label.accesioning.details.submenu}
    Run Keyword If    ${status}==False    Click Element    ${textbox.results_review.print_labels.label_template}
    Run Keyword If    ${status}==False    Click Element    ${new.label.accesioning.details.submenu}
    Perform Actions    Print    ${MEDIUM_WAIT}

Select Requisitions and Click on Print Labels
    [Arguments]    ${testdata}
    Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
    Log    Requisition Checkboxes of "${sample_id}" Sample Id's' is Selected
    Navigate to Tool Bar Grid Buttons    Print Labels
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Select Label Template    ${testdata}
    ${file_path}    Read Pdf Data
    Remove Files in Directory

Select Multiple Requisition Checkboxes in Result Review
    [Arguments]    ${Count_Value}
    @{home_page_requisition_id}    Create List
    @{sample_id}    Create List
    @{patient_name_attribute}    Create List
    FOR    ${key}    IN RANGE    0    ${Count_Value}
        ${key}    Evaluate    ${key}+1
        ${updated_key}    Convert To String    ${key}
        ${new.label.result_review.requisitions.for_getting_patient_name}    Update Dynamic Value    ${label.result_review.requisitions.for_getting_patient_name}    ${updated_key}
        ${patient_name_attribute}    Get Element Attribute    ${new.label.result_review.requisitions.for_getting_patient_name}    title
        ${new.label.results_review.get_requisition_id}    Update Dynamic Value    ${label.results_review.get_requisition_id}    ${updated_key}
        ${sample_id_attribute}    Get Element Attribute    ${new.label.results_review.get_requisition_id}    data-id
        Log    Sample_Id-"${sample_id_attribute}" is Received
        ${new.checkbox.accesioning.select_requisitions}    Update Dynamic Value    ${checkbox.accesioning.select_requisitions}    ${sample_id_attribute}
        Click On The Element    ${new.checkbox.accesioning.select_requisitions}    requisition checkbox    ${LONG_WAIT}    seleniumclick
        Log    Requisition Checkbox of sample-id -"${sample_id_attribute}" is Clicked
        Append To List    ${sample_id}    ${sample_id_attribute}
        Log    ${sample_id}
    END
    Log    ${sample_id}
    ${req_id_count}    Get Length    ${sample_id}
    Set Test Variable    ${req_id_count}    ${req_id_count}
    Set Global Variable    ${sample_id}

Navigate to Raw Result 25 Page
    Wait Until Time    ${SHORT_WAIT}
    Click On The Element    ${button.result_review.tool_bar.cross_tab.raw_result}    raw result 25    ${LONG_WAIT}    seleniumclick
    Log    "Raw Result 25" is Clicked
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Navigate to Start Process and Close Modal Grid

Navigate to Cross Tab with Selected Requisitions
    [Arguments]    ${testdata}
    Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
    FOR    ${key}    IN RANGE    0    ${req_id_count}
        ${evaluated_key}    Evaluate    ${key}+1
        ${updated_key}    Convert To String    ${evaluated_key}
        ${get_sample_id}    Update Dynamic Value    ${label.result_review.get_random_requisition_sample-id}    ${updated_key}
        ${new.get_sample_id}    Get Element Attribute    ${get_sample_id}    title
        Log    "${new.get_sample_id}" is received
        Navigate to Details button    ${new.get_sample_id}
        Wait For Spinner To Disappear    ${spinner.locator}
        Click On The Element    ${button.result_review.cross_tab}    Cross tab    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Navigate to Raw Result 25 Page
        Wait For Spinner To Disappear    ${spinner.locator}
        Click On The Element    ${button.accesioning.requisition_list_hamburger_menu.comments.pageclose(x)}    Comments page close    ${LONG_WAIT}
        Navigate to Details button    ${new.get_sample_id}
    END
    Navigate to Tool Bar Grid Buttons    Cross Tab
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    ${message}    Run Keyword And Return Status    Verify Text Message    Please, select samples    ${LONG_WAIT}
    Click Cross Tab from Tool Bar with Selected Requisitions    ${testdata}
    Log    Verified that the Cross Tab Result Review Modal is displayed.
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Navigate to Raw Result 25 Page
    Wait For Spinner To Disappear    ${spinner.locator}
    Log    Navigated to "Raw Result 25 page"
    Log    Start Processing page is displayed.
    Verify Text Message    ${testdata}[message]    ${MEDIUM_WAIT}
    Log    Verified with the"${testdata}[message]" popup message.

Navigate to Start Process and Close Modal Grid
    Click On The Element    ${textbox.accesioning.requisition_completeall.start_processing}    Start processing    ${LONG_WAIT}
    Log    "Start Processing" button is Clicked
    Wait For The Element to be Visible    ${label.accesioning.requisition_completeall.complete_100%_process}    Process complete label    ${LONG_WAIT}
    Log    "Process Completed Succesfully 100%" is displayed
    Click On The Element    ${textbox.accesioning.requisition_completeall.closemodal}    Close Modal and Refresh Grid    ${LONG_WAIT}
    Log    "Close Modal and Refresh Grid" button is Clicked
    Wait Until Time    ${MINI_WAIT}

Verify Print Labels with Multiple Requisitions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" page
        Select Requisitions and Click on Print Labels    ${testdata}
        Log    Verified the Print Labels displayed in New Tab in "${Page_Name}[${key}]".
    END

Verify Raw Result in Cross Tab with Multiple Requisitions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" page
        Click On The Element    ${arrow.result_review.sid_filter}    SID arrow    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait Until Time    ${MINI_WAIT}
        Navigate to Cross Tab with Selected Requisitions    ${testdata}
        Log    Navigated to "Cross Tab" page with Selecting "${sample_id}" Requisitions Checkbox.
    END

Verify Requisition Moved to Results Completed Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        Click On The Element    ${arrow.result_review.sid_filter}    SID arrow    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait Until Time    ${MINI_WAIT}
        Navigate to Complete Tab with Multiple Requisitions    ${testdata}
        Wait For Spinner To Disappear    ${spinner.locator}
        Log    Selected Requisitions and Navigated to "Complete" page
        Verify Selected Requisitions are Removed from Requistion List    ${req_id_count}    ${sample_id}    ${testdata}
        Log    Searched for Sample-Id : "${sample_id}" in "${Page_Name}[${key}]" Page.
        Navigate to Tab    Results Completed
        Log    Navigated to "Results Completed" Page
        Verify Selected Requisitions are Removed from Requistion List    ${req_id_count}    ${sample_id}    ${testdata}    None
        Log    Searched for Sample-Id : "${sample_id}" in "Results Completed" Page.
    END

Navigate to Complete Tab with Multiple Requisitions
    [Arguments]    ${testdata}
    Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
    Log    Selected "${testdata}[requisition_checkbox_count]" Requisitions
    Navigate to Tool Bar Grid Buttons    Complete
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Log    Verified that the Result samples complete all Modal is displayed.
    Navigate to Start Process and Close Modal Grid
    Log    Navigated to "Start Processing and Close Modal Grid" page in Complete Tab

Search for Removed Requisitions from Results Review in Accessioning
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Module And Tab    Results Review    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
        Log    Selected "${testdata}[requisition_checkbox_count]" Requisitions
        Navigate to Tool_Bar Grid Buttons    Sent back to Accessioning
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Log    Navigated to "Sent Back to Accessioning", "Sent Back to Accessioning" Modal is displayed.
        Actions done in Sent Back to Accessioning    ${testdata}
        Log    "Sent Back to Accessioning" module is displayed. Navigated to "Clear Results and Send Back" Page
        Verify Selected Requisitions are Removed from Requistion List    ${req_id_count}    ${sample_id}    ${testdata}
        Log    "${sample_id}" - Requisitions are Removed from Results Review "${Page_Name}[${key}]" Page
        Navigate to Module And Tab    Accessioning    Pending
        Log    Navigated to "Accessioning Pending" Page
        Search for Multiple Sample-id in Search-Bar & Verify    ${testdata}    ${req_id_count}    ${sample_id}    None
        Log    Searched for "${sample_id}"- Requisitions in "Accessioning Pending" Page. "${sample_id}" is Displayed
    END

Select Requisitions and Navigate to Send Preliminary Report Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
        Log    Selected "${testdata}[requisition_checkbox_count]" Requisitions
        Navigate to Tool_Bar Grid Buttons    Send Preliminary Report
        Log    Navigated to "Send Preliminary Reports", "Send Preliminary Reports" Modal is displayed.
        Navigate to Start Process and Close Modal Grid
        Log    Requisitions-"${sample_id}" are Sent to "Send Preliminary Report". "Preliminary Report Sent!" popup message is displayed.
    END

Reject Requisition in Validity Rejection from Hamburger Menu
    [Arguments]    ${validity_yes_or_no}    ${testdata}
    Mouse Over    ${textbox.result_review.pending_results.requisition_hamburger.validity_rejection.reject_dropdown_field}
    Javascript Click    ${button.result_review.pending_results.requisition_hamburger.validity_rejection.reject_dropdown_arrow}
    ${new.option.result_review.pending_results.requisition_hamburger.validity_rejection.reject_dropdown_value}    Update Dynamic Value    ${option.result_review.pending_results.requisition_hamburger.validity_rejection.reject_dropdown_value}    ${validity_yes_or_no}
    Javascript Click    ${new.option.result_review.pending_results.requisition_hamburger.validity_rejection.reject_dropdown_value}
    Wait For Spinner To Disappear    ${spinner.locator}
    Select Frame    ${frame.result_review.pending_results.requisition_hamburger.validity_rejection.reason}
    Input Text    ${textbox.results_review.reqcomment}    ${testdata}[Comment]
    Unselect Frame
    Perform Actions    Save    ${LONG_WAIT}
    Log    "Save" is Clicked
    [Teardown]

Search for Validity Rejected Icon on Requisition
    [Arguments]    ${Key}
    Wait Until Time    ${SHORT_WAIT}
    Run Keyword If    ${Key}==0    SeleniumLibrary.Wait Until Element Is Visible    ${icon.result_review.pending_results.requisition.validity_rejected_icon}    ${MEDIUM_WAIT}    Validity icon is not visible after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Wait Until Time    ${SHORT_WAIT}
    Run Keyword If    ${Key}==1    Page Should Not Contain Element    ${icon.result_review.pending_results.requisition.validity_rejected_icon}    ${MEDIUM_WAIT}    Validity icon is not visible after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Wait Until Time    ${SHORT_WAIT}

Validity Reject the Selected Requisition
    [Arguments]    ${testdata}
    FOR    ${Key}    IN RANGE    2
        ${Key}    Convert To String    ${Key}
        ${RID}    Get First Requisition RID
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Validity Rejection    Validity Rejection
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Log    ER_3:Options are displayed.
        Log    ER_4:Verified that the Validity Rejection Modal is displayed.
        ${validity_yes_or_no}    Run Keyword If    '${Key}'=='0'    Set Variable    Yes
        ...    ELSE    Set Variable    No
        Log    Value - "${validity_yes_or_no}"
        Click On The Element    ${button.maximize_window}    maximize window    ${LONG_WAIT}
        Reject Requisition in Validity Rejection from Hamburger Menu    ${validity_yes_or_no}    ${testdata}
        Log    "${validity_yes_or_no}" is selected. and "Save" is Clicked
        ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Success!
        Verify Message    ${new.label.accesioning.details.submenu}    ${SHORT_WAIT}
        Log    "Success!" Pop-up Message is displayed
        Search for Validity Rejected Icon on Requisition    ${Key}
    END

Navigate to Validity Rejection with Selected Requisitions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Result Review "${Page_Name}[${key}]" is displayed.Navigated to "${Page_Name}[${key}]" Page
        Validity Reject the Selected Requisition    ${testdata}
        Log    ER_5:Verified "Success" Pop-up Message and "Reject Cross" mark icon is visible under "${Page_Name}[${key}]" tab.
        Log    ER_6:Verified that \ "Success" popup message is displayed and Reject cross mark icon removed from "${Page_Name}[${key}]" tab.
    END

Click on Back For Testing in Tool Bar Grid
    ${new.button.accesioning.tool-bar-grid-buttons}    Update Dynamic Value    ${button.accesioning.tool-bar-grid-buttons}    Back For Testing
    Scroll And Click    ${new.button.accesioning.tool-bar-grid-buttons}    Back For Testing    ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.result_review.click_element.yes}    ${LONG_WAIT}    Select Yes Option is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.result_review.click_element.yes}
    Wait Until Page Contains    Samples returned for testing    ${LONG_WAIT}    Samples returned for testing message is not visible after waiting ${LONG_WAIT} seconds

Create Batch
    [Arguments]    ${testdata}
    ${new.textbox.result_review.create_batch}    Update Dynamic Value    ${textbox.result_review.create_batch}    Equipment
    ${new.textbox.dropdown.result_review.create_batch}    Update Dynamic Value    ${textbox.dropdown.result_review.create_batch}    Thermo Fisher Quant Studio 12K Flex
    Click On The Element    ${button.results_review.batch.create_batch(+)}    create batch(+)    ${MEDIUM_WAIT}
    Send Text To Textfield    ${button.results_review.batch.create_batch(+).name}    Batch Name    ${MEDIUM_WAIT}    ${testdata}[name]
    Log    "${testdata}[name]" is entered
    Send Text To Textfield    ${new.textbox.result_review.create_batch}    Equipment Textbox    ${MEDIUM_WAIT}    Thermo Fisher Quant Studio 12K Flex
    Click On The Element    ${new.textbox.dropdown.result_review.create_batch}    Thermo 12 k Dropwon Option    ${SHORT_WAIT}
    Click On The Element    ${button.results_review.batch.create_batch(+).next}    Next    ${MEDIUM_WAIT}

Add Sample-id to Batch
    [Arguments]    ${sample_id}
    Wait Until Time    10
    Wait Until Page Contains Element    ${title.results_review.batch.create_batch(+).create_batch}    ${MEDIUM_WAIT}
    Click On The Element    ${textbox.results_review.batch.create_batch(+).create_batch.sample#}    sample #    ${MEDIUM_WAIT}    SeleniumClick
    Input Text    ${textbox.results_review.batch.create_batch(+).create_batch.sample#}    ${sample_id}
    Log    Value-"${sample_id}" is entered into sample # textbox
    Screenshot.Take Screenshot
    Click On The Element    ${button.results_review.batch.create_batch(+).create_batch.filter}    Filter    ${MEDIUM_WAIT}
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Element    ${message.results_review.batch.create_batch(+).create_batch.filter}    ${MEDIUM_WAIT}
    Run Keyword If    "${status}"=="True"    Click On The Element    ${textbox.results_review.batch.create_batch(+).create_batch.sample#}    sample #    ${MEDIUM_WAIT}    SeleniumClick
    Run Keyword If    "${status}"=="True"    Input Text    ${textbox.results_review.batch.create_batch(+).create_batch.sample#}    ${sample_id}
    Run Keyword If    "${status}"=="True"    Screenshot.Take Screenshot
    Run Keyword If    "${status}"=="True"    Click On The Element    ${button.results_review.batch.create_batch(+).create_batch.filter}    Filter    ${MEDIUM_WAIT}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${checkbox.results_review.batch.create_batch(+).create_batch.requisition}
    Perform Actions    Save    ${MEDIUM_WAIT}

Create Batch Results
    [Arguments]    ${sample_id}
    Wait Until Page Contains Element    ${title.results_review.batch.create_batch(+).create_batch.next.results_create_batch}    ${MEDIUM_WAIT}
    Click On The Element    ${button.results_review.batch.create_batch(+).create_batch.next.results_create_batch.start_processing}    Start processing    ${MEDIUM_WAIT}
    ${new.label.results_review.batch.create_batch(+).create_batch.next.results_create_batch.start_processing.message}    Update Dynamic Value    ${label.results_review.batch.create_batch(+).create_batch.next.results_create_batch.start_processing.message}    ${sample_id}
    Wait Until Page Contains Element    ${new.label.results_review.batch.create_batch(+).create_batch.next.results_create_batch.start_processing.message}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Wait Until Time    1
    Click Element    ${textbox.accesioning.requisition_completeall.closemodal}

Verify Created Batch
    [Arguments]    ${testdata}    ${sample_id}
    Create Batch    ${testdata}
    Log    Batch of Name-"${testdata}[name]" is Created
    Add Sample-id to Batch    ${sample_id}
    Log    Requisition id-"${sample_id}" is adding into Batch Name-"${testdata}[name]"
    Create Batch Results    ${sample_id}
    Log    Successfully added Requisition id-"${sample_id}" into Batch Name-"${testdata}[name]"
    ${new.label.results_review.requisition.sample_id}    Update Dynamic Value    ${label.results_review.requisition.sample_id}    ${sample_id}
    Wait Until Page Contains Element    ${new.label.results_review.requisition.sample_id}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Log    Requisition id-"${sample_id}" is added into Results_Review in Batch Name-"${testdata}[name]"
    Read and Remove File path

Navigate to and Complete the Hamburger Reject Requisition
    [Arguments]    ${testdata}
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${textbox.results_review.pending_results.Requisition_hamburger.reject_requisition.predefined_comment}
    Wait Until Time    ${MINI_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Predefined_comment]
    Javascript Click    ${new.label.accesioning.details.submenu}
    Wait Until Time    ${MINI_WAIT}
    Select Frame    ${frame.accesioning.req-hamburger.reject}
    Clear Element Text    ${textbox.results_review.reqcomment}
    Input Text    ${textbox.results_review.reqcomment}    ${testdata}[Comment]
    Unselect Frame
    Perform Actions    Save    ${MEDIUM_WAIT}
    Log    "Save" is Clicked

Navigate to Hamburger Reject Requisition with Sample-id
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Result Review "${Page_Name}[${key}]" is displayed.Navigated to "${Page_Name}[${key}]" Page
        ${RID}    Get First Requisition RID
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Reject Requisition    Reject Requisition
        Log    ER_3:Options are displayed.
        Log    ER_4:Verified that the Reject Requisition Modal is displayed.
        Navigate to and Complete the Hamburger Reject Requisition    ${testdata}
        ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Requisition Rejected
        Verify Message    ${new.label.accesioning.details.submenu}    ${MEDIUM_WAIT}
        Log    "Requisition Rejected" Pop-up Message is displayed
        @{RID}    Create List    ${RID}
        Verify Selected Requisitions are Removed from Requistion List    ${testdata}[requisition_checkbox_count]    ${RID}    ${testdata}
        Log    ER_5:Verified that "Requisition Rejected" popup message is displayed and rejected requisition-"${RID}" is removed from "${Page_Name}[${key}]" tab.
    END

Select Requisitions and Perform Requisition Hamburger "Send back to Accessioning" in different Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Module And Tab    Results Review    ${Page_Name}[${key}]
        Log    Navigated to Results Review "${Page_Name}[${key}]" Page
        ${RID}    Get First Requisition RID
        Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Sent back to Accessioning    Sent back to Accessioning
        Log    ER_3:Options are displayed.
        Log    ER_4:Verified that the Sent Back to Accessioning Modal is displayed.
        Wait For The Element to be Visible    ${title.result_review.sent_back_to_accessioning}    sent back to accessioning    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"=="${Page_Name}[2]"    Javascript Click    ${button.results_review.results_completed.requisition_hamburger.send back to accessioning.send back for testing}
        ...    ELSE    Javascript Click    ${button.result_review.sent_back_to_accesioning.clear_results_and_send_back}
        @{RID}    Create List    ${RID}
        Verify Selected Requisitions are Removed from Requistion List    ${testdata}[requisition_checkbox_count]    ${RID}    ${testdata}
        Log    "${RID}" - Requisition are Removed from Results Review "${Page_Name}[${key}]" Page
        Navigate to Module And Tab    Accessioning    Pending
        Log    Navigated to "Accessioning Pending" Page
        Search for Multiple Sample-id in Search-Bar & Verify    ${testdata}    ${testdata}[requisition_checkbox_count]    ${RID}    None
        Log    Searched for "${RID}"- Requisition in "Accessioning Pending" Page. "${RID}" is Displayed
        Log    ER_5:Verified that the Selected Requisition of Sample-Id - "${RID}" is Removed from Requisition Grid and displayed in Accessioning tab.
    END

Validate Preview Report in Result Review
    Log    Click on Print Preview
    ${RID}    Get First Requisition RID
    ${new.button.homepage.requisitions.common}    Update Dynamic Values    ${button.homepage.requisitions.common}    ${RID}    Preview Report
    Click On The Element    ${new.button.homepage.requisitions.common}    preview report button    ${MEDIUM_WAIT}
    Log    Verifying the File is Downloaded When Clicked On Preview Report
    Verify Expected File is Downloaded into Local
    Remove Files in Directory

Click Cross Tab from Tool Bar with Selected Requisitions
    [Arguments]    ${testdata}
    Wait For The Element to be Visible    ${label.page_title}    page title    ${LONG_WAIT}
    Reload Page
    Wait For The Element to be Visible    ${label.page_title}    page title    ${LONG_WAIT}
    Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
    Navigate to Tool Bar Grid Buttons    Cross Tab

Cancel Test from Hamburger in Different Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Reload Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        Click On The Element    ${arrow.result_review.sid_filter}    SID arrow    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait Until Time    ${MINI_WAIT}
        Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
        Run Keyword If    "${Page_Name}[${key}]"=="${Page_Name}[${key}][0]" or "${Page_Name}[${key}]"=="${Page_Name}[${key}][1]"    Add Tests from Tool Bar Grid    ${testdata}
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Navigate to Requisition Hamburger Sub Menu Options    ${sample_id}[0]    Cancel Test    Cancel Test
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Log    ER_3:Options are displayed.
        Log    ER_4:Verified that the Cancel test Modal is displayed.
        ${test_name}    Cancel the Test    ${testdata}
        Verify Text message    ${testdata}[message]    ${SHORT_WAIT}
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Wait Until Time    ${MINI_WAIT}
        Navigate to Requisition Hamburger Sub Menu Options    ${sample_id}[0]    Cancel Test    Cancel Test
        Send Text To Textfield    ${textbox.result_review.requisition_hamburger.cancel_test.searchbar}    Cancel_page_searchbar    ${LONG_WAIT}    ${test_name}
        Click On The Element    ${button.result_review.requisition_hamburger.cancel_test.searchbar.search}    Cancel_page_search    ${LONG_WAIT}
        Verify Message    ${message.result_review.no_record_found}    ${LONG_WAIT}
        Log    ER_5:Verified with "Test Cancelled" popup message in "${Page_Name}[${key}]" and Cancelled tests are removed from cancel test tab.
    END

Cancel the Test
    [Arguments]    ${testdata}
    Mouse Over    ${textbox.result_review.requisition_hamburger.cancel_test.reason_for_cancelling_test}
    Javascript Click    ${button.result_review.requisition_hamburger.cancel_test.reason_for_cancelling_test}
    ${reason for cancel test}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Select_label_Template]
    Javascript Click    ${reason for cancel test}
    ${test_name}    Get Element Attribute    ${label.result_review.requisition_hamburger.cancel_test.analyte_tests_name}    title
    ${new.checkbox.result_review.requisition_hamburger.cancel_test.analyte_test_name.checkbox}    Update Dynamic Value    ${checkbox.result_review.requisition_hamburger.cancel_test.analyte_test_name.checkbox}    ${test_name}
    Click On The Element    ${new.checkbox.result_review.requisition_hamburger.cancel_test.analyte_test_name.checkbox}    Test Checkbox    ${LONG_WAIT}    seleniumclick
    Perform Actions    Save    ${LONG_WAIT}
    [Return]    ${test_name}

Cancel the Specimen
    [Arguments]    ${testdata}
    Mouse Over    ${textbox.result_review.requisition_hamburger.cancel_test.reason_for_cancelling_test}
    Javascript Click    ${button.result_review.requisition_hamburger.cancel_test.reason_for_cancelling_test}
    ${reason for cancel test}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Select_label_Template]
    Javascript Click    ${reason for cancel test}
    Perform Actions    Save    ${LONG_WAIT}

Cancel Specimen from Hamburger in different Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Reload Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        ${RID}    Get First Requisition RID
        Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Cancel Specimen    Cancel Specimen
        Log    ER_3:Options are displayed.
        Log    ER_4:Verified that the Cancel Specimen Modal is displayed.
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Click On The Element    ${button.maximize_window}    maximize window button    ${LONG_WAIT}
        Cancel the Specimen    ${testdata}
        Verify Text message    ${testdata}[message]    ${SHORT_WAIT}
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Search For Details In Home Page    ${RID}    ${testdata}[pending_searchcategory_checkbox]
        Wait For The Element to be Visible    ${label.homepage.no_records_found}    no records found label    ${MEDIUM_WAIT}
        Log    ER_5:Verified that "Tests Cancelled" popup message is displayed and Requisition-"${RID}" is removed from "${Page_Name}[${key}]" page.
    END

Verify Print Lables in Result Review
    [Arguments]    ${test_data}    ${page_name}
    Select Multiple Requisition Checkboxes in Result Review    2
    ${new.label.result_review.requisitions.for_getting_patient_name}    Run Keyword If    '${page_name}'=='All'    Update Dynamic Value    ${label.result_review.all_tab.get_patient_name}    1
    ...    ELSE    Update Dynamic Value    ${label.result_review.requisitions.for_getting_patient_name}    1
    ${patient_name}    Get Element Attribute    ${new.label.result_review.requisitions.for_getting_patient_name}    title
    ${patient_name}    Split String    ${patient_name}    ${SPACE}
    Navigate to Tool Bar Grid Buttons    Print Labels
    Select label Template and Click On Print    ${test_data}
    Verify Expected File is Downloaded into Local
    ${pdf_data}    Read Pdf Data
    Should Contain    ${pdf_data}    ${patient_name}[0]
    Remove Files in Directory

Validate Export Icon In Result Review
    ${RID}    Get First Requisition RID
    Navigate to Tool Bar Grid Buttons    Export
    FOR    ${key}    IN RANGE    3
        ${new.export_locator}    Update Dynamic Value    ${button.result_review.common.export_icon}    export-button-pdf
        Wait For The Element to be Visible    ${new.export_locator}    export button    ${MEDIUM_WAIT}
        Javascript Click    ${new.export_locator}
        Verify Expected File is Downloaded into Local
        ${file_path}    Read File Path    ${PDF_DOWNLOAD_FOLDER}
        ${data}    Read Coloured Pdf    ${file_path}[0]
        ${xls_data}    Convert To String    ${data}
        Should Contain    ${xls_data}    ${RID}
        Remove Files in Directory
    END

Verify Print Label in All Tabs In Result Review
    [Arguments]    ${test_data}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    4
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        Log    Select multiple requisitions and Click on Print Labels from tool bar grid
        Log    Select Label Template<< Enter number of labels for all samples<< Click on set all and click on Print button.
        Verify Print Lables in Result Review    ${test_data}    ${Page_Name}[${key}]
        Log    Verify that the Print Labels Modal is displayed.
        Log    Verify that the print label sample number print labels are displayed in new tab.
    END

Add Tests from Tool Bar Grid
    [Arguments]    ${testdata}
    Navigate to Tool Bar Grid Buttons    Add Test
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Click On The Element    ${button.maximize_window}    maximize page    ${LONG_WAIT}
    ${add_tests_page_title}    Update Dynamic Value    ${label.accesioning.details.submenu}    Add Tests
    Wait For The Element to be Visible    ${add_tests_page_title}    Add Tests page title    ${LONG_WAIT}
    Send Text To Textfield    ${textbox.result_review.tool_bar_grid.add_test.reference_lab}    Reference Lab textbox    ${LONG_WAIT}    ${testdata}[reference_lab]
    Press Keys    None    RETURN
    Click On The Element    ${checkbox.result_review.tool_bar_grid.add_test.panel_test}    Panel-Test Checkbox    ${LONG_WAIT}    seleniumclick
    Perform Actions    Select    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Wait For The Element to be Visible    ${label.result_review.tool_bar_grid.add_test.panel_test.select.add_test_page_title}    Add Test Page title after test added    ${LONG_WAIT}
    Navigate to Start Process and Close Modal Grid
    Wait For Spinner To Disappear    ${spinner.locator}

Verify Add Tests from Tool Bar Grid in All Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    All
    FOR    ${key}    IN RANGE    0    3
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        Select Filter Type in Accesioning    Pending    Infectious Disease
        Click on First Element Details Button
        ${new.button.accesioning.tool-bar-grid-buttons}    Update Dynamic Value    ${button.result_review.requisition_details.tool_bar_grid_buttons}    Add Test
        Click On The Element    ${new.button.accesioning.tool-bar-grid-buttons}    Add Test    ${SHORT_WAIT}    selenium
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Select Test in Add New test Page    ${testdata}
    END

Validate Sample Comments In Result Review
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    4
        Navigate to Tab    ${Page_Name}[${key}]
        Click on First Element Details Button
        Log    Click on Sample Comments Button
        Navigate to Tool Bar Grid Buttons    Sample Comments
        Log    Navigate to Sample Comments Page
        Select Predefined Comments in Reject Comments Page    ${testdata}
        Log    Selected Predefined Comments
        Enter Requirement Comments    ${testdata}[Extended_comment]
        Log    Save sample comments
        Save Activity    ${button.results.save_sample_comment}    ${testdata}[Message]    ${MEDIUM_WAIT}
        Log    Click on Details Button WIth Sample Id
        Click on Detail Button with Sample-id
        Log    Click on Preview Report Button
        Navigate to Requisition Hamburger Sub Menu Options    ${sample_id}    Comments    sample-id
        Wait Until Page Contains    ${testdata}[Extended_comment]
    END

Delete Added Test of Requisition in Result Review
    [Arguments]    ${test_name}
    Navigate to Requisition Hamburger Sub Menu Options    ${test_name}    Delete    sampleid
    Click On The Element    ${button.result_review.details.hamburger_menu.delete.yes}    confirm delete yes popup    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}

Select Test in Add New test Page
    [Arguments]    ${testdata}
    ${add_tests_page_title}    Update Dynamic Value    ${label.accesioning.details.submenu}    Add New Test
    Wait For The Element to be Visible    ${add_tests_page_title}    Add Tests page title    ${LONG_WAIT}
    ${count}    Get Element Count    ${button.result_review.add_test.checkbox_count}
    FOR    ${key}    IN RANGE    1    ${count}
        ${key}    Convert To String    ${key}
        ${new.checkbox.result_review.requisition_details.add_test.select_test}    Update Dynamic Value    ${checkbox.result_review.requisition_details.add_test.select_test}    ${key}
        Click On The Element    ${new.checkbox.result_review.requisition_details.add_test.select_test}    Panel-Test Checkbox    ${LONG_WAIT}
        Perform Actions    Add    ${LONG_WAIT}
        ${status}    Run Keyword And Return Status    Wait Until Page Contains    Error: Error: The test has been already ordered!Please use retest option!    ${SHORT_WAIT}
        Run Keyword If    '${status}'=='True'    Click On The Element    ${new.checkbox.result_review.requisition_details.add_test.select_test}    Panel-Test Checkbox    ${LONG_WAIT}
        Exit For Loop If    '${status}'=='False'
    END