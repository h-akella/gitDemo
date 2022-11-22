*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Validate Medical Neccesity While Creating Toxicology Requisition
    [Arguments]    ${priority_risk_checkbox_value}    ${Received_from}    ${Medical_necessity_documentation_value}    ${error_message}
    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    Update Dynamic Value    ${button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    ${priority_risk_checkbox_value}
    Click On CheckBox And Verify    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    class    ${SHORT_WAIT}
    Click Element    ${button.client_portal.create_new_requisition.medical_neccesity.done}
    Wait For The Element to be Visible    ${button.new_requisition.save}    save    ${SHORT_WAIT}
    Save Activity    ${button.new_requisition.save}    ${error_message}    ${SHORT_WAIT}
    SeleniumLibrary.Input Text    ${button.clientportal.neworder.submenu.medical_neccesity.received_from}    ${Received_from}
    Log    Entered ${Received_from} text in received from text box
    Click Element    ${button.client_portal.create_new_requisition.medical_neccesity.done}
    Save Activity    ${button.new_requisition.save}    ${error_message}    ${SHORT_WAIT}
    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    Update Dynamic Value    ${button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    ${Medical_necessity_documentation_value}
    Click On CheckBox And Verify    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    class    ${SHORT_WAIT}
    Click Element    ${button.client_portal.create_new_requisition.medical_neccesity.done}

Save Infectious Disease Requisition Without Filling Mandatory Fields
    [Arguments]    ${testdata}
    [Documentation]    Thias Keyword is about verifying Error Messages when Saved the Requisition without filling Mandatory fields
    Comment    Save Requition and Verify Error Messages
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${LONG_WAIT}
    Log    Click on Save and Verify Error Message When Form is Empty
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${LONG_WAIT}
    Log    Selected ${test_data}[clientsitetotype] as client site and Verified Error Message when Clicked on Save
    Select Order Physician    ${testdata}
    Log    Selected ${test_data}[orderphysician_name] as order physician
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${LONG_WAIT}
    Log    Selected ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name and \ Verified Error Message when Clicked on Save
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${LONG_WAIT}
    Log    Selected ${test_data}[site_contact_name] and Verified Error Message when Clicked on Save
    Log    Select syndromic menu filter category
    Select Syndromic Menu Filter Categories    ${testdata}    No    accesioning
    Log    Selected ${testdata}[syndromic_filter_category] as Syndromic FIlter Category and Verified Error Message when Clicked on Save
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${LONG_WAIT}
    Click On The Element    ${button.cross(x)}    close button    ${LONG_WAIT}

Validate Phone Number Field in Create New Patient Field
    [Arguments]    ${testdata}    ${Invaliddata}    ${error_message}
    ${new.button.client_portal.create_new_requisition.create_new}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    patient
    Click On The Element    ${new.button.client_portal.create_new_requisition.create_new}    Create New Paient    ${LONG_WAIT}
    Send Text To Textfield    ${textbox.create_new_patient.mobile_number}    Mobile Number textbox    ${SHORT_WAIT}    ${Invaliddata}
    Log    Click on save
    Submit Page And Verify Text Message    Save    ${error_message}    ${SHORT_WAIT}
    Log    Validated ${testdata}[error_message] by providing ${testdata}[specialcharacters] as input

Get RID Value
    [Arguments]    ${attribute_locator}
    ${RID}    Get Element Attribute    ${label.client_portal.first_requisition_without_attachment}    data-id
    [Return]    ${RID}

Click on Cancel Button in Hamburger
    ${RID}    Get Element Attribute    ${label.client_portal.get_attribute_for_first_requisition_rid}    rel
    Log    Selected Requisition
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Cancel    rid    Confirmation required
    Log    Options are displayed and Cancel page is displayed
    Perform Actions    Yes    ${MEDIUM_WAIT}
    Log    "Yes" button is Clicked
    [Return]    ${RID}

Validate Cancel Button in Client Portal
    [Arguments]    ${testdata}
    ${RID}    Get Element Attribute    ${label.client_portal.get_attribute_for_first_requisition_rid}    rel
    Log    Selected Requisition
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Cancel    rid    Confirmation required
    Log    Options are displayed and Cancel page is displayed
    Perform Actions    Yes    ${MEDIUM_WAIT}
    Log    "Yes" button is Clicked
    Log    Navigated to Requisition-id -"${RID}" "Cancel" Page
    Search ID Value and Verify    ${testdata}    ${RID}
    Log    Searched for "${RID}" - Value

Search ID Value and Verify
    [Arguments]    ${testdata}    ${id_value}
    Search For Details In Home Page    ${id_value}    ${testdata}[pending_searchcategory_checkbox]
    Verify Text Message    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    Verified that the Selected Record is Removed from the Requisition List.

Choose File in View Documents
    [Arguments]    ${testdata}    ${file_to_upload}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[button_name]
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${new.label.accesioning.details.submenu}
    Wait For Spinner To Disappear    ${spinner.result_review.hamburger.cancel_test}
    Choose File    ${button.accesioning.attachments.choose_file}    ${file_to_upload}

Verify Uploaded File
    ${path2}    ${file} =    Split Path    ${upload_file_path_in_clientportal_for_view_document}
    Page Should Contain    ${file}
    Screenshot.Take Screenshot

Navigate to First Requisition View Documents
    ${RID}    Get Element Attribute    ${label.client_portal.get_attribute_for_first_requisition_rid}    rel
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    View Documents    rid    View Documents
    Log    Options are displayed and View Documents page is displayed
    [Return]    ${RID}

Validate comments icon
    Wait Until Page Contains Element    ${icon.client_portal.new_report.requisition_list.comments}    ${MEDIUM_WAIT}    "Comments icon" is not visible until "${MEDIUM_WAIT}" Seconds
    Screenshot.Take Screenshot

Upload File in View Documents and Save
    [Arguments]    ${testdata}    ${upload_file}
    Choose File in View Documents    ${testdata}    ${upload_file}
    Log    File is Uploaded
    Wait Until Time    ${MINI_WAIT}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Log    "Save" button is Clicked
    Wait Until Time    ${MINI_WAIT}
    Verify Text Message    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    Verified that the Error Message "${testdata}[error_message]" is displayed.

Upload File with File Type in View Documents and Save
    [Arguments]    ${testdata}    ${upload_file}
    Choose File in View Documents    ${testdata}    ${upload_file}
    Log    "${upload_file}" is uploaded
    Select File Type    ${testdata}
    Log    "${testdata}[file_type]" is Selected
    Wait Until Time    ${MINI_WAIT}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Log    "Save" button is Clicked
    Verify Uploaded File
    Log    Uploaded File is displayed.

Navigate to First Requisition Comments Page
    [Arguments]    ${testdata}
    ${RID}    Get First Requisition RID
    Add Comments in Hamburger_Comments Page    ${RID}    ${testdata}

Change Requisition Portal Status
    [Arguments]    ${testdata}
    Scroll Element Into View    ${button.client_portal.new_report.requisition_list.portal_status}
    Click On The Element    ${button.client_portal.new_report.requisition_list.portal_status}    portal status    ${SHORT_WAIT}
    Javascript Click    ${textbox.client_portal.new_report.requisition_list.portal_status.select_filter_dropdown_arrow}
    Log    "Select Filter" textbox is Clicked
    ${new.textbox.client_portal.new_report.requisition_list.portal_status.select_filter.replace_value}    Update Dynamic Value    ${textbox.client_portal.new_report.requisition_list.portal_status.select_filter.replace_value}    ${testdata}[portalstatus_selectfiltername]
    Javascript Click    ${new.textbox.client_portal.new_report.requisition_list.portal_status.select_filter.replace_value}
    Log    "${testdata}[portalstatus_selectfiltername]" is Selected from "Select Filter" textbox
    Send Text To Textfield    ${textbox.client_portal.new_report.requisition_list.portal_status.portal_status_textfield}    Portal Status TextFiled    ${SHORT_WAIT}    ${testdata}[portalstatus_portalstatusname]
    Log    "${testdata}[portalstatus_portalstatusname]" is entered into textbox
    Wait Until Time    ${MINI_WAIT}
    Press Keys    None    RETURN
    Javascript Click    ${button.client_portal.new_report.requisition_list.portal_status.filter}
    Wait Until Time    ${MINI_WAIT}
    Log    "Filter" button is Clicked

Send Requisitions with Finalized Status to Preview Report
    [Arguments]    ${testdata}
    Javascript Click    ${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}
    Log    "Requisition Right Arrow" is Clicked
    Select Filter Type in Accesioning    Portal Status    Finalized
    Log    Requisition of "Portal Status" - "${testdata}[portalstatus_portalstatusname]" is Selected
    ${RID}    Get Element Attribute    ${label.client_portal.get_attribute_for_first_requisition_rid}    rel
    Log    "${RID}" is Received
    Click on Home-Page Requisitions Button    ${button.client_portal.new_report.requisition_form.preview_report}    ${RID}
    Log    Requisition "Preview Report" button is Clicked
    Wait Until Page Contains Element    ${page_title.client_portal.new_report.requisition_form.preview_report}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Select File Type
    [Arguments]    ${testdata}
    Click On The Element    ${textbox.accesioning.attachments.filetype}    "File type" textbox    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.accesioning.attachments.filetype}    "File type" textbox    ${LONG_WAIT}    ${testdata}[file_type]
    Press Keys    None    RETURN

Navigate to Result Review To Send Preliminary Report
    ${RID}    Get First Requisition RID
    Log    Send preliminary report
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Send Preliminary Report
    Click On The Element    ${button.accesioning.result_review.confirm_preliminary_report}    confirmation popup    ${SHORT_WAIT}
    ${new.messages.accesioning.common}    Update Dynamic Value    ${messages.accesioning.common}    Preliminary Report Sent!
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${new.messages.accesioning.common}    ${SHORT_WAIT}
    Run Keyword If    '${status}'=='False'    Click On The Element    ${button.accesioning.result_review.confirm_already_sent_preliminary_report}    report already sent popup    ${SHORT_WAIT}
    Wait Until Element Is Visible    ${new.messages.accesioning.common}    ${LONG_WAIT}

Regenerate Requisition Form In Client Portal New Reports Menu and Verify Attachment Icon
    [Arguments]    ${testdata}
    Log    Navigate to New Report page
    Navigate to Module And Tab    Client Portal    New Report
    Search For Details In Home Page    ${RID}    ${testdata}[pending_searchcategory_checkbox]
    Log    modify page to maximum number of pages
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Regenerate Req Form    sample_id
    ${new.label.client_portal.regenrate_form_attachment_icon}    Update Dynamic Value    ${label.client_portal.regenrate_form_attachment_icon}    ${RID}
    Wait For The Element to be Visible    ${new.label.client_portal.regenrate_form_attachment_icon}    attachment    ${MEDIUM_WAIT}

Edit Patient Name
    [Arguments]    ${edit_first_name}    ${edit_last_name}    ${button_name}
    [Documentation]    This keyword is used to edit patient names by passing names as arguement and button name(cancel/update)
    Click Element    ${button.client_portal.new_order.infectious_disease.patient.edit_patient}
    Send Text To Textfield    ${button.client_portal.new_order.infectious_disease.patient.edit_patient.first_name}    "First_name"    ${MEDIUM_WAIT}    ${edit_first_name}
    Send Text To Textfield    ${button.client_portal.new_order.infectious_disease.patient.edit_patient.last_name}    "Last_name"    ${MEDIUM_WAIT}    ${edit_last_name}
    ${new.button.client_portal.new_order.infectious_disease.patient.edit_patient.cancel}    Update Dynamic Value    ${button.client_portal.new_order.infectious_disease.patient.edit_patient.cancel}    ${button_name}
    Click On The Element    ${new.button.client_portal.new_order.infectious_disease.patient.edit_patient.cancel}    ${button_name}    ${MEDIUM_WAIT}

Create New Ordering Provider
    [Arguments]    ${testdata}
    ${new.button.client_portal.create_new_requisition.create_new}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    siteDoctor
    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    first_name
    Log    Navigate to create new order physician page and verify
    Click Element and Verify    ${new.button.client_portal.create_new_requisition.create_new}    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    Create New Order Physician    ${SHORT_WAIT}
    Log    provide ${testdata}[patient_first_name]
    Input Text    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[patient_first_name]
    Log    "${testdata}[patient_first_name]" is entered
    ${new.textbox.lastname.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    last_name
    Log    provide ${testdata}[patient_last_name]
    Send Text To Textfield    ${new.textbox.lastname.client_portal.createnewrequisition.create_new_order_physician}    patient last name    ${MEDIUM_WAIT}    ${testdata}[patient_last_name]
    Log    "${testdata}[patient_last_name]" is entered
    ${new.textbox.suffix.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    suffix
    Log    provide ${testdata}[suffix]
    Send Text To Textfield    ${new.textbox.suffix.client_portal.createnewrequisition.create_new_order_physician}    suffix    ${MEDIUM_WAIT}    ${testdata}[suffix]
    Log    "${testdata}[suffix]" is entered
    ${new.textbox.client_portal.npi.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    npi
    Log    provide ${testdata}[npi]
    Send Text To Textfield    ${new.textbox.client_portal.npi.createnewrequisition.create_new_order_physician}    npi    ${MEDIUM_WAIT}    ${testdata}[npi]
    Log    "${testdata}[npi]" is entered

Validate Ordering Provider with Special Characters
    [Arguments]    ${testdata}
    [Documentation]    This Keyword is used to Validate Error by passing Special Characters in \ Ordering Provider Name Fields.
    Create New Ordering Provider    ${testdata}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Comment    Javascript Click    ${button.create_new_requisition.create_new_order_physician.save}
    Log    Verify new order is created succesfully
    Wait Until Page Contains Element    ${label.client_portal.new_order.infectious_disease.new_ordering_provider.error_message}
    Screenshot.Take Screenshot

Validate Edited Name in Edit Patient Details
    [Arguments]    ${testdata}
    Edit Patient Name    htrx    test    Cancel
    Page Should Contain    ${testdata}[patient_first_name]
    Screenshot.Take Screenshot

Navigate to Advance Features
    [Arguments]    ${sub-menu}
    Click on Advance Features
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${sub-menu}
    Click On The Element    ${new.label.accesioning.details.submenu}    Advance Features SubMenu    ${MEDIUM_WAIT}

Set Future Month Date to Edit Collection Date and Verify Error
    [Arguments]    ${Date_Value}
    Calender Button
    Click On The Element    ${textbox.clientportal.advance_features.edit_collection_date.calender.next_month_arrow(>)}    Month_arrow    ${MEDIUM_WAIT}
    ${new.textbox.clientportal.advance_features.edit_collection_date.calender.day}    Update Dynamic Value    ${textbox.clientportal.advance_features.edit_collection_date.calender.day}    ${Date_Value}
    Click On The Element    ${new.textbox.clientportal.advance_features.edit_collection_date.calender.day}    day    ${MEDIUM_WAIT}
    Click On The Element    ${textbox.clientportal.advance_features.edit_collection_date.calender.ok}    ok    ${MEDIUM_WAIT}
    Click On The Element    ${textbox.accesioning.requisition_completeall.start_processing}    start processing    ${MEDIUM_WAIT}
    Wait Until Page Contains Element    ${textbox.clientportal.advance_features.edit_collection_date.calender.future_date.message}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Verify Requisition Bill type with Invalid and Valid Bills
    [Arguments]    ${Invalid_Bill_type}    ${Valid_Bill_type}
    Click Bill-Type Textbox
    Clear Bill-Type
    Select From List By Label    ${button.client_portal.requisition.details.insurance.bill.dropdown}    ${Invalid_Bill_type}
    Wait For Spinner To Disappear    ${spinner.locator}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Verify Message    ${button.client_portal.requisition.details.insurance.bill.save.error_message}    ${MEDIUM_WAIT}
    Wait Until Time    ${MINI_WAIT}
    Click Bill-Type Textbox
    Select Bill Type in Client Portal    ${Valid_Bill_type}
    Wait For Spinner To Disappear    ${spinner.locator}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Verify Message    ${button.client_portal.requisition.details.insurance.bill.save.message}    ${MEDIUM_WAIT}

Edit Order Column
    [Arguments]    ${field_name_button}
    ${field_name}    Update Dynamic Value    ${button.clientportal.settings_icon.order_column.field_name}    ${field_name_button}
    Wait Until Element Is Visible    ${field_name}    ${MEDIUM_WAIT}    "Field_name" is not visible until "${MEDIUM_WAIT}" seconds
    Mouse Over    ${field_name}
    Screenshot.Take Screenshot
    ${new.button.clientportal.settings_icon.order_column.field_name.edit}    Update Dynamic Value    ${button.clientportal.settings_icon.order_column.field_name.edit}    ${field_name_button}
    Click On The Element    ${new.button.clientportal.settings_icon.order_column.field_name.edit}    "Edit button"    ${MEDIUM_WAIT}    selenium
    Wait Until Page Contains Element    ${label.clientportal.settings_icon.order_column.field_name.edit.pagetitle}
    Screenshot.Take Screenshot

Edit Field name in Order Column and Verify
    [Arguments]    ${field_name_new}
    Click On The Element    ${textbox.clientportal.settings_icon.order_column.field_name.edit.field_caption}    settings fields order column    ${MEDIUM_WAIT}
    Click Element    ${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.clear}
    Send Text To Textfield    ${textbox.clientportal.settings_icon.order_column.field_name.edit.field_caption}    edit field caption textbox    ${MEDIUM_WAIT}    ${field_name_new}
    Click On The Element    ${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.submit}    submit    ${MEDIUM_WAIT}    selenium
    Wait Until Page Contains Element    ${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.submit.message}
    Screenshot.Take Screenshot

Verify Updated Field Name in Data grid
    [Arguments]    ${Updated_Field_Name}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Wait Until Page Contains Element    ${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.submit.message.save.message}
    Screenshot.Take Screenshot
    Wait Until Page Contains    ${Updated_Field_Name}

Get Order Position from Data Grid
    Wait For The Element to be Visible    ${label.clientportal.data_grid.order_position}    data grid sample id    ${MEDIUM_WAIT}
    ${grid_position}    Get Text    ${label.clientportal.data_grid.order_position}
    Set Test Variable    ${grid_position}

Exchange Data Grid Positions and Verify
    Exchange Order Columns    HTRXQZ_ICON    Patients Name
    Wait Until Time    ${MINI_WAIT}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Wait Until Page Contains Element    ${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.submit.message.save.message}
    Screenshot.Take Screenshot
    Should Not Be Equal    ${grid_position}    Patients Name
    Log    Verified that Requisition records are displayed in the saved order.

Validate Export icon in External Role
    Wait Until Time    ${SHORT_WAIT}
    ${new.export_icon.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Export
    Page Should Not Contain Element    ${new.export_icon.label.accesioning.details.submenu}

Click Bill-Type Textbox
    Click On The Element    ${textbox.client_portal.requisition.details.insurance.bill}    "Bill" textbox    ${MEDIUM_WAIT}    seleniumclick

Clear Bill-Type
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.client_portal.requisition.details.insurance.bill.clear}    Bill clear    ${MEDIUM_WAIT}    seleniumclick

Select Bill Type in Client Portal
    [Arguments]    ${Bill_name}
    Send Text To Textfield    ${textbox.client_portal.requisition.details.insurance.bill}    Insurance bill textbox    ${MEDIUM_WAIT}    ${Bill_name}
    Press Keys    None    RETURN

Calender Button
    Click On The Element    ${textbox.clientportal.advance_features.edit_collection_date.calender}    "Calender" button    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Set Date in Edit Collection Date
    [Arguments]    ${Date}
    Calender Button
    ${new.textbox.clientportal.advance_features.edit_collection_date.calender.day}    Update Dynamic Value    ${textbox.clientportal.advance_features.edit_collection_date.calender.day}    ${Date}
    Click On The Element    ${new.textbox.clientportal.advance_features.edit_collection_date.calender.day}    day    ${MEDIUM_WAIT}
    Click On The Element    ${textbox.clientportal.advance_features.edit_collection_date.calender.ok}    ok    ${MEDIUM_WAIT}
    Navigate to Start Process and Close Modal Grid

Actions in Batch Cancel Page
    [Arguments]    ${Confirmation_answer}
    ${Batch_cancel_confirmation}    Update Dynamic Value    ${label.accesioning.details.submenu}    Confirmation required
    Wait Until Page Contains Element    ${Batch_cancel_confirmation}
    Perform Actions    ${Confirmation_answer}    ${MEDIUM_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Batch Cancel
    Wait Until Page Contains Element    ${new.label.accesioning.details.submenu}

Click on Advance Features
    Click On The Element    ${button.clientportal.pending_lab_work.advance_features}    Advance Features    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Verify Order Physician Phone Number
    [Arguments]    ${mobile_no}
    Wait Until Time    ${SHORT_WAIT}
    Send Text To Textfield    ${textbox.clientportal.infectious_disease.new_requisition.new_ordering_provider.phone}    mobile number    ${MEDIUM_WAIT}    ${mobile_no}
    Press Keys    None    RETURN
    Verify Text Message    Invalid phone format    ${SHORT_WAIT}

Cancel Created Requisition
    [Arguments]    ${yes_or_no}
    [Documentation]    This Keyword is used to cancel the requisition by passing yes or no comments into it
    Verify Message    ${label.clientportal.infectious_disease.create_requisition.cancel.page_title}    ${SHORT_WAIT}
    ${new.button.clientportal.infectious_disease.create_requisition.cancel.yes_or_no}    Update Dynamic Value    ${button.clientportal.infectious_disease.create_requisition.cancel.yes_or_no}    ${yes_or_no}
    Click On The Element    ${new.button.clientportal.infectious_disease.create_requisition.cancel.yes_or_no}    ${yes_or_no}    ${MEDIUM_WAIT}
    Wait Until Time    ${MINI_WAIT}

Click Details Button
    [Arguments]    ${Sample_Id}
    Wait Until Time    ${MINI_WAIT}
    ${button.accesioning.req-list_details.by-replace_samp-id.new}    Update Dynamic Value    ${button.accesioning.requisition-details_using_sample-id}    ${Sample_Id}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.accesioning.req-list_details.by-replace_samp-id.new}
    Comment    Click On The Element    ${button.accesioning.req-list_details.by-replace_samp-id.new}    Details
    Wait Until Time    ${MINI_WAIT}
    Wait Until Element Is Not Visible    ${homepage.spinner}    ${LONG_WAIT}

Enter Medical Neccesity Fields and Submit
    [Arguments]    ${priority_risk_checkbox_value}    ${Received_from}    ${Medical_necessity_documentation_value}
    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    Update Dynamic Value    ${button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    ${priority_risk_checkbox_value}
    Click On CheckBox And Verify    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    ${new.button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    class    ${SHORT_WAIT}
    Log    selected and verified checkbox value as ${priority_risk_checkbox_value}
    Send Text To Textfield    ${button.clientportal.neworder.submenu.medical_neccesity.received_from}    Received From Textbox    ${SHORT_WAIT}    ${Received_from}
    Log    Entered ${Received_from} text in received from text box
    ${new.button.clientportal.medical.neccesity.neworder.submenu.medical_neccesity_checkboxes}    Update Dynamic Value    ${button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    ${Medical_necessity_documentation_value}
    Click On CheckBox And Verify    ${new.button.clientportal.medical.neccesity.neworder.submenu.medical_neccesity_checkboxes}    ${new.button.clientportal.medical.neccesity.neworder.submenu.medical_neccesity_checkboxes}    class    ${SHORT_WAIT}
    Log    Selected ${Medical_necessity_documentation_value} radio button and validated its selected
    Click Element    ${button.client_portal.create_new_requisition.medical_neccesity.done}
    Click On The Element    ${button.new_requisition.save}    save    ${SHORT_WAIT}

Validate Upload Signature in Patient Manager Module
    Wait For The Element to be Visible    ${label.page_title.patient_manager}    Patient Manager Title    ${MEDIUM_WAIT}
    Mouse Over    ${button.patient_signature.first_requisition_hamburger.}
    Click On The Element    ${button.patient_signature.first_requisition_hamburger.upload_signature}    Upload Signature    ${MEDIUM_WAIT}
    Wait For The Element to be Visible    ${button.patient_signature.upload_signature.choose_file}    Choose FIle to Upload    ${MEDIUM_WAIT}
    Choose File    ${button.patient_signature.upload_signature.choose_file}    ${upload_file_path_in_clientportal_for_view_document}
    ${new.button.patient_signature.upload_signature.delete_button}    Update Dynamic Value    ${button.patient_signature.upload_signature.actions}    Delete
    ${new.button.patient_signature.upload_signature.view_button}    Update Dynamic Value    ${button.patient_signature.upload_signature.actions}    View
    ${new.button.patient_signature.upload_signature.download_button}    Update Dynamic Value    ${button.patient_signature.upload_signature.actions}    Download
    Wait Until Time    2
    Click On The Element    ${new.button.patient_signature.upload_signature.view_button}    View button    ${MEDIUM_WAIT}
    Wait Until Time    3
    ${windows}    Get Window Handles
    ${count}    Get Length    ${windows}
    Should Be Equal As Numbers    ${count}    2
    Click On The Element    ${new.button.patient_signature.upload_signature.download_button}    Download    ${MEDIUM_WAIT}
    Wait Until Time    8
    File Should Exist    ${downloads_pdf_file}
    Click On The Element    ${new.button.patient_signature.upload_signature.delete_button}    Delete    ${MEDIUM_WAIT}
    Click On The Element    ${button.accesioning.details.samples.add_sample.delete.yes}    confirm delete    ${MEDIUM_WAIT}
    Wait Until Element Is Not Visible    ${new.button.patient_signature.upload_signature.delete_button}    ${MEDIUM_WAIT}    delete button is still visible after waiting ${MEDIUM_WAIT} seconds

Select Drop Down Option by Input Text
    [Arguments]    ${arrow_locator}    ${value_locator}    ${textbox_locator}    ${text_to_input}    ${wait_time}
    SeleniumLibrary.Scroll Element Into View    ${arrow_locator}
    SeleniumLibrary.Set Focus To Element    ${arrow_locator}
    CustomLibrary.Javascript Click    ${arrow_locator}
    Wait For Spinner To Disappear    ${spinner.locator}
    Send Text To Textfield    ${textbox_locator}    ${element_name}    ${wait_time}    ${text_to_input}
    Wait Until Time    1
    Wait For Spinner To Disappear    ${spinner.locator}
    Wait Until Time    2
    SeleniumLibrary.Scroll Element Into View    ${value_locator}
    SeleniumLibrary.Set Focus To Element    ${value_locator}
    SeleniumLibrary.Click Element    ${value_locator}
    Wait For Spinner To Disappear    ${spinner.locator}
    Take Screenshot

Create Patient with Patient Portal Bill Type
    [Arguments]    ${testdata}
    Input All Fields in Create New Patient And Verify Cancel Button    ${testdata}
    Input Text    ${textbox.create_new_patient.address}    ${testdata}[patient_adress]
    Input Text    ${textbox.create_new_patient.mobile_number}    ${testdata}[phone_number]
    Perform Actions    Save    ${LONG_WAIT}
    Wait Until Page Contains    Patient saved    ${LONG_WAIT}

Verify Doctor Signature Label in Collector Acknowledgement
    Click Provider Acknowledgement Button
    Page Should Not Contain Element    ${label.create_new_requisition.doctor_signature_label}
    Screenshot.Take Screenshot

Select Covid-19 Category in Infectious Disease
    [Arguments]    ${testdata}
    Click On The Element    ${button.create_new_requisition.syndromic_menu_filter.covid_disease_category}    Covid-19 subcategory    ${LONG_WAIT}
    Select Covid Disease Category and Swap Site    ${testdata}

Click AOE Button
    Click On The Element    ${button.infectious_disease.aoe}    AOE button    ${LONG_WAIT}
    Wait Until Page Contains Element    ${label.infectious_disease.aoe.page_title}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Select Covid-19 Symptoms Option in AOE
    [Arguments]    ${symptoms_answer}
    Wait For The Element to be Visible    ${textfield.infectious_disease.aoe.symptoms_of_covid-19}    covid-19_syptoms    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textfield.infectious_disease.aoe.symptoms_of_covid-19}    symptoms textfield    ${MEDIUM_WAIT}    ${symptoms_answer}
    ${new.button.infectious_disease.aoe.symptoms_of_covid-19.yes_no_options}    Update Dynamic Value    ${button.infectious_disease.aoe.symptoms_of_covid-19.yes_no_options}    ${symptoms_answer}
    Click On The Element    ${new.button.infectious_disease.aoe.symptoms_of_covid-19.yes_no_options}    covid option    ${LONG_WAIT}    selenium

Select Future Date for Covid-19 Symptoms and Verify
    ${date}    Get Future Date
    Send Text To Textfield    ${textbox.new_requisition.create_new_patient.DOB}    patient dob    ${SHORT_WAIT}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Verify Text Message    Date can not be in the future    ${SHORT_WAIT}

Select Previous Date for Covid-19 Symptoms and Verify
    ${date}    Get Current Date
    ${previous_date}    Subtract Time From Date    ${date}    60days    result_format=%m/%d/%Y
    Send Text To Textfield    ${textbox.new_requisition.create_new_patient.DOB}    date textfield    ${SHORT_WAIT}    ${previous_date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Verify Text Message    Date can not be older than 60 days    ${SHORT_WAIT}

Covid-19 Symptoms Yes or No in AOE
    [Arguments]    ${Yes_No}
    Select Covid-19 Symptoms Option in AOE    ${Yes_No}
    Click On The Element    ${button.infectious_disease.aoe.done}    Done    ${MEDIUM_WAIT}

Create Patient with Medicaid Bill Type
    [Arguments]    ${testdata}
    ${select_gender_option}    Input All Fields in Create New Patient And Verify Cancel Button    ${testdata}
    Edit New Patient with Bill Type Medicaid    ${testdata}
    Perform Actions    Save    ${LONG_WAIT}
    Wait Until Page Contains    Patient saved    ${LONG_WAIT}

Create Patient with Workers Compensation Bill Type
    [Arguments]    ${testdata}
    ${select_gender_option}    Input All Fields in Create New Patient And Verify Cancel Button    ${testdata}
    Edit New Patient with Workers compensation Bill type    ${testdata}
    Perform Actions    Save    ${LONG_WAIT}
    Wait Until Page Contains    Patient saved    ${LONG_WAIT}

Create Patient with Medicare Bill Type
    [Arguments]    ${testdata}
    Input All Fields in Create New Patient And Verify Cancel Button    ${testdata}
    Edit New Patient with Medicare Bill type    ${testdata}
    Perform Actions    Save    ${LONG_WAIT}
    Wait Until Page Contains    Patient saved    ${LONG_WAIT}

Edit Requisition Details In Insurance Tab in Client Portal
    [Arguments]    ${testdata}
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Primary Relationship To Insured
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Primary Relationship To Insured textbox    ${LONG_WAIT}    Self
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${homepage.spinner}
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Relationship
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Relationship textbox    ${LONG_WAIT}    Mother
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${homepage.spinner}
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Email
    Wait Until Time    ${MINI_WAIT}
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Email textbox    ${LONG_WAIT}    ${testdata}[guarantor_email]
    Press Keys    None    RETURN
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Phone
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Phone textbox    ${LONG_WAIT}    ${testdata}[phone_number]
    Press Keys    None    RETURN
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor First Name
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor First Name textbox    ${LONG_WAIT}    ${testdata}[patient_first_name]
    Press Keys    None    RETURN
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Last Name
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Last Name textbox    ${LONG_WAIT}    ${testdata}[patient_last_name]
    Press Keys    None    RETURN
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Gender
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Guarantor Gender textbox    ${LONG_WAIT}    ${testdata}[gender]
    Press Keys    None    RETURN
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.clientportal.requisition.details.insurance.bill.other_insurance.guarantor_dob}    Guarantor DOB    ${LONG_WAIT}
    ${new.button.clientportal.settings_icon.order_column.field_name}    Update Dynamic Value    ${button.clientportal.settings_icon.order_column.field_name}    Prev
    Click On The Element    ${new.button.clientportal.settings_icon.order_column.field_name}    Previous month    ${LONG_WAIT}
    ${new.button.accesioning.details.sub-menu}    Update Dynamic Value    ${button.accesioning.details.sub-menu}    5
    Click On The Element    ${new.button.accesioning.details.sub-menu}    date value    ${LONG_WAIT}
    Click On The Element    ${button.clientportal.requisition.details.insurance.bill.other_insurance.guarantor_address}    Guarantor Address    ${LONG_WAIT}
    Click On The Element    ${button.clientportal.requisition.details.insurance.bill.other_insurance.guarantor_address.same_as_patient}    Guarantor address same as patient    ${LONG_WAIT}
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Primary Insurance Policy Number
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Primary Insurance Policy Number textbox    ${LONG_WAIT}    ${testdata}[npi]
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${homepage.spinner}
    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Update Dynamic Value    ${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Primary Insurance
    Send Text To Textfield    ${new.textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    Primary Insurance textbox    ${LONG_WAIT}    SELF PAY
    Wait Until Time    ${MINI_WAIT}
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${homepage.spinner}

Navigate to Insurance Page and Select Bill Type in Client Portal
    Click On The Element    ${button.clientportal.htrxicon.arrow}    HTRXQZ_icon_arrow    ${MEDIUM_WAIT}    seleniumclick
    Wait For Spinner To Disappear    ${spinner.locator}
    Get First Requisition RID
    Log    "${RID}" is received
    Log    Click on requisition details.
    Navigate to Details with Sub-Menu Button Page    RHTRX${RID}    Insurance
    Log    "Insurance" is Clicked
    Wait For Spinner To Disappear    ${spinner.locator}
    Select Bill Type in Client Portal    Other Insurance
