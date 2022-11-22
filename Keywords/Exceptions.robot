*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Add Panels in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"=="Reviewed Critical"    Select Filter Type in Accesioning    Requisition Status    Active
        Run Keyword If    "${Page_Name}[${key}]"=="Reviewed Critical"    Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Panels
        Wait For Spinner To Disappear    ${spinner.locator}
        ${panels_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.accessioning.details.panels.pagetitle}    ${MEDIUM_WAIT}
        Log    "${panels_page_title}"
        Log    "Panels" Page is Displayed
        Click On The Element    ${button.accesioning.pending.add_panel}    Add Panel    ${MEDIUM_WAIT}
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Add Panel Name in Random    10
        ${updated_panel_name_visible_status}    Run Keyword And Return Status    Wait Until Page Contains    ${updated_panel_name}    ${MEDIUM_WAIT}
        Log    "${updated_panel_name_visible_status}"
        Log    "${updated_panel_name}" is visible
        Log    Panels are added to the Requisition in "${Page_Name}[${key}]" Tab.
    END

Verify Error Message without Adding Panel in Panels
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"=="Reviewed Critical"    Select Filter Type in Accesioning    Requisition Status    Active
        Run Keyword If    "${Page_Name}[${key}]"=="Reviewed Critical"    Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Panels
        Wait For Spinner To Disappear    ${spinner.locator}
        ${panels_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.accessioning.details.panels.pagetitle}    ${MEDIUM_WAIT}
        Log    "${panels_page_title}"
        Log    "Panels" Page is Displayed
        Click On The Element    ${button.accesioning.pending.add_panel}    Add Panel    ${MEDIUM_WAIT}
        Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
        Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    Order    ${MEDIUM_WAIT}
        Verify Message    ${label.exceptions.details.panel.add_panel.order.error_message}    ${SHORT_WAIT}
        Log    Error message is displayed and panel is not added in "${Page_Name}[${key}]" Tab.
    END

Reject Sample without Providing Reason and Verify Error Message
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait For Spinner To Disappear    ${spinner.locator}
        ${panels_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.accessioning.details.sample.pagetitle}    ${MEDIUM_WAIT}
        Log    "${panels_page_title}"
        Log    "Panels" Page is Displayed
        Click On The Element    ${button.accesioning.details.samples.first_requaition.reject}    reject    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait For The Element to be Visible    ${textbox.accesioning.details.samples.reject.reason_rejection}    reason rejection    ${LONG_WAIT}
        Clear Element Text    ${textbox.accesioning.details.samples.reject.reason_rejection}
        Click On The Element    ${button.accesioning.details.samples.reject.reject_sample.save}    save    ${LONG_WAIT}    selenium
        ${reason_rejection_error_message}    Update Dynamic Value    ${button.actions}    Reason Rejection is a mandatory field
        Verify Message    ${reason_rejection_error_message}    ${LONG_WAIT}
        Click On The Element    ${button.cross(x)}    close page    ${LONG_WAIT}    selenium
        Log    Requisition is not Rejected and error ""Reason Rejection is a mandatory field"" is displayed in "${Page_Name}[${key}]" Tab.
    END

Validate Error Message without Selecting any Bill in Insurance Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Insurance
        Wait For Spinner To Disappear    ${spinner.locator}
        Log    "Insurance" Page is Displayed
        Run Keyword If    "${Page_Name}[${key}]"!="Reviewed Critical"    Click On The Element    ${textbox.exceptions.details.insurance.bill_textbox}    Insurance Bill    ${LONG_WAIT}    seleniumclick
        ...    ELSE    Click Bill-Type Textbox
        Run Keyword If    "${Page_Name}[${key}]"!="Reviewed Critical"    Click On The Element    ${button.exceptions.details.insurance.bill_textbox.clear}    Clear Insurance Bill    ${LONG_WAIT}    seleniumclick
        ...    ELSE    Clear Bill-Type
        Wait For Spinner To Disappear    ${spinner.locator}
        Click On The Element    ${button.exceptions.details.insurance.save}    Save    ${LONG_WAIT}    seleniumclick
        Verify Message    ${button.client_portal.requisition.details.insurance.bill.save.error_message}    ${MEDIUM_WAIT}
        Click On The Element    ${button.exceptions.details.insurance.save_and_update_patient}    Save and Update the Patient    ${LONG_WAIT}    seleniumclick
        Verify Message    ${button.client_portal.requisition.details.insurance.bill.save.error_message}    ${MEDIUM_WAIT}
        Log    "Bill is a mandatory field" error is displayed in "${Page_Name}[${key}]" Tab.
    END

Validate Error message without Mandatory Fields by selecting Other Insurance Bill
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Insurance
        Wait For Spinner To Disappear    ${spinner.locator}
        Log    "Insurance" Page is Displayed
        Run Keyword If    "${Page_Name}[${key}]"!="Reviewed Critical"    Click On The Element    ${textbox.exceptions.details.insurance.bill_textbox}    Insurance Bill    ${LONG_WAIT}    seleniumclick
        ...    ELSE    Click Bill-Type Textbox
        Wait For Spinner To Disappear    ${spinner.locator}
        Run Keyword If    "${Page_Name}[${key}]"!="Reviewed Critical"    Select Bill Type in Exceptions    Other Insurance
        ...    ELSE    Select Bill Type in Client Portal    Other Insurance
        Wait Until Time    ${MINI_WAIT}
        Click On The Element    ${button.exceptions.details.insurance.save}    Save    ${LONG_WAIT}    seleniumclick
        Verify Message    ${label.exceptions.details.insurance.bill.other_insurance.save.error_message}    ${MEDIUM_WAIT}
        Click On The Element    ${button.exceptions.details.insurance.save_and_update_patient}    Save and Update the Patient    ${LONG_WAIT}    seleniumclick
        Verify Message    ${label.exceptions.details.insurance.bill.other_insurance.save.error_message}    ${MEDIUM_WAIT}
        Log    "mandatory field" Error is displayed in "${Page_Name}[${key}]" Tab.
    END

Select Bill Type in Exceptions
    [Arguments]    ${bill_name}
    Send Text To Textfield    ${textbox.exceptions.details.insurance.bill_textbox}    Insurance bill textbox    ${MEDIUM_WAIT}    ${bill_name}
    Press Keys    None    RETURN

Validate Error Message without Adding Samples in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"!="Rejected" and "${Page_Name}[${key}]"!="On-Hold Ready"    Select Filter Type in Accesioning    Requisition Status    Active
        Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait For Spinner To Disappear    ${spinner.locator}
        ${sample_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.accessioning.details.sample.pagetitle}    ${MEDIUM_WAIT}
        Log    "${sample_page_title}"
        Log    "Sample" Page is Displayed
        Save without Adding Sample in Samples and Verify
        Log    "Type is mandatory field" Error is displayed in "${Page_Name}[${key}]" Tab.
        Click On The Element    ${button.cross(x)}    close page    ${MEDIUM_WAIT}
    END

Validate Error without Selecting File and Filetype to Upload in Attachments
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Attachments
        Wait For Spinner To Disappear    ${spinner.locator}
        ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Attachments
        ${attachments_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${new.label.accesioning.details.submenu}    ${MEDIUM_WAIT}
        Log    "${attachments_page_title}"
        Log    "Attachments" Page is Displayed
        Save File in Attachments with and without Selecting File and Verify Message    ${testdata}
        Log    "Type is mandatory field" Error is displayed in "${Page_Name}[${key}]" Tab.
        Click On The Element    ${button.cross(x)}    close page    ${MEDIUM_WAIT}
    END

Save File in Attachments with and without Selecting File and Verify Message
    [Arguments]    ${testdata}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[button_name]
    Click On The Element    ${new.label.accesioning.details.submenu}    ${testdata}[button_name]    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
    Click On The Element    ${button.exceptions.details.attachments.upload.save}    save    ${MEDIUM_WAIT}
    Verify Message    ${label.exceptions.details.insurance.bill.other_insurance.save.error_message}    ${MEDIUM_WAIT}
    Choose File    ${button.accesioning.attachments.choose_file}    ${upload_file_path_in_clientportal_for_view_document}
    Log    "${upload_file_path_in_clientportal_for_view_document}" is uploaded
    Click On The Element    ${button.exceptions.details.attachments.upload.save}    save    ${MEDIUM_WAIT}
    Verify Message    ${label.exceptions.details.insurance.bill.other_insurance.save.error_message}    ${MEDIUM_WAIT}

Save without Adding Sample in Samples and Verify
    Click On The Element    ${button.accessioning.details.samples.add_sample}    Add_sample    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
    Click On The Element    ${button.accessioning.details.samples.add_samples.save}    save    ${MEDIUM_WAIT}
    Verify Message    ${label.exceptions.details.insurance.bill.other_insurance.save.error_message}    ${MEDIUM_WAIT}

Search for Requisition in Tool Bar in Different Tabs and Verify
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Send Text To Textfield    ${textbox.exceptions.tool_bar.search_textbox}    Tool-bar Search textbox    ${LONG_WAIT}    ${RID}
        Click On The Element    ${button.exceptions.tool_bar.search_icon}    Tool-bar Search icon    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Log    Requisition-"${RID}" is displayed.
        Verify Text Message    ${RID}    ${LONG_WAIT}
        Clear Element Text    ${textbox.exceptions.tool_bar.search_textbox}
        Click On The Element    ${button.exceptions.tool_bar.search_icon}    Tool-bar Search icon    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
    END

Search Requisition in Menu Bar with Invalid checkbox type in Different Tabs and Verify
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${sample_id}    Get Element Attribute    ${label.exceptions.get_sample_id}    title
        @{sample_id_value}    Split String    ${sample_id}    ,
        Log    "@{sample_id_value}" is Received
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        ${sample#}    Get Element Attribute    ${label.exceptions.get_sample#}    title
        @{sample#_value}    Split String    ${sample#}    ,
        Log    "@{sample#_value}" is Received
        @{id_value}    Create List    ${sample_id_value}[0]    ${RID}    ${sample#_value}[0]
        ${search_checkbox}    Split String    ${testdata}[pending_searchcategory_checkbox]    |
        ${search_checkbox_length}    Get Length    ${search_checkbox}
        Set Test Variable    @{id_value}    @{id_value}
        Set Test Variable    ${search_checkbox}    ${search_checkbox}
        Search Requisition with Different Id Values    ${testdata}    ${search_checkbox_length}    Negative
    END

Verify Add Comments in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"=="Reviewed Critical"    Select Filter Type in Accesioning    Requisition Status    Active
        Run Keyword If    "${Page_Name}[${key}]"=="Reviewed Critical"    Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait For Spinner To Disappear    ${spinner.locator}
        ${panels_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.accessioning.details.panels.pagetitle}    ${MEDIUM_WAIT}
        Log    "${panels_page_title}"
        Log    "Panels" Page is Displayed
        Add Samples    ${testdata}
        Add Comments in Exceptions Samples Page    ${testdata}
        Verify Text Message    ${testdata}[comment]    ${MEDIUM_WAIT}
        Click On The Element    ${button.cross(x)}    close    ${MEDIUM_WAIT}    selenium
        ${sample_name}    Set Variable    ${testdata}[comment]
        Set Global Variable    ${sample_name}
    END

Add Comments in Exceptions Samples Page
    [Arguments]    ${testdata}
    ${new.button.accessioning.details.errors.hamburger}    Update Dynamic Value    ${button.exceptions.details.samples.requisitions_hamburger}    ${testdata}[comment]
    ${status}    Wait For The Element to be Visible    ${new.button.accessioning.details.errors.hamburger}    hamburger button    ${MEDIUM_WAIT}
    Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.samples.next_page}
    Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${new.button.accessioning.details.errors.hamburger}    Samples_Hamburger    ${LONG_WAIT}    selenium
    ${new.button.exceptions.details.samples.hamburger_comments_option}    Update Dynamic Value    ${button.exceptions.details.samples.hamburger_comments_option}    ${testdata}[comment]
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${new.button.exceptions.details.samples.hamburger_comments_option}    Comments    ${LONG_WAIT}    selenium
    Wait For Spinner To Disappear    ${spinner.locator}
    Select Frame And Input Req Comments    ${testdata}[comment]    ${frame.accesioning.req-hamburger.reject}
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.accessioning.details.samples.hamburger.comments.add}    Add    ${LONG_WAIT}    selenium

Validate Print Requisition Form in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Log    Remove older pdf files in local
        Remove Files in Directory
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${RID}
        Navigate to Details with Sub-Menu Button Page    ${RID}    Attachments
        ${new.button.accesioning.details.inner_submenu}    Update Dynamic Value    ${button.accesioning.details.inner_submenu}    Print
        Click On The Element    ${new.button.accesioning.details.inner_submenu}    Print Requisition Form    ${MEDIUM_WAIT}
        Read Pdf Data
    END

Verify Edit Samples in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${RID}
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait Until Page Contains Element    ${label.accessioning.details.sample.pagetitle}    ${MEDIUM_WAIT}
        Log    Edit Sample Type in Edit Sample Page
        @{sampletype_option_and_locator}=    Change Sample Type in Exceptions    ${RID}    ${testdata}    ${Page_Name}[${key}]
        Log    Verify Sample Type in Add Sample Page
        Verify Sample Type    ${sampletype_option_and_locator}[1]    ${sampletype_option_and_locator}[0]
    END

Change Sample Type in Exceptions
    [Arguments]    ${sample_id}    ${testdata}    ${page_name}
    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Add Samples    ${testdata}
    ${sample_name_in_rejected_tab}=    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Set Variable    ${testdata}[comment]
    ${new.button.accessioning.details.errors.hamburger}    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Update Dynamic Value    ${button.accesioning.details.attachments.edit}    ${sample_name_in_rejected_tab}=
    ...    ELSE    Update Dynamic Value    ${button.accesioning.details.attachments.edit}    ${sample_name}
    ${new.label.exceptions.details.samples.get_sample_type}    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Update Dynamic Value    ${label.exceptions.details.samples.get_sample_type}    ${sample_name_in_rejected_tab}=
    ...    ELSE    Update Dynamic Value    ${label.exceptions.details.samples.get_sample_type}    ${sample_name}
    Set Test Variable    ${new.label.exceptions.details.samples.get_sample_type}
    Wait For The Element to be Visible    ${new.label.exceptions.details.samples.get_sample_type}    sample type    ${MEDIUM_WAIT}
    ${status}    Wait For The Element to be Visible    ${new.button.accessioning.details.errors.hamburger}    hamburger button    ${MEDIUM_WAIT}
    Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.samples.next_page}
    Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
    ${application_sample_type}    Get Element Attribute    ${new.label.exceptions.details.samples.get_sample_type}    title
    Click On The Element    ${new.button.accessioning.details.errors.hamburger}    edit samples    ${MEDIUM_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Edit Sample
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    edit sample title    ${SHORT_WAIT}
    ${sample_type_option}    ${sample_type_option_locator}    Modify Sample Type    ${testdata}
    Click On The Element    ${button.accesioning.details.samples.edit_sample.save}    save    ${MEDIUM_WAIT}
    Wait For The Element to be Visible    ${new.label.exceptions.details.samples.get_sample_type}    sample type    ${SHORT_WAIT}
    @{sampletype_option_and_locator}=    Create List    ${sample_type_option}    ${sample_type_option_locator}
    [Return]    @{sampletype_option_and_locator}

Modify Sample Type
    [Arguments]    ${testdata}
    Javascript Click    ${textbox.accesioning.details.samples.edit.edit_sample}
    ${sample_type_list}    Split String    ${testdata}[Sample_Type]    ,
    ${count}    Get Length    ${sample_type_list}
    FOR    ${Key}    IN RANGE    ${count}
        ${sample_type_option_locator}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${sample_type_list}[${Key}]
        ${attribute_status}    Get Element Attribute    ${sample_type_option_locator}    class
        ${status}    Run Keyword And Return Status    Should Contain    ${attribute_status}    selected
        Run Keyword If    ${status}==False    Javascript Click    ${sample_type_option_locator}
        ${sample_type_option}    Set Variable    ${sample_type_list}[${Key}]
        Set Test Variable    ${sample_type_option}
        Exit For Loop If    ${status}==False
    END
    [Return]    ${sample_type_option}    ${sample_type_option_locator}

Search Requisition in Menu Bar with Valid checkbox type in Different Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${sample_id}    Get Element Attribute    ${label.exceptions.get_sample_id}    title
        @{sample_id_value}    Split String    ${sample_id}    ,
        Log    "@{sample_id_value}" is Received
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        ${sample#}    Get Element Attribute    ${label.exceptions.get_sample#}    title
        @{sample#_value}    Split String    ${sample#}    ,
        Log    "@{sample#_value}" is Received
        @{id_value}    Create List    ${sample_id_value}[0]    ${RID}    ${sample#_value}[0]
        ${search_checkbox}    Split String    ${testdata}[pending_searchcategory_checkbox]    |
        ${search_checkbox_length}    Get Length    ${search_checkbox}
        Set Test Variable    @{id_value}    @{id_value}
        Set Test Variable    ${search_checkbox}    ${search_checkbox}
        Search Requisition with Different Id Values    ${testdata}    ${search_checkbox_length}
    END

Search Requisition with Invalid Id_value in Different Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Search For Details In Home Page    ${testdata}[comment]    ${testdata}[pending_searchcategory_checkbox]
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait For The Element to be Visible    ${label.homepage.no_records_found}    no records found label    ${MEDIUM_WAIT}
        Log    Requisition with Invalid Id-value-"${testdata}[comment]" with "${testdata}[pending_searchcategory_checkbox]"-checkbox is not displayed.
    END

Navigate to Exceptions Tool Bar Search Field
    [Arguments]    ${id_value}
    Send Text To Textfield    ${textbox.exceptions.tool_bar.search_textbox}    Tool-bar Search textbox    ${LONG_WAIT}    ${id_value}
    Click On The Element    ${button.exceptions.tool_bar.search_icon}    Tool-bar Search icon    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Log    Requisition of-"${id_value}" is displayed.

Search Different Requisitions in Tool Bar Search in Different Tabs.
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${sample_id}    Get Element Attribute    ${label.exceptions.get_sample_id}    title
        @{sample_id_value}    Split String    ${sample_id}    ,
        Log    "@{sample_id_value}" is Received
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        ${sample#}    Get Element Attribute    ${label.exceptions.get_sample#}    title
        @{sample#_value}    Split String    ${sample#}    ,
        Log    "@{sample#_value}" is Received
        @{various_id's}    Create List    ${sample_id_value}[0]    ${RID}    ${sample#_value}[0]
        ${various_id's_length}    Get Length    ${various_id's}
        Search Requisition in Tool Bar and Verify    ${various_id's_length}    ${various_id's}
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Clear Element Text    ${textbox.exceptions.tool_bar.search_textbox}
        Click On The Element    ${button.exceptions.tool_bar.search_icon}    Tool-bar Search icon    ${LONG_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Screenshot.Take Screenshot
    END

Search Requisition in Tool Bar and Verify
    [Arguments]    ${count_value}    ${id_value}
    FOR    ${key}    IN RANGE    0    ${count_value}
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Navigate to Exceptions Tool Bar Search Field    ${id_value}[${key}]
        Run Keyword If    "${id_value}[${key}]"!="${id_value}[2]"    Verify Text Message    ${id_value}[${key}]    ${LONG_WAIT}
        Log    Requisition of "${id_value}[${key}]" is displayed
    END

Send Notification to Contacts in Different Tabs
    [Arguments]    ${testdata}    ${notify_contact_option_selection}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Select Filter Type in Accesioning    Requisition Status    New
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Send Notification to Contact    ${testdata}    ${notify_contact_option_selection}
        Perform Actions    Submit    ${LONG_WAIT}
        ${notification_completed message}    Run Keyword If    '${notify_contact_option_selection}'=='Yes'    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[message]
        Run Keyword If    '${notify_contact_option_selection}'=='Yes'    Verify Message    ${notification_completed message}    ${LONG_WAIT}
        ...    ELSE    Verify Message    ${label.exceptions.details.insurance.bill.other_insurance.save.error_message}    ${MEDIUM_WAIT}
        Run Keyword If    '${notify_contact_option_selection}'=='Yes'    Log    '${testdata}[message]' is displayed.
    END

Select Notify Contact
    [Arguments]    ${testdata}
    Click On The Element    ${textbox.requisition.icon.send_notification.notify_contact}    Notify Contact textbox    ${LONG_WAIT}
    ${notify_contact dropdown_options}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[notify_contact]
    Click On The Element    ${notify_contact dropdown_options}    Notify Contact dropdown options    ${LONG_WAIT}

Send Notification to Contact
    [Arguments]    ${testdata}    ${notify_contact}==Yes
    Click On The Element    ${button.exceptions.first_requisition.icon.send_notification}    send notification    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Click On The Element    ${button.maximize_window}    maximize page    ${LONG_WAIT}
    ${send_notification_pagetitle}    Update Dynamic Value    ${label.accesioning.details.submenu}    Send Notification
    Wait For The Element to be Visible    ${send_notification_pagetitle}    send notification pagetitle    ${LONG_WAIT}
    Run Keyword If    '${notify_contact}'=='Yes'    Select Notify Contact    ${testdata}
    Run Keyword If    '${notify_contact}'=='Yes'    Log    Notified to Contact-'${testdata}[notify_contact]'

Search Requisition with Different Id Values
    [Arguments]    ${testdata}    ${search_checkbox_length}    ${validation}==Positive
    FOR    ${key}    IN RANGE    0    ${search_checkbox_length}
        Search For Details In Home Page    ${id_value}[${key}]    ${search_checkbox}[${key}]
        Log    Searched for Requisition-'${id_value}[${key}]' with '${search_checkbox}[${key}]'-checkbox
        Wait For Spinner To Disappear    ${spinner.locator}
        Run Keyword If    '${validation}'=='Positive' and '${id_value}[${key}]'!='${id_value}[2]'    Wait Until Page Contains    ${id_value}[${key}]    ${MEDIUM_WAIT}
        ...    ELSE    Wait For The Element to be Visible    ${label.homepage.no_records_found}    no records found label    ${MEDIUM_WAIT}
        Run Keyword If    '${validation}'=='Positive' and '${id_value}[${key}]'!='${id_value}[2]'    Log    Requisition -'${id_value}[${key}]' with '${search_checkbox}[${key}]' is displayed
        ...    ELSE    Log    Requisition -'${id_value}[${key}]' with '${search_checkbox}[${key}]' is not displayed
    END

Validate Reject Samples in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${RID}
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait Until Page Contains Element    ${label.accessioning.details.sample.pagetitle}    ${MEDIUM_WAIT}
        Log    Edit Sample Type in Edit Sample Page
        Input Reject Message in Reject Page in Exceptions    ${testdata}    ${Page_Name}[${key}]
    END

Input Reject Message in Reject Page in Exceptions
    [Arguments]    ${testdata}    ${page_name}
    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Add Samples    ${testdata}
    ${sample_name_in_rejected_tab}=    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Set Variable    ${testdata}[comment]
    ${new.button.exceptions.details.samples.reject}    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Update Dynamic Value    ${button.exceptions.details.samples.reject}    ${sample_name_in_rejected_tab}=
    ...    ELSE    Update Dynamic Value    ${button.exceptions.details.samples.requisitions_hamburger}    ${sample_name}
    ${status}    Wait For The Element to be Visible    ${new.button.exceptions.details.samples.reject}    hamburger button    ${MEDIUM_WAIT}
    Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.samples.next_page}
    Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${new.button.exceptions.details.samples.reject}    reject samples    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.accesioning.details.samples.reject.reason_rejection}    reason rejection    ${MEDIUM_WAIT}    ${test_data}[reason_rejection_message]
    Click On The Element    ${button.exceptions.details.samples.reject.save}    save    ${MEDIUM_WAIT}
    Wait Until Time    1
    Wait For Spinner To Disappear    ${spinner.locator}
    ${new.label.exceptions.details.samples.get_reject_status}    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Update Dynamic Value    ${label.exceptions.details.samples.get_reject_status}    ${sample_name_in_rejected_tab}=
    ...    ELSE    Update Dynamic Value    ${label.exceptions.details.samples.get_reject_status}    ${sample_name}
    Wait For The Element to be Visible    ${new.label.exceptions.details.samples.get_reject_status}    sample type    ${MEDIUM_WAIT}
    ${application_rejection_status}    Get Element Attribute    ${new.label.exceptions.details.samples.get_reject_status}    title
    Should Be Equal    Cancelled    ${application_rejection_status}

Modify Location of Sample in Exceptions
    [Arguments]    ${testdata}    ${page_name}
    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Add Samples    ${testdata}
    ${sample_name_in_rejected_tab}=    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Set Variable    ${testdata}[comment]
    ${new.button.accessioning.details.errors.hamburger}    Run Keyword If    '${page_name}'=='Rejected' or '${page_name}'=='Reviewed Critical'    Update Dynamic Value    ${button.exceptions.details.samples.requisitions_hamburger}    ${sample_name_in_rejected_tab}=
    ...    ELSE    Update Dynamic Value    ${button.exceptions.details.samples.requisitions_hamburger}    ${sample_name}
    ${status}    Wait For The Element to be Visible    ${new.button.accessioning.details.errors.hamburger}    hamburger button    ${MEDIUM_WAIT}
    Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.samples.next_page}
    Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${new.button.accessioning.details.errors.hamburger}    Samples_Hamburger    ${LONG_WAIT}    selenium
    ${new.button.exceptions.details.samples.hamburger_edit_location_option}    Update Dynamic Values    ${button.common.details.samples.hamburger_submenu_options}    ${sample_name}    ${testdata}[hamburger_option]
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${new.button.exceptions.details.samples.hamburger_edit_location_option}    edit location    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${textbox.accessioning.details.samples.haburger.edit_location.select_location}    select location textbox    ${MEDIUM_WAIT}    selenium
    ${new.label.accesioning.details.select_location.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[select_sample_location]
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${new.label.accesioning.details.select_location.submenu}
    Click On The Element    ${button.accessioning.details.samples.hamburger.edi_loc.save}    Save    ${MEDIUM_WAIT}

Verify Edit Locations in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${RID}
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait Until Page Contains Element    ${label.accessioning.details.sample.pagetitle}    ${MEDIUM_WAIT}
        Log    Edit Sample Type in Edit Sample Page
        Modify Location of Sample in Exceptions    ${testdata}    ${Page_Name}[${key}]
        Wait For Spinner To Disappear    ${spinner.locator}
        ${new.label.accessioning.details.samples.added_sample.location_name}    Update Dynamic Values    ${label.accessioning.details.samples.added_sample.location_name}    ${sample_name}    ${testdata}[select_sample_location]
        Wait Until Page Contains Element    ${new.label.accessioning.details.samples.added_sample.location_name}    ${MEDIUM_WAIT}
    END

Verify Search in Exceptions Errors Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Set Test Variable    ${RID}
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        ${total_errors_count}    Get Element Count    ${button.exceptions.details.errors.get_error_count}
        ${error_name}    Get Element Attribute    ${label.exceptions.errors.get_first_error_name}    title
        Input Text    ${textbox.exceptions.details.errors.search_error}    ${error_name}
        Click On The Element    ${button.exceptions.details.errors.search}    search button    ${MEDIUM_WAIT}    seleniumclick
        Wait Until Time    ${MINI_WAIT}
        ${count}    Get Element Count    ${button.exceptions.details.errors.get_error_count}
        Run Keyword If    '${count}'!='1'    Fail
        Clear Element Text    ${textbox.exceptions.details.errors.search_error}
        Click On The Element    ${button.exceptions.details.errors.search}    search button    ${MEDIUM_WAIT}    seleniumclick
        Wait Until Time    ${MINI_WAIT}
        ${count}    Get Element Count    ${button.exceptions.details.errors.get_error_count}
        Should Be Equal    ${count}    ${total_errors_count}
    END

Verify Edit Error in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Set Test Variable    ${RID}
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        ${new.button.accesioning.details.errors.edit_added_error}    Update Dynamic Values    ${button.accesioning.details.errors.edit_added_error}    ${added_error}    Edit
        ${status}=    Wait For The Element to be Visible    ${new.button.accesioning.details.errors.edit_added_error}    added_error_name    ${MEDIUM_WAIT}
        Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.errors.next_page}
        Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
        Click On The Element    ${new.button.accesioning.details.errors.edit_added_error}    Edit Error    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Click On The Element    ${textbox.accessioning.details.errors.add.requisition_error_type}    Requisition_Error_Type_Textbox    ${MEDIUM_WAIT}    SeleniumClick
        Click On The Element    ${button.accesioning.details.errors.add.requisition_erroe_type.cross(x)}    Clear_error_type_textbox    ${MEDIUM_WAIT}
        Add Requisition Error Type in Errors    ${testdata}[updated_requisition_error_type]    ${testdata}
        ${new.label.exceptions.errors.edit.error_type}    Update Dynamic Value    ${label.exceptions.errors.edit.error_type}    ${testdata}[updated_requisition_error_type]
        Verify Error Added in Details Errors Page    ${testdata}[updated_requisition_error_type]
        Log    "No Insurance" Error name is Visible
    END

Add New Error in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
        Verify Error Added in Details Errors Page    ${testdata}[comment]
        Log    Verified the "${testdata}[requisition_error_type]" Error
    END

Get Added Error in Exceptions
    [Arguments]    ${testdata}
    ${added_error}    Set Variable    ${testdata}[comment]
    Set Global Variable    ${added_error}

Add Comments to Error in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        ${new.button.accesioning.details.errors.edit_added_error}    Update Dynamic Values    ${button.accesioning.details.errors.edit_added_error}    ${added_error}    Comment
        ${status}=    Wait For The Element to be Visible    ${new.button.accesioning.details.errors.edit_added_error}    added_error_name    ${MEDIUM_WAIT}
        Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.errors.next_page}
        Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
        Click On The Element    ${new.button.accesioning.details.errors.edit_added_error}    Comment button    ${MEDIUM_WAIT}    selenium
        Select Frame And Input Req Comments    ${testdata}[comment]    ${frame.accesioning.req-hamburger.reject}
        Perform Actions    Add Comment    ${MEDIUM_WAIT}
        Verify message    ${message.accesioning.errors.add_comment.added}    ${MEDIUM_WAIT}
        ${new.label.exceptions.details.errors.verify_error_name}    Update Dynamic Value    ${label.exceptions.details.errors.verify_error_name}    ${testdata}[comment]
        Wait For The Element to be Visible    ${new.label.exceptions.details.errors.verify_error_name}    comment name    ${MEDIUM_WAIT}
    END

Verify Resolve Error in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        Resolve Error in Exceptions
    END

Resolve Error in Exceptions
    ${new.button.accesioning.details.errors.edit_added_error}    Update Dynamic Values    ${button.accesioning.details.errors.edit_added_error}    ${added_error}    Resolved
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${new.button.accesioning.details.errors.edit_added_error}    ${MEDIUM_WAIT}    added error is not visible after waiting ${MEDIUM_WAIT} seconds
    Run Keyword If    '${status}'=='True'    Click Element    ${new.button.accesioning.details.errors.edit_added_error}
    Run Keyword If    '${status}'=='False'    Click on Resolve of Created Error    ${new.button.accesioning.details.errors.edit_added_error}
    Verify Message    ${message.accesioning.error.resolve_error.resolved}    ${MEDIUM_WAIT}
    ${Resolved_Tick_Mark}    Update Dynamic Value    ${label.accesioning.details.errors.resolved(tick_mark)}    ${added_error}
    Verify Message    ${Resolved_Tick_Mark}    ${MEDIUM_WAIT}

Click on Resolve of Created Error
    [Arguments]    ${new.button.accesioning.details.errors.edit_added_error}
    Click Element    ${button.accesioning.add_errors.navigate_to_next}
    Wait Until Element Is Visible    ${new.button.accesioning.details.errors.edit_added_error}    ${MEDIUM_WAIT}    added error is not visible after waiting ${MEDIUM_WAIT} seconds
    Click Element    ${new.button.accesioning.details.errors.edit_added_error}

Upload and Delete Attachment in Details Attachment Tab in Different Tabs and Verify
    [Arguments]    ${testdata}    ${delete_attachment}==yes
    @{Page_Name}    Create List    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"!="Rejected" and "${Page_Name}[${key}]"!="On-Hold Ready"    Select Filter Type in Accesioning    Requisition Status    New
        Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Attachments
        Wait For Spinner To Disappear    ${spinner.locator}
        ${attachments_page_label}    Update Dynamic Value    ${label.accesioning.details.submenu}    Attachments
        ${attachments_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${attachments_page_label}    ${MEDIUM_WAIT}
        Log    "${attachments_page_title}"
        Log    "Attachments" Page is Displayed
        Run Keyword If    '${delete_attachment}'!='yes'    Add Attachment in Details Attachment Tab in Exceptions    ${testdata}
        Run Keyword If    '${delete_attachment}'=='yes'    Perform Delete Actions on Attachment in Exceptions and Validate
    END

Delete Attachment in Exceptions Details Tab and Verify
    [Arguments]    ${yes_no}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.exceptions.details.attachment.hamburger}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.exceptions.details.attachment.hamburger.delete}
    ${delete_page_validation}    Update Dynamic Value    ${label.accesioning.details.submenu}    Confirmation required
    ${delete_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${delete_page_validation}    ${MEDIUM_WAIT}
    Log    "${delete_page_title}"
    Perform Actions    ${yes_no}    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}

Perform Delete Actions on Attachment in Exceptions and Validate
    Delete Attachment in Exceptions Details Tab and Verify    No
    ${attachment_name}    Get Element Attribute    ${label.exceptions.details.attachment.first_attachment_name}    title
    Wait Until Page Contains    ${attachment_name}    ${LONG_WAIT}
    Delete Attachment in Exceptions Details Tab and Verify    Yes
    Page Should Not Contain    ${attachment_name}

Add Attachment in Details Attachment Tab in Exceptions
    [Arguments]    ${testdata}
    Choose File in View Documents    ${testdata}    ${upload_file_path_in_clientportal_for_view_document}
    Log    "${upload_file_path_in_clientportal_for_view_document}" is uploaded
    Select File Type    ${testdata}
    Log    "${testdata}[file_type]" is Selected
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.exceptions.details.attachments.upload.save}    save    ${MEDIUM_WAIT}
    Verify Uploaded File

Edit Attachment in Details Attachments in Exceptions
    [Arguments]    ${select_file_type}
    Click On The Element    ${button.exceptions.details.attachments.edit_attachment}    Edit    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    ${edit_page_label}    Update Dynamic Value    ${label.accesioning.details.submenu}    Editing requisition Image
    ${edit_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${edit_page_label}    ${MEDIUM_WAIT}
    Log    "${edit_page_title}"
    Click On The Element    ${textbox.accesioning.attachments.filetype}    "File type" textbox    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.accesioning.attachments.filetype}    "File type" textbox    ${LONG_WAIT}    ${select_file_type}
    Press Keys    None    RETURN
    Log    "${select_file_type}" is selected
    Click On The Element    ${button.exceptions.details.attachments.upload.save}    save    ${MEDIUM_WAIT}

Edit Attachment in Details Attachment in Diffent Tabs in Exceptions and Verify
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"!="Rejected" and "${Page_Name}[${key}]"!="On-Hold Ready"    Select Filter Type in Accesioning    Requisition Status    New
        Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Attachments
        Wait For Spinner To Disappear    ${spinner.locator}
        ${attachments_page_label}    Update Dynamic Value    ${label.accesioning.details.submenu}    Attachments
        ${attachments_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${attachments_page_label}    ${MEDIUM_WAIT}
        Log    "${attachments_page_title}"
        Log    "Attachments" Page is Displayed
        Wait Until Time    ${MINI_WAIT}
        ${file_type}    Get Element Attribute    ${label.exceptions.details.attachment.first_attachment_file-type_name}    title
        Log    "${file_type}"
        Edit Attachment in Details Attachments in Exceptions    Missing Info
        Wait Until Time    ${MINI_WAIT}
        ${edited_file_type}    Get Element Attribute    ${label.exceptions.details.attachment.first_attachment_file-type_name}    title
        Log    "${edited_file_type}"
        Should Not Be Equal    ${file_type}    ${edited_file_type}
    END

Search Attachment Name in Exceptions on Details Attachment Search field and Verify
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"!="Rejected" and "${Page_Name}[${key}]"!="On-Hold Ready"    Select Filter Type in Accesioning    Requisition Status    New
        Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Attachments
        Wait For Spinner To Disappear    ${spinner.locator}
        ${attachments_page_label}    Update Dynamic Value    ${label.accesioning.details.submenu}    Attachments
        ${attachments_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${attachments_page_label}    ${MEDIUM_WAIT}
        Log    "${attachments_page_title}"
        Log    "Attachments" Page is Displayed
        Wait Until Time    ${MINI_WAIT}
        ${file_type}    Get Element Attribute    ${label.exceptions.details.attachment.first_attachment_name}    title
        Log    "${file_type}"
        Send Text To Textfield    ${button.exceptions.details.attachment.search_bar}    attachment search bar    ${MEDIUM_WAIT}    ${file_type}
        Click On The Element    ${button.exceptions.details.attachment.search_bar.search_icon}    attachment search icon    ${MEDIUM_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait Until Page Contains    ${file_type}    ${MEDIUM_WAIT}
        Clear Element Text    ${button.exceptions.details.attachment.search_bar}
        Click On The Element    ${button.exceptions.details.attachment.search_bar.search_icon}    attachment search icon    ${MEDIUM_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Wait Until Time    ${MINI_WAIT}
        ${new.label.common.details.get_all_requisition_count}    Update Dynamic Value    ${label.common.details.get_all_requisition_count}    View Document
        ${total_attachments_count}    Get Element Count    ${new.label.common.details.get_all_requisition_count}
        Log    "${total_attachments_count}"
    END
    
    Verify Reject Requisition in Exceptions Samples
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Set Test Variable    ${RID}
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        ${new.button.accesioning.tool-bar-grid-buttons}    Update Dynamic Value    ${button.accesioning.tool-bar-grid-buttons}    Reject
        Click On The Element    ${new.button.accesioning.tool-bar-grid-buttons}    Reject Requisition    ${MEDIUM_WAIT}
        Select Predefined Comments in Reject Comments Page    ${testdata}
        Log    Selected Predefined Cmments
        Enter Requirement Comments    ${testdata}[Predefined_comment]
        Log    Save sample comments
        Save Activity    ${button.exceptions.firs_req_detailks.samples.reject_requisition.save}    ${testdata}[message]    ${MEDIUM_WAIT}
        Wait For Spinner To Disappear    ${spinner.locator}
        Navigate to Tab    Rejected
        Search For Details In Home Page    ${RID}    ${testdata}[pending_searchcategory_checkbox]
    END

Verify Change Bill Type in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        ${RID}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Log    "${RID}" is Received
        Set Test Variable    ${RID}
        Change Bill Type in Exceptions Insurance and Verify in General Tab    ${RID}    ${testdata}
    END

Change Bill Type in Exceptions Insurance and Verify in General Tab
    [Arguments]    ${RID}    ${testdata}
    ${bill_type_list}    Split String    ${testdata}[Bill_Type]    ,
    ${count}    Get Length    ${bill_type_list}
    FOR    ${Key}    IN RANGE    ${count}
        Change Bill Type    ${testdata}    ${RID}
        Navigate to General and Verify Bill Type is Updated    ${bill_type_option}
        Navigate to Details button    ${RID}
    END

Change Patient Details in General Tab In Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Log    Update Patient Details in General and Verify in General
        ${sample_id}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${sample_id}
        Modify Patient Details and Verify    ${testdata}
    END

Validate Invalid Email in General Tab in Exceptions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Log    Update Patient Details in General and Verify in General
        ${sample_id}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${sample_id}
        Validate Invalid Email Format In General Tab    ${testdata}
    END

Change Bill Type in General In Exceptions
    [Arguments]    ${testdata}
    ${sample_id}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Log    Update Patient Details in General and Verify in General
        ${sample_id}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${sample_id}
        Validate Change Bill Type in General    ${testdata}
    END

Verify Doctor Signed Functionality in General in Exceptions
    [Arguments]    ${testdata}
    ${sample_id}    Create List    On-Hold Ready    MBI    On-Hold    Lab Exception    Rejected    Reviewed Critical
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Exceptions"${Page_Name}[${key}]" Page
        Wait For The Element to be Visible    ${label.tab_menu}    Tab Menu    ${LONG_WAIT}
        Log    Update Patient Details in General and Verify in General
        ${sample_id}    Get Element Attribute    ${label.exceptions.get_requisition_id}    title
        Set Test Variable    ${sample_id}
        Navigate to General Tab and Verify Doctor Signed Functionality    ${testdata}
    END