*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Create New Order Physician and Verify
    [Arguments]    ${testdata}
    ${new.button.client_portal.create_new_requisition.create_new}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    siteDoctor
    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    first_name
    Log    Navigate to create new order physician page and verify
    Click Element and Verify    ${new.button.client_portal.create_new_requisition.create_new}    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    Create New Order Physician    ${SHORT_WAIT}
    Input Text    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[patient_first_name]
    ${new.last_name_textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    last_name
    Log    provide ${testdata}[patient_last_name]
    Input Text    ${new.last_name_textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[patient_last_name]
    ${new_suffix.textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    suffix
    Log    provide ${testdata}[suffix]
    Input Text    ${new_suffix.textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[suffix]
    ${new_npi_textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    npi
    Log    provide ${testdata}[npi]
    Input Text    ${new_npi_textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[npi]
    Javascript Click    ${button.create_new_requisition.create_new_order_physician.save}
    Log    Verify new order is created succesfully
    ${new.message.common.create_new_requisition}    Update Dynamic Value    ${message.common.create_new_requisition}    Doctor saved
    Wait Until Element Is Visible    ${new.message.common.create_new_requisition}    ${MEDIUM_WAIT}    messages not displayed after waiting ${MEDIUM_WAIT} seconds

Validate Create New Order Physician without filling Mandatory Fields
    [Arguments]    ${testdata}
    ${new.button.client_portal.create_new_requisition.create_new}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    siteDoctor
    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    first_name
    Log    Navigate to create new order physician page and verify
    click element    ${new.button.client_portal.create_new_requisition.create_new}
    Wait Until Element Is Visible    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    ${MEDIUM_WAIT}    first name texbox is not visible after waiting ${MEDIUM_WAIT}seconds
    Javascript Click    ${button.new_requisition.save}
    Page Should Contain    ${testdata}[error_message]
    Input Text    ${new.textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[patient_first_name]
    Javascript Click    ${button.new_requisition.save}
    Page Should Contain    ${testdata}[error_message]
    ${lastname.textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    last_name
    Input Text    ${lastname.textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[patient_last_name]
    Javascript Click    ${button.new_requisition.save}
    Page Should Contain    ${testdata}[error_message]
    ${suffix_textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    suffix
    Input Text    ${suffix_textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[suffix]
    Javascript Click    ${button.new_requisition.save}
    Page Should Contain    ${testdata}[error_message]
    ${npi.textbox.client_portal.createnewrequisition.create_new_order_physician}    Update Dynamic Value    ${textbox.client_portal.createnewrequisition.create_new_order_physician}    npi
    Input Text    ${npi.textbox.client_portal.createnewrequisition.create_new_order_physician}    ${testdata}[npi]
    Javascript Click    ${button.new_requisition.save}
    Page Should Contain    ${testdata}[error_message]

Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Javascript Click    ${button.client_portal.create_new_requisition.syndromic_menu_filter.ketamine_option}
    Wait Until Element Is Visible    ${button.select_present_time}    ${LONG_WAIT}    Current time button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.select_present_time}

Cancel Create Patient and Verify
    [Arguments]    ${testdata}    ${menu}=clientportal
    ${new.button.client_portal.create_new_requisition.create_new}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    patient
    Click On The Element    ${new.button.client_portal.create_new_requisition.create_new}    Create New Patient    ${LONG_WAIT}    seleniumClick
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.patient_bill_category}    ${LONG_WAIT}    Bill category button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${textbox.new_requisition.create_new_patient.patient_bill_category}
    ${patient_bill_dropdown}    Run Keyword If    '${menu}'=='clientportal'    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    ${testdata}[patient_bill]
    ...    ELSE    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[patient_bill]
    Wait Until Element Is Visible    ${patient_bill_dropdown}    ${LONG_WAIT}    Patient bill options is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${patient_bill_dropdown}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.first_name}    ${LONG_WAIT}    Patient first name textbox is not visible after waiting ${LONG_WAIT} seconds
    ${patient_name}    Set Variable    ${testdata}[patient_first_name]    ${testdata}[patient_last_name]
    Set Global Variable    ${patient_name}
    Input Text    ${textbox.new_requisition.create_new_patient.first_name}    ${patient_name}[0]
    Input Text    ${textbox.new_requisition.create_new_patient.last_name}    ${patient_name}[1]
    ${date}    Get 2 Days Previous Date
    Input Text    ${textbox.new_requisition.create_new_patient.DOB}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Javascript Click    ${textbox.new_requisition.create_new_patient.select_gender}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[gender]
    Javascript Click    ${new.dropdown_for_suggestion.new_requisition}
    Javascript Click    ${button.client_portal.create_new_patient.cancel}
    Page Should Not Contain    Patient saved

Update Patient
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${button.client_portal.create_new_patient.edit}    ${MEDIUM_WAIT}    Edit Patient Button is not visible After waiting ${MEDIUM_WAIT} seconds
    Wait Until Time    1
    Javascript Click    ${button.client_portal.create_new_patient.edit}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.first_name}    ${MEDIUM_WAIT}    First name textbox is not visible After waiting ${MEDIUM_WAIT} seconds
    Clear Element Text    ${textbox.new_requisition.create_new_patient.first_name}
    Wait Until Time    2
    Input Text    ${textbox.new_requisition.create_new_patient.first_name}    ${testdata}[patient_updated_name]
    Wait Until Time    2
    Click Element    ${button.create_new_requisition.update_patient}
    ${new.message.common.create_new_requisition}    Update Dynamic Value    ${message.common.create_new_requisition}    Patient updated
    Wait Until Element Is Visible    ${new.message.common.create_new_requisition}    ${LONG_WAIT}

Verify Updated Patient
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${textbox.new_requisition.patientname}    ${LONG_WAIT}
    Click Element    ${textbox.new_requisition.patientname}
    ${new.textbox.create_new_patient.updated_patient_name}    Update Dynamic Value    ${textbox.create_new_patient.updated_patient_name}    ${testdata}[patient_updated_name]
    Wait Until Element Is Visible    ${new.textbox.create_new_patient.updated_patient_name}    ${MEDIUM_WAIT}    First name textbox is not visible After waiting ${MEDIUM_WAIT} seconds

Validate Documents Page Screen With Insurance Bill Type For Patient
    Javascript Click    ${button.create_new_requisition.documents}
    Wait Until Element Is Visible    ${label.create_new_requisition.documents.title}    ${LONG_WAIT}    Documents Page Title is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.create_new_requisition.documents.done}
    Javascript Click    ${button.new_requisition.save}
    Wait Until Page Contains    Please attache the insurance document    ${LONG_WAIT}

Upload Files in Documents Page and Validate Error Messages
    Javascript Click    ${button.create_new_requisition.documents}
    Wait Until Element Is Visible    ${label.create_new_requisition.documents.title}    ${LONG_WAIT}    Documents Page Title is not visible after waiting ${LONG_WAIT} seconds
    Choose File    ${button.create_new_requitition.select_insurance_attached_bill_type.documents.upload}    ${TESTDATA_FOLDER}//sampletxtfile.txt
    Verify Text Message    Only pdf and png files are allowed    ${MEDIUM_WAIT}
    Choose File    ${button.create_new_requitition.select_insurance_attached_bill_type.documents.upload}    ${TESTDATA_FOLDER}/sampledocxfile.docx
    Verify Text Message    Only pdf and png files are allowed    ${MEDIUM_WAIT}
    Choose File    ${button.create_new_requitition.select_insurance_attached_bill_type.documents.upload}    ${TESTDATA_FOLDER}/QA_TestData.xls
    Verify Text Message    Only pdf and png files are allowed    ${MEDIUM_WAIT}

Upload PDF File in Requisitions Documents Page
    [Arguments]    ${file_type}    ${file_type_index}
    Click On The Element    ${button.create_new_requisition.documents}    documents button    ${MEDIUM_WAIT}
    Wait For The Element to be Visible    ${label.create_new_requisition.documents.title}    Documents Page Title    ${LONG_WAIT}
    Choose File    ${button.create_new_requitition.select_insurance_attached_bill_type.documents.upload}    ${upload_file_path_in_clientportal_for_view_document}
    ${new.dropdown.create_requisition.documents.filetype}    Update Dynamic Value    ${dropdown.create_requisition.documents.filetype}    ${file_type_index}
    Click On The Element    ${new.dropdown.create_requisition.documents.filetype}    file type    ${MEDIUM_WAIT}
    Perform Actions    ${file_type}    ${SHORT_WAIT}
    Click On The Element    ${button.create_new_requisition.documents.done}    done    ${MEDIUM_WAIT}

Create Requisition With Patient Bill Type Insurance Attached and Upload FIle In Documents Page
    [Arguments]    ${testdata}
    Input Mandatory Fields For New Requisition With Patient Bill Type Insurance Attached    ${testdata}
    Upload PDF File in Requisitions Documents Page    ${testdata}[file_type]    ${testdata}[file_type_index]
    Click On The Element    ${button.new_requisition.save}    Save Button    ${MEDIUM_WAIT}
    Provide Acknowledgement    ${testdata}
    Confirm Requisition
    Wait Until Time    5

Input Mandatory Fields For New Requisition With Patient Bill Type Insurance Attached
    [Arguments]    ${testdata}
    Select Client Site    ${testdata}
    Log    Selected ${testdata}[clientsitetotype] as client site
    Select Order Physician    ${testdata}
    Log    Selected ${testdata}[orderphysician_name] as order physician
    Create New Patient With Insurance Type    ${testdata}
    Log    Select syndromic Menu Filter
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Log    Select ICS code for new requisition
    Select Updated Ics Code    ${testdata}

Select Covid Disease Category and Swap Site
    [Arguments]    ${testdata}
    Click On The Element    ${checkbox.create_new_requisition.covid_only}    Covid disease checkbox    ${SHORT_WAIT}
    Wait Until Element Is Visible    ${button.select_present_time}    ${LONG_WAIT}    Current time button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.select_present_time}
    Wait Until Element Is Visible    ${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}    ${LONG_WAIT}    Swab site dropdown is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[swap_site_category]
    Wait Until Element Is Visible    ${new.dropdown_for_suggestion.new_requisition}    ${LONG_WAIT}    Syndromic menu filter button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${new.dropdown_for_suggestion.new_requisition}
    Screenshot.Take Screenshot

Select Address of Patient For New Requisition
    [Arguments]    ${test_data}
    ${textbox.new_requisition.zipcode_textbox}    Update Dynamic Value    ${textbox.create_new_requisition.patient_address}    zipcode
    ${textbox.new_requisition.plus4_textbox}    Update Dynamic Value    ${textbox.create_new_requisition.patient_address}    plus4_code
    ${textbox.new_requisition.county_textbox}    Update Dynamic Value    ${textbox.create_new_requisition.patient_address}    county
    ${textbox.new_requisition.country_textbox}    Update Dynamic Value    ${textbox.create_new_requisition.patient_address}    country
    Input Text    ${textbox.create_new_requisition. create_patient.city}    ${test_data}[city]
    Input Text    ${textbox.new_requisition.zipcode_textbox}    ${test_data}[zipcode]
    Input Text    ${textbox.new_requisition.plus4_textbox}    ${test_data}[plus4code]
    Wait until Time    1
    Input Text    ${textbox.new_requisition.county_textbox}    ${test_data}[county]
    Input Text    ${textbox.new_requisition.county_textbox}    ${test_data}[country]
    Wait Until Time    2
    Click On The Element    ${textbox.create_new_requisition.patient_address.select_state}    statetextbox    ${SHORT_WAIT}
    ${dropdown.new_requisition.patient_address.state_option_locator}    Update Dynamic Value    ${messages.accesioning.common}    ${test_data}[stateoption]
    Click On The Element    ${dropdown.new_requisition.patient_address.state_option_locator}    state option    ${SHORT_WAIT}

Select Race And Ethnicity For Patient
    [Arguments]    ${testdata}
    ${new.textbox.create_new_requisition.patient_address.race_id_textbox}    Update Dynamic Value    ${textbox.create_new_requisition.patient_address_edit}    race_id
    ${new.textbox.create_new_requisition.patient_address.ethnicity_id_textbox}    Update Dynamic Value    ${textbox.create_new_requisition.patient_address_edit}    ethnicity_id
    ${new.textbox.create_new_requisition.patient_address.race_id_dropdown_option}    Update Dynamic Value    ${messages.accesioning.common}    Asian
    ${new.textbox.create_new_requisition.patient_address.ethnicity_id_dropdown_option}    Update Dynamic Value    ${messages.accesioning.common}    Hispanic or Latino
    Input Text    ${new.textbox.create_new_requisition.patient_address.race_id_textbox}    ${testdata}[race]
    Click On The Element    ${new.textbox.create_new_requisition.patient_address.race_id_dropdown_option}    asian race    ${SHORT_WAIT}
    Input Text    ${new.textbox.create_new_requisition.patient_address.ethnicity_id_textbox}    ${testdata}[ethnicity]

Provide Patient Address
    [Arguments]    ${testdata}
    Log    Selected ${testdata}[syndromic_filter_category] as Syndromic FIlter Category
    Wait Until Element Is Visible    ${textbox.create_new_requisition.patient_delivery_address}    ${LONG_WAIT}
    Input Text    ${textbox.create_new_requisition.patient_delivery_address}    ${test_data}[patient_address]
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${button.create_new_requisition.patient_address_dropdown}
    Run Keyword If    '${status}'=='True'    Click On The Element    ${button.create_new_requisition.patient_address_dropdown}    patientaddress    ${MEDIUM_WAIT}    selenium
    Run Keyword If    '${status}'=='False'    Select Address of Patient For New Requisition    ${testdata}
    Select Race And Ethnicity For Patient    ${testdata}

Create New Requisition For Sample Id
    [Arguments]    ${new_requisition_testdata}    ${patient_validation}=None
    Create New Requisition    ${new_requisition_testdata}    infectious_syndromic_menu
    Log    Read Data From PDF For Sample ID
    ${file_path}    Read Data From Pdf
    Remove Files in Directory

Validate Edit Patient Page
    [Arguments]    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Input Text    ${textbox.new_requisition.patientname}    ${updated_patient_name}[0] ${updated_patient_name}[1]
    ${updated_patient_name}    Set Variable    ${updated_patient_name}[0] ${updated_patient_name}[1]
    ${new.dropdown.create_req.patient_name}    Update Dynamic Value    ${dropdown.create_req.patient_name}    ${updated_patient_name}
    Wait Until Element Is Visible    ${new.dropdown.create_req.patient_name}    ${MEDIUM_WAIT}
    Javascript Click    ${new.dropdown.create_req.patient_name}
    ${new.button.client_portal.create_new_requisition.edit_patient}    Update Dynamic Value    ${button.client_portal.create_new_requisition.edit_patient}    patient
    ${new.page_title.client_portal.create_new_requisition.edit_patient}    Update Dynamic Value    ${button.client_portal.create_new_requisition.edit_patient}    Edit Patient
    Wait Until Element Is Visible    ${new.button.client_portal.create_new_requisition.edit_patient}    ${MEDIUM_WAIT}    Edit Patient Button is not visible after waiting ${MEDIUM_WAIT} seconds
    Click Element    ${new.button.client_portal.create_new_requisition.edit_patient}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.patient_bill_category}    ${LONG_WAIT}    Bill category button is not visible after waiting ${LONG_WAIT} seconds
    ${patient_name}    Get Text    ${label.create_new_requisition.edit_patient.page_title}
    Should Contain    ${patient_name}    ${updated_patient_name}[0]
    Should Contain    ${patient_name}    ${updated_patient_name}[1]
    ${new.label.create_new_requisition.create_new_patient.get_attribute_for_gender}    Update Dynamic Value    ${label.create_new_requisition.create_new_patient.get_attribute_for_gender}    ${testdata}[gender]
    ${application_gender}    Get Element Attribute    ${new.label.create_new_requisition.create_new_patient.get_attribute_for_gender}    class
    Should Contain    ${application_gender}    selected
    Click Element    ${button.create_new_patient.edit.update}

Create New Infectious Disease Requisition From Accesioning
    [Arguments]    ${testdata}    ${sign_yes_or_no}
    [Documentation]    This Keyword is about creating infectious disease requisition from accesioning module
    Log    Verify user able to Create New requisition
    Log    Select ${test_data}[clientsitetotype] as client
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Log    Verify user is able to select order physician
    Select Order Physician    ${testdata}
    Log    Selected ${test_data}[orderphysician_name] as order physician
    Log    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Log    Verify user is able to create New Patient
    Input All Fields in Create New Patient Page    ${testdata}    accesioning
    Log    Created New Patient
    Log    Select the Syncromic Filter Categories
    Select Syndromic Menu Filter Categories    ${testdata}    No    accesioning
    Click On The Element    ${button.accesioning.infectioius_disease.date_received.present_now_time}    present_now_time    ${MEDIUM_WAIT}    seleniumclick
    Send Text To Textfield    ${textbox.accesioning.infectious_disease.new_requisition.tracking_number}    tracking number textbox    ${MEDIUM_WAIT}    ${testdata}[qa_tracking_number_unique]
    ${test_tracking_number}    Set Variable    ${testdata}[qa_tracking_number_unique]
    Set Test Variable    ${test_tracking_number}
    Send Text To Textfield    ${textbox.create_new_order.swab.site.note}    swab site note    ${MEDIUM_WAIT}    test_qa
    ${new.radio_button.create_new_requisition.doctor_signed}    Update Dynamic Value    ${radio_button.create_new_requisition.doctor_signed}    ${sign_yes_or_no}
    Click Element    ${new.radio_button.create_new_requisition.doctor_signed}
    Save Requisition
    Log    Saved the requisition
    Log    Provided Acknowledgement for confirming the requisition***
    Screenshot.Take Screenshot
    Confirm Requisition
    Log    Confirmed the requisition
    Log    We are inserting 10 seconds of static wait here to download the pdf file for sample id
    Wait Until Time    10

Input All Fields in Create New Patient And Verify Cancel Button
    [Arguments]    ${testdata}
    ${new.button.client_portal.create_new_requisition.create_new_patient}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    patient
    Click On The Element    ${new.button.client_portal.create_new_requisition.create_new_patient}    Create New Patient    ${LONG_WAIT}    seleniumClick
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.patient_bill_category}    ${LONG_WAIT}    Bill category button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${textbox.new_requisition.create_new_patient.patient_bill_category}
    ${patient_bill_dropdown}    Run Keyword If    '${menu}'=='clientportal'    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    ${testdata}[patient_bill]
    ...    ELSE    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[patient_bill]
    Wait Until Element Is Visible    ${patient_bill_dropdown}    ${LONG_WAIT}    Patient bill options is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${patient_bill_dropdown}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.first_name}    ${LONG_WAIT}    Patient first name textbox is not visible after waiting ${LONG_WAIT} seconds
    ${patient_name}    Set Variable    ${testdata}[patient_first_name]    ${testdata}[patient_last_name]
    Set Global Variable    ${patient_name}
    Input Text    ${textbox.new_requisition.create_new_patient.first_name}    ${patient_name}[0]
    Input Text    ${textbox.new_requisition.create_new_patient.last_name}    ${patient_name}[1]
    ${date}    Get 2 Days Previous Date
    Input Text    ${textbox.new_requisition.create_new_patient.DOB}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Javascript Click    ${textbox.new_requisition.create_new_patient.select_gender}
    ${select_gender_option}    Run Keyword If    "${testdata}[patient_bill]"=="Client Bill" or "${testdata}[patient_bill]"=="Financial Hardship"    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[gender]
    ...    ELSE IF    "${testdata}[patient_bill]"=="Patient Portal Only"    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    ${testdata}[gender]
    ...    ELSE IF    "${testdata}[patient_bill]"=="Medicare" or "${testdata}[patient_bill]"=="Other Insurance"    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill.medicare\other_insurance}    ${testdata}[gender]
    ...    ELSE    Update Dynamic Value    ${textbox.clientportal.infectious_disease.create_new_patient.common_gender}    ${testdata}[gender]
    Click On The Element    ${select_gender_option}    Gender option    ${LONG_WAIT}
    [Return]    ${select_gender_option}

Create New Requisition With Existing Patient
    [Arguments]    ${testdata}    ${patient_name}
    Navigate To Main Menu    Client Portal
    Comment    Go to New Requisition Page to Validate Patient Bill Type
    Comment    Navigate to New Order Menu
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Comment    Navigate Io Infectious Disease Menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Comment    Select ${test_data}[clientsitetotype] as client
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Comment    Verify user is able to select order physician
    Select Order Physician    ${testdata}
    Log    Selected ${test_data}[orderphysician_name] as order physician
    Comment    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Input Text    ${textbox.new_requisition.patientname}    ${patient_name}[0] ${patient_name}[1]
    ${update_patient_name}    Set Variable    ${patient_name}[0] ${patient_name}[1]
    ${dropdown.create_req.patient_name.patient_dorpdown}    Update Dynamic Value    ${dropdown.create_req.patient_name}    ${patient_name}[0] ${patient_name}[1]
    Wait For The Element to be Visible    ${dropdown.create_req.patient_name.patient_dorpdown}    ${MEDIUM_WAIT}    patient_name_dropdown
    Javascript Click    ${dropdown.create_req.patient_name.patient_dorpdown}
    Click Element    ${button.client_portal.new_order.infectious_disease.patient.edit_patient}
    Send Text To Textfield    ${button.client_portal.new_order.infectious_disease.patient.edit_patient.first_name}    "First_name"    ${MEDIUM_WAIT}    ${edit_first_name}
    Send Text To Textfield    ${button.client_portal.new_order.infectious_disease.patient.edit_patient.last_name}    "Last_name"    ${MEDIUM_WAIT}    ${edit_last_name}
    Click On The Element    ${button.new_requisition.create_new_patient.save}    Save button    ${LONG_WAIT}    selenium
    Screenshot.Take Screenshot
    Wait Until Page Contains    Patient saved    ${LONG_WAIT}    Success message is not displayed after waiting ${LONG_WAIT} seconds
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Provide Patient Address    ${testdata}
    Run Keyword If    '${testdata}[patient_bill]'=='Other Insurance'    Select Updated Ics Code    ${testdata}
    Save Requisition
    Log    Saved the requisition
    Log    Completed requisition form to the stage where the acknowledgement checkbox must be selected
    Provide Acknowledgement    ${testdata}
    Log    Provided Acknowledgement for confirming the requisition***
    Screenshot.Take Screenshot
    Confirm Requisition
    Log    Confirmed the requisition***
    Log    We are inserting static wait of 10 seconds here for downloading pdf file into local
    Verify Expected File is Downloaded into Local
    ${file_path}    Read Data From Pdf
    Remove Files in Directory

Validate Patient Bill Type in Create New Requisition Page
    [Arguments]    ${testdata}    ${bill_type_option}=None    ${bill_type_validation}=None
    Send Text To Textfield    ${textbox.new_requisition.patientname}    patient name textbox    ${MEDIUM_WAIT}    ${patient_name}[0] ${patient_name}[1]
    ${update_patient_name}    Set Variable    ${patient_name}[0] ${patient_name}[1]
    ${patient_name_dropdown}    Update Dynamic Value    ${dropdown.create_req.patient_name}    ${update_patient_name}
    Wait For The Element to be Visible    ${patient_name_dropdown}    patient_name_dropdown    ${MEDIUM_WAIT}
    Javascript Click    ${patient_name_dropdown}
    ${new.button.create_new_requisition.patient_bill_type_for_attribute}    Update Dynamic Value    ${button.create_new_requisition.patient_bill_type_for_attribute}    ${bill_type_option}
    ${Bill_type_status}    Get Element Attribute    ${new.button.create_new_requisition.patient_bill_type_for_attribute}    class
    Run Keyword If    '${bill_type_validation}'=='positive'    Should Contain    ${Bill_type_status}    selected
    Run Keyword If    '${bill_type_validation}'!='positive'    Should Not Contain    ${Bill_type_status}    selected
    Click Element    ${button.cross(x)}

Validate Mandatory Fields In New Toxicology Requisition Page
    [Arguments]    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Select Order Physician    ${testdata}
    Log    Selected ${test_data}[orderphysician_name] as order physician
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Log    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Selected ${testdata}[syndromic_filter_category] as Syndromic FIlter Category
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Log    Select ICS code for new requisition
    Select ICS code    ${testdata}
    Log    Selected ${testdata}[icd_code]
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Log    Select Medication code for new requisition
    Select Medication Code    ${testdata}
    Save Activity    ${button.new_requisition.save}    ${testdata}[panel_error_message]    ${SHORT_WAIT}
    Log    Select Ketamine Option in Syndromic Menu Filter Category
    Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Log    Selected Ketamine As Syndromic Menu Filter Category and Provided Time
    Save Activity    ${button.new_requisition.save}    ${testdata}[error_message]    ${SHORT_WAIT}
    Log    Validate Medical Neccesity
    Validate Medical Neccesity While Creating Toxicology Requisition    ${testdata}[patientrisklevel]    ${testdata}[receivedfrom]    ${testdata}[medicalneccesitydocumentation]    ${testdata}[error_message]

Validate Cancel New Requisition in Create Requisition Page
    [Arguments]    ${testdata}
    Select Client Site    ${testdata}
    Select Order Physician    ${testdata}
    Input All Fields in Create New Patient Page    ${testdata}
    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    Log    Required Details are Entered
    Log    Click on Cancel Button
    Perform Actions    CANCEL    ${MEDIUM_WAIT}
    Log    Verify "Are you sure to Cancel with Yes & No" popup should be displayed
    Log    "Are you sure?" popup message is displayed
    Log    Click on "No" and verify form should not be cancelled
    Cancel Created Requisition    No
    Log    "Are you sure?" popup message is displayed
    Log    Click on Cancel Button
    Perform Actions    CANCEL    ${MEDIUM_WAIT}
    Log    Verify "Are you sure to Cancel with Yes & No" popup should be displayed
    Log    Click on "Yes" and Verify form should be cancelled
    Cancel Created Requisition    Yes
    Log    "Are you sure?" popup message is displayed
    Log    Requisition form is closed and Requisition is not created

Validate Create New Toxicology Requisition With New Patient
    [Arguments]    ${testdata}
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Select Order Physician    ${testdata}
    Log    Test Step 7 : Selected ${test_data}[orderphysician_name] as order physician
    Comment    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Selected ${testdata}[syndromic_filter_category] as Syndromic FIlter Category
    Comment    Select ICS code for new requisition
    Select ICS code    ${testdata}
    Log    Selected ${testdata}[icd_code]
    Comment    Select Medication code for new requisition
    Select Medication Code    ${testdata}
    Log    Select Ketamine Option in Syndromic Menu Filter Category
    Select Ketamine Option in Syndromic Menu Filter In Toxicology Requisition
    Log    Selected Ketamine As Syndromic Menu Filter Category and Provided Time
    Click On The Element    ${button.new_requisition.save}    save    ${SHORT_WAIT}
    Log    Validate Medical Neccesity
    Enter Medical Neccesity Fields and Submit    ${testdata}[patientrisklevel]    ${testdata}[receivedfrom]    ${testdata}[medicalneccesitydocumentation]
    Provide Acknowledgement    ${testdata}
    Wait Until Element Is Visible    ${label.create_new_requisition.doctor_signature_label}    ${LONG_WAIT}    Doctor Signature is not visible after waiting ${LONG_WAIT} seconds
    Confirm Requisition
    Verify Expected File is Downloaded into Local
    Read Data From Pdf

Verify Created Order Physician in Doctor Signature Page
    Wait Until Element Is Visible    ${textbox.quik_menu.doctor_signature_page.search}
    Input Text    ${textbox.quik_menu.doctor_signature_page.search}    PHYSICIAN DEMONSTRATION
    Click On The Element    ${button.accesioning.doctor_signature.submit}    submit button    ${SHORT_WAIT}
    Wait Until Element Is Not Visible    ${button.doctor_signature.spinner}
    Wait Until Element Is Visible    ${label.doctor_signatiure.physician_demonstration}

Navigate to Create New Patient Page For Negative Validation
    ${testdata}    Read TestData From Excel    CP082    ClientPortal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Navigate to Quick Manual to select "Client Portal"
    Navigate To Main Menu    Client Portal
    Log    Navigated to Client Portal page***
    Screenshot.Take Screenshot
    Log    Handle Alert "We'd like to show you Notifications for the latest news and Updates"
    Refuse Alert for Notifications of News
    Navigate To New Order Menu
    Log    User is able to see New Order menu option by clicking on New Order menu
    Navigate To New Order Sub Menu    Infectious Disease
    Log    Navigated to Infectious Disease page***
    Screenshot.Take Screenshot
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Select Order Physician    ${testdata}
    Log    Selected ${test_data}[orderphysician_name] as order physician
    ${new.button.client_portal.create_new_requisition.create_new}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    patient
    Click On The Element    ${new.button.client_portal.create_new_requisition.create_new}    Create New Paient    ${LONG_WAIT}

Validate Delete Documents in Documents Page
    [Arguments]    ${testdata}
    Upload PDF File in Requisitions Documents Page    ${testdata}[file_type]    ${testdata}[file_type_index]
    Click Element    ${button.create_new_requisition.documents}
    Validate Delete File in Documents Page
    Capture Image in Documents Page
    Click On The Element    ${dropdown.create_requisition.documents.filetype}    File_Type_arrow    ${LONG_WAIT}
    Perform Actions    ${testdata}[file_type]    ${SHORT_WAIT}
    Click On The Element    ${checkbox.create_new_requisition.documents.file_type_save}    save checkbox    ${LONG_WAIT}
    Validate Delete File in Documents Page

Capture Image in Documents Page
    Click Element    ${button.create_new_requisition.documents}
    Click On The Element    ${button.create_new_requisition.documents.capture}    Documents Page Capture    ${LONG_WAIT}    selenium
    Wait Until Time    4
    Click On The Element    ${button.create_new_requisition.documents.capture_image.capture}    Camera Page Capture    ${LONG_WAIT}
    Perform Actions    Save    ${SHORT_WAIT}

Validate Delete File in Documents Page
    Wait For The Element to be Visible    ${label.create_new_requisition.documents.number_of_files}    document delete button    ${MEDIUM_WAIT}
    ${files_size}    Get Element Count    ${label.create_new_requisition.documents.number_of_files}
    Click On The Element    ${button.create_new_requisition.documents.delete}    delete    ${MEDIUM_WAIT}
    ${new_files_size}    Get Element Count    ${label.create_new_requisition.documents.number_of_files}
    Should Not Be Equal    ${new_files_size}    ${files_size}
    Click On The Element    ${button.create_new_requisition.documents.done}    done    ${MEDIUM_WAIT}

Select File Type and Perform Save in Documents Page
    [Arguments]    ${testdata}
    ${new.dropdown.create_requisition.documents.filetype}    Update Dynamic Value    ${dropdown.create_requisition.documents.filetype}    ${testdata}[second_file_type_index]
    ${new.checkbox.create_new_requisition.documents.file_type_save}    Update Dynamic Value    ${checkbox.create_new_requisition.documents.file_type_save}    ${testdata}[second_file_type_index]
    ${new.button.create_new_requisition.documents.file_type_option}    Update Dynamic Values    ${button.create_new_requisition.documents.file_type_option}    ${testdata}[second_file_type_index]    ${testdata}[second_file_type_index]
    Click On The Element    ${new.dropdown.create_requisition.documents.filetype}    File_Type_Arrow    ${LONG_WAIT}
    Click On The Element    ${new.button.create_new_requisition.documents.file_type_option}    File Type option    ${LONG_WAIT}
    Click On The Element    ${new.checkbox.create_new_requisition.documents.file_type_save}    Save checkbox    ${LONG_WAIT}
    Click On The Element    ${button.create_new_requisition.documents.done}    documents done    ${MEDIUM_WAIT}
    Click On The Element    ${button.new_requisition.save}    save    ${MEDIUM_WAIT}

Validate Downloaded Image and Pdf Files of Requisition in Local
    Verify Expected File is Downloaded into Local
    ${file_path}    Read File Path    ${PDF_DOWNLOAD_FOLDER}
    Set Test Variable    ${file_path}
    ${count}    Get Length    ${file_path}
    FOR    ${key}    IN RANGE    ${count}
        ${path}    ${extension}    Split Extension    ${file_path}[${key}]
        ${status}    Run Keyword And Return Status    Should Contain    ${extension}    png
        ${path}    Set Variable If    '${status}'=='True'    ${file_path}[${key}]
        Exit For Loop If    '${status}'=='True'
    END
    FOR    ${key}    IN RANGE    ${count}
        ${path}    ${extension}    Split Extension    ${file_path}[${key}]
        ${status}    Run Keyword And Return Status    Should Contain    ${extension}    requisition
        ${path}    Set Variable If    '${status}'=='True'    ${file_path}[${key}]
        Exit For Loop If    '${status}'=='True'
    END
