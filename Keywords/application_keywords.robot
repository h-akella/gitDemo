*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Create New Requisition
    [Arguments]    ${testdata}    ${covid_only}=None
    Log    Verify user able to Create New requisition
    Log    Select ${test_data}[clientsitetotype] as client
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Log    Verify user is able to select order physician
    Select Order Physician    ${testdata}
    Log    Test Step 7 : Selected ${test_data}[orderphysician_name] as order physician
    Log    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Log    Verify user is able to create New Patient
    Input All Fields in Create New Patient Page    ${testdata}
    Log    Created New Patient
    Log    Select the syndromic menu filter categories
    Run Keyword If    '${covid_only}'!='None'    Select Syndromic Menu Filter Categories    ${testdata}    Yes
    ...    ELSE    Select Covid Disease Category and Swap Site    ${testdata}
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
    Wait Until Time    10

Select Client Site
    [Arguments]    ${testdata}
    Click On The Element    ${textbox.new_requisition.clientsite}    Client site textbox    ${LONG_WAIT}    seleniumclick
    Send Text To Textfield    ${textbox.new_requisition.clientsite}    client site    ${LONG_WAIT}    ${test_data}[clientsite]
    Wait Until Time    3
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${test_data}[clientsitetotypeforlocating]
    Wait Until Time    3
    ${status}    Run Keyword And Return Status    Javascript Click    ${new.dropdown_for_suggestion.new_requisition}
    Run Keyword If    ${status}==False    Select Client Site With Update Name    ${testdata}    ${new.dropdown_for_suggestion.new_requisition}

Select Syndromic Menu Filter Categories
    [Arguments]    ${testdata}    ${syndromic_filter_dropdown}    ${menu}=clientportal
    Run Keyword If    '${syndromic_filter_dropdown}'=='Yes'    Click and Select Syndromic Menu Filter Category    ${testdata}
    Run Keyword If    '${menu}'=='clientportal'    Click On The Element    ${button.create_new_requisition.syndromic_menu_filter.pnuemonia_disease_category}    Bacterial Pneumonia subcategory    ${LONG_WAIT}
    Click On The Element    ${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.baumanii}    Syndromic menu filter    ${LONG_WAIT}
    Run Keyword If    '${menu}'=='clientportal'    Javascript Click    ${button.select_present_time}
    ...    ELSE    Javascript Click    ${button.create_new_requisition.swab_site_collection_date_now}
    Click On The Element    ${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}    Swab site dropdown    ${LONG_WAIT}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[swap_site_category]
    Click On The Element    ${new.dropdown_for_suggestion.new_requisition}    Swab Site Category button    ${LONG_WAIT}
    Screenshot.Take Screenshot

Select Site Contact
    [Arguments]    ${testdata}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[site_contact_name]
    Click And Select Dropdown    ${textbox.new_requisition.sitecontact}    ${new.dropdown_for_suggestion.new_requisition}    ${SHORT_WAIT}

Search For Created Sample Details In Accesioning Module
    [Arguments]    ${testdata}    ${count_value}    ${sample_id}
    @{sample_id}    Split String    ${sample_id}    ,
    FOR    ${key}    IN RANGE    ${count_value}
        Search For Details In Home Page    ${sample_id}[${key}]    ${testdata}[pending_searchcategory_checkbox]
        Wait Until Time    1
        Wait For Spinner To Disappear    ${homepage.spinner}
        ${details_button}    Update Dynamic Value    ${button.accesioning.details_buttonusing_sampe_id}    ${sample_id}[${key}]
        Wait For The Element to be Visible    ${details_button}    details_button    ${LONG_WAIT}
    END
    [Return]    ${details_button}

Select ICS code
    [Arguments]    ${testdata}
    Scroll Element Into View    ${textbox.new_requisition.ics_codes}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[icd_code]
    Click And Select Dropdown    ${textbox.new_requisition.ics_codes}    ${new.dropdown_for_suggestion.new_requisition}    ${SHORT_WAIT}

Select Client Site With Update Name
    [Arguments]    ${testdata}    ${clientsite_dropdown}
    Input Text    ${textbox.new_requisition.clientsite}    ${test_data}[clientsitetotype]
    Wait Until Time    3
    Javascript Click    ${clientsite_dropdown}

Select Order Physician
    [Arguments]    ${testdata}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${test_data}[orderphysician_name]
    Click On The Element    ${textbox.new_requisition.orderingphysician}    ${test_data}[orderphysician_name]    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.new_requisition.orderingphysician}    order physician textbox    ${SHORT_WAIT}    ${test_data}[orderphysician_name]
    Wait Until Time    2
    ${status}    Run Keyword And Return Status    Wait For The Element to be Visible    ${new.dropdown_for_suggestion.new_requisition}    order physician dropdown    ${MEDIUM_WAIT}
    Run Keyword If    ${status}==True    Click Element    ${new.dropdown_for_suggestion.new_requisition}
    Run Keyword If    '${status}'=='False'    Send Text To Textfield    ${textbox.new_requisition.orderingphysician}    order physician textbox    ${MEDIUM_WAIT}    ${test_data}[orderphysician_name_second_time]
    Run Keyword If    '${status}'=='False'    Click Element    ${new.dropdown_for_suggestion.new_requisition}    ${MEDIUM_WAIT}

Confirm Requisition
    Click On The Element    ${button.new_requisition.confirm}    Confirm    ${LONG_WAIT}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Not Visible    ${button.new_requisition.confirm}    ${SHORT_WAIT}    Confirm button is not visible after waiting ${LONG_WAIT} seconds
    Run Keyword If    ${status}==False    Javascript Click    ${button.new_requisition.confirm}

Edit New Patient With Other Insurance option Bill Type
    [Arguments]    ${testdata}
    ${new.button.create_new_requisition.create_new_patient.gender}    Update Dynamic Value    ${button.create_new_requisition.create_new_patient.gender}    ${testdata}[gender]
    ${new.textbox.create_new_patient.guarantor_dob}    Update Dynamic Value    ${textbox.create_new_patient.guarantor_dob}    guarantor_email
    ${guarantor_phone_textbox}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    guarantor_phone
    ${guarantor_primary_insurance_textbox}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_insurance_id
    ${primary_relationship_to_insured_textbox}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_relationship_to_insured
    ${primary_number_textbox}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_number
    Click On The Element    ${new.button.create_new_requisition.create_new_patient.gender}    Gender Option    ${LONG_WAIT}
    Input Text    ${new.textbox.create_new_patient.guarantor_dob}    ${test_data}[guarantor_email]
    Input Text    ${guarantor_phone_textbox}    ${test_data}[phone_number]
    Input Text    ${textbox.create_new_patient.address}    ${test_data}[patient_address]
    Input Text    ${textbox.create_new_patient.mobile_number}    ${test_data}[phone_number]
    Javascript Click    ${textbox.create_new_patient.guarantor_relationship}
    Wait Until Element Is Visible    ${dropdown.create_new_patient.father}    ${LONG_WAIT}    Father option is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${dropdown.create_new_patient.father}
    Input Text    ${textbox.create_new_patient.guarantor_firstname}    ${test_data}[patient_last_name]
    Input Text    ${textbox.create_new_patient.guarantor_lastname}    ${test_data}[patient_first_name]
    Input Text    ${textbox.create_new_patient.guarantor_dob}    ${test_data}[guarantor_dob]
    Press Keys    ${textbox.create_new_patient.guarantor_dob}    RETURN
    Javascript Click    ${button.create_new_patient.guarantor_gender_id}
    Wait Until Element Is Visible    ${new.button.create_new_requisition.create_new_patient.gender}    ${LONG_WAIT}    ${testdata}[gender] option is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${new.button.create_new_requisition.create_new_patient.gender}
    Wait Until Element Is Visible    ${textbox.create_new_patient.guarontor_address}    ${LONG_WAIT}    guarantor address textbox is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${textbox.create_new_patient.guarontor_address}    ${test_data}[patient_address]
    Click Element    ${guarantor_primary_insurance_textbox}
    ${self_pay_secondary_insurance_option}    Update Dynamic Value    ${button.create_new_requisition.create_new_patient.secondary_insurance_options.self_pay_and_self}    *SELF PAY*
    ${self_secondary_insurance_option}    Update Dynamic Value    ${button.create_new_requisition.create_new_patient.secondary_insurance_options.self_pay_and_self}    Self
    Click On The Element    ${self_pay_secondary_insurance_option}    self pay option dropdown    ${LONG_WAIT}
    Click On The Element    ${primary_relationship_to_insured_textbox}    primary insurance textbox    ${MEDIUM_WAIT}
    Click On The Element    ${self_secondary_insurance_option}    self option    ${LONG_WAIT}
    Wait Until Time    3
    Input Text    ${primary_number_textbox}    ${test_data}[phone_number]

Select Medication Code
    [Arguments]    ${testdata}
    Scroll Element Into View    ${textbox.new_requisition.medication}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[medication_code]
    Click And Select Dropdown    ${textbox.new_requisition.medication}    ${new.dropdown_for_suggestion.new_requisition}    ${SHORT_WAIT}

Navigate To New Order Menu
    Log    Navigate to New Order Menu Page
    Click On The Element    ${button.clientportal.newordermenu}    New Order Menu    ${MEDIUM_WAIT}

Navigate To New Order Sub Menu
    [Arguments]    ${inner_sub_menu_text}
    Log    Navigate Io Infectious Disease Menu
    Wait Until Time    3
    ${new.button.clientportal.neworder.submenu}    Update Dynamic Value    ${button.clientportal.neworder.submenu}    ${inner_sub_menu_text}
    Javascript Click    ${new.button.clientportal.neworder.submenu}
    Wait Until Element Is Visible    ${textbox.new_requisition.clientsite}    ${LONG_WAIT}    Client site textbox is not visible after waiting ${LONG_WAIT} seconds
    Log    Navigated to ${inner_sub_menu_text} Page
    Screenshot.Take Screenshot

Save Requisition
    Javascript Click    ${button.new_requisition.save}

Provide Acknowledgement
    [Arguments]    ${testdata}
    Wait Until Time    3
    Javascript Click    ${checkbox.provide_acknowledgement}
    Run Keyword If    '${testdata}[clientsite]'!='API Demo Facility'    Wait For The Element to be Visible    ${label.create_new_requisition.doctor_signature_label}    Doctor Signature Label    ${MEDIUM_WAIT}

Verify user able to navigate to Requisition Complete All page
    Comment    Check if user able to go to Complete Processing page
    ${details_sample_id_checkbox}    Update Dynamic Value    ${checkbox.accesioning.details.sample_id}    ${sample_id}
    Comment    Select required sample id checkbox
    Click On The Element    ${details_sample_id_checkbox}    Requisition Checkbox    ${SHORT_WAIT}
    Javascript Click    ${button.accesioning.complete}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${textbox.accesioning.requisition_completeall.tracking_number}    ${LONG_WAIT}    Tracking number textbox in requisition complete all page is not displayed after waiting ${LONG_WAIT} seconds
    Run Keyword If    ${status}==False    Fail    Complete all page is not displayed
    Screenshot.Take Screenshot

Verify User able to Open Pending-Tab Page in Accessioning
    Comment    Displays the pending tab page
    Wait Until Element Is Visible    ${button.accesioning.pending}    ${LONG_WAIT}    Pending tab button is not displayed
    Javascript Click    ${button.accesioning.pending}

Navigate to Batch-Review Page
    Comment    Displays the Batch review page
    Wait Until Element Is Visible    ${button.accessioning.batch-review}    ${MEDIUM_WAIT}    Batch-review button is not displayed
    Javascript Click    ${button.accessioning.batch-review}
    Screenshot.Take Screenshot

Input All Fields in Create New Patient Page
    [Arguments]    ${testdata}    ${menu}=clientportal
    ${new.button.client_portal.create_new_requisition.create_new}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    patient
    Click On The Element    ${new.button.client_portal.create_new_requisition.create_new}    Create New Patient    ${LONG_WAIT}    seleniumClick
    Click On The Element    ${textbox.new_requisition.create_new_patient.patient_bill_category}    Bill category button    ${LONG_WAIT}
    ${patient_bill_dropdown}    Run Keyword If    '${menu}'=='clientportal'    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    ${testdata}[patient_bill]
    ...    ELSE    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[patient_bill]
    Click On The Element    ${patient_bill_dropdown}    Patient bill options    ${LONG_WAIT}
    ${patient_name}    Set Variable    ${testdata}[patient_first_name]    ${testdata}[patient_last_name]
    Set Global Variable    ${patient_name}
    Send Text To Textfield    ${textbox.new_requisition.create_new_patient.first_name}    patient first name textbox    ${LONG_WAIT}    ${patient_name}[0]
    Send Text To Textfield    ${textbox.new_requisition.create_new_patient.last_name}    patient last name textbox    ${LONG_WAIT}    ${patient_name}[1]
    ${date}    Get 2 Days Previous Date
    Input Text    ${textbox.new_requisition.create_new_patient.DOB}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Javascript Click    ${textbox.new_requisition.create_new_patient.select_gender}
    ${new.button.create_new_patient.gender}    Update Dynamic Value    ${button.create_new_patient.gender}    ${testdata}[gender]
    Click On The Element    ${new.button.create_new_patient.gender}    Gender Textbox    ${MEDIUM_WAIT}
    Run Keyword If    '${testdata}[patient_bill]'=='Other Insurance'    Edit New Patient With Other Insurance option Bill Type    ${testdata}
    Run Keyword If    '${testdata}[patient_bill]'!='Other Insurance'    Javascript Click    ${new.button.create_new_patient.gender}
    Click On The Element    ${button.new_requisition.create_new_patient.save}    Save button    ${LONG_WAIT}    selenium
    Screenshot.Take Screenshot
    Wait Until Page Contains    Patient saved    ${LONG_WAIT}    Success message is not displayed after waiting ${LONG_WAIT} seconds

Select Multiple Requisitions Checkbox
    [Arguments]    ${Count_Value}
    [Documentation]    This Keyword is used to Select Requisition Checkboxes by taking Sample-id Value into the Checkbox Locator. It also provides the RID_Value from Requisition for Verification purpose.
    ...
    ...    Arguements need to pass is:${count_Value}. ex- 1 or \ 2 or 3.... depends on how many Requisition user wants to select.
    Log    Select Multiple Requisitions Using Sample Id
    @{home_page_requisition_id}    Create List
    @{updated_sample_id}    Create List
    FOR    ${key}    IN RANGE    0    ${Count_Value}
        ${key}    Evaluate    ${key}+1
        ${updated_key}    Convert To String    ${key}
        ${label.accesioning.details.sample_id.new}    Update Dynamic Value    ${label.accesioning.details.sample_id}    ${updated_key}
        Wait For The Element to be Visible    ${label.accesioning.details.sample_id.new}    Sample Id Label For Attribute    ${SHORT_WAIT}
        ${sample_id_attribute}    Get Element Attribute    ${label.accesioning.details.sample_id.new}    title
        Log    Sample_Id- is Received
        @{Sample_Id}    Split String    ${sample_id_attribute}    ,
        ${label.accesioning.details.req_id_for_attribute.new}    Update Dynamic Value    ${label.accesioning.details.req_id_for_attribute}    ${updated_key}
        ${RID}    Get Element Attribute    ${label.accesioning.details.req_id_for_attribute.new}    title
        Log    "${RID}" is Received
        ${RID_count}    Get length    ${RID}
        Run Keyword If    ${RID_count}==6    Append To List    ${home_page_requisition_id}    ${RID}
        Log    ${home_page_requisition_id}
        @{Requisition_Id}    Split String    ${RID}    ,
        ${checkbox.accesioning.requisition_checkboxes.new}    Update Dynamic Value    ${checkbox.accesioning.select_requisitions}    ${Requisition_Id}[0]
        Click On The Element    ${checkbox.accesioning.requisition_checkboxes.new}    Requisition checkbox    ${SHORT_WAIT}    seleniumclick
        Append To List    ${updated_sample_id}    ${Sample_Id}[0]
        Log    ${updated_sample_id}
        Screenshot.Take Screenshot
    END
    ${requisition_id_count}    Get Length    ${home_page_requisition_id}
    Set Test Variable    ${home_page_requisition_id}    ${home_page_requisition_id}
    Set Test Variable    ${requisition_id_count}    ${requisition_id_count}
    Set Test Variable    ${updated_sample_id}    ${updated_sample_id}

Complete Process and Close Modal
    Click On The Element    ${textbox.accesioning.requisition_completeall.start_processing}    Start Processing    ${LONG_WAIT}    seleniumclick
    Wait Until Element Is Visible    ${label.accesioning.requisition_completeall.complete_100%_process}    ${LONG_WAIT}    Process complete label in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Log    Requisition completed success message is displayed
    Javascript Click    ${textbox.accesioning.requisition_completeall.closemodal}

Click and Select Syndromic Menu Filter Category
    [Arguments]    ${testdata}
    Wait Until Time    3
    Javascript Click    ${button.new_requisition.syndromic_menu_filter}
    ${new.dropdown_for_suggestion.new_requisition}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[syndromic_filter_category]
    Click On The Element    ${new.dropdown_for_suggestion.new_requisition}    ${testdata}[syndromic_filter_category] Syndromic menu filter option    ${LONG_WAIT}

Select Updated Ics Code
    [Arguments]    ${testdata}
    Scroll Element Into View    ${button.create_requisition.edit_icd_code}
    ${new.button.icd_code_option}    Update Dynamic Value    ${button.icd_code_option}    ${testdata}[icd_code]
    Click And Select Dropdown    ${button.create_requisition.edit_icd_code}    ${new.button.icd_code_option}    ${SHORT_WAIT}
    Click Element    ${button.create_new_requisition.icd_code.submit}

Click Provider Acknowledgement Button
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${checkbox.provide_acknowledgement}
    Comment    Click On Element JS    Provider Acknowledgement    ${checkbox.provide_acknowledgement}    ${LONG_WAIT}
    Screenshot.Take Screenshot

Select Existing Patient
    [Arguments]    ${testdata}
    ${patient_name}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[patient_name]
    Click And Select Dropdown    ${textbox.new_requisition.patientname}    ${patient_name}    ${SHORT_WAIT}
    Log    Selected "${testdata}[patient_name]"

Edit New Patient with Bill Type Medicaid
    [Arguments]    ${testdata}
    Input Text    ${textbox.create_new_patient.address}    ${test_data}[patient_adress]
    Input Text    ${textbox.create_new_patient.mobile_number}    ${test_data}[phone_number]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    guarantor_email
    Input Text    ${new.textbox.create_new_patient.guarantor}    ${test_data}[guarantor_email]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    guarantor_phone
    Input Text    ${new.textbox.create_new_patient.guarantor}    ${test_data}[phone_number]
    Javascript Click    ${textbox.create_new_patient.guarantor_relationship}
    Click On The Element    ${dropdown.create_new_patient.father}    guarantor relationship_option father    ${LONG_WAIT}
    Input Text    ${textbox.create_new_patient.guarantor_firstname}    ${test_data}[patient_last_name]
    Input Text    ${textbox.create_new_patient.guarantor_lastname}    ${test_data}[patient_first_name]
    Input Text    ${textbox.create_new_patient.guarantor_dob}    ${test_data}[guarantor_dob]
    Press Keys    ${textbox.create_new_patient.guarantor_dob}    RETURN
    Javascript Click    ${button.create_new_patient.guarantor_gender_id}
    ${new.textbox.clientportal.infectious_disease.create_new_patient.common_gender}    Update Dynamic Value    ${textbox.clientportal.infectious_disease.create_new_patient.common_gender}    ${testdata}[gender]
    Wait Until Time    3
    Log    "${select_gender_option}"
    Javascript Click    ${new.textbox.clientportal.infectious_disease.create_new_patient.common_gender}
    Wait Until Element Is Visible    ${textbox.create_new_patient.guarontor_address}    ${LONG_WAIT}    guarantor address textbox is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${textbox.create_new_patient.guarontor_address}    ${test_data}[patient_adress]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_insurance_id
    Click Element    ${new.textbox.create_new_patient.guarantor}
    ${new.textbox.infectious_disease.create_new_patient.medicaid_bill.primary_insurance_and_primary_relation.common}    Update Dynamic Value    ${textbox.infectious_disease.create_new_patient.medicaid_bill.primary_insurance_and_primary_relation.common}    *SELF PAY*
    Javascript Click    ${new.textbox.infectious_disease.create_new_patient.medicaid_bill.primary_insurance_and_primary_relation.common}
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_relationship_to_insured
    Click Element    ${new.textbox.create_new_patient.guarantor}
    ${new.textbox.infectious_disease.create_new_patient.medicaid_bill.primary_insurance_and_primary_relation.common}    Update Dynamic Value    ${textbox.infectious_disease.create_new_patient.medicaid_bill.primary_insurance_and_primary_relation.common}    Self
    Javascript Click    ${new.textbox.infectious_disease.create_new_patient.medicaid_bill.primary_insurance_and_primary_relation.common}
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_number
    Input Text    ${new.textbox.create_new_patient.guarantor}    ${test_data}[phone_number]

Edit New Patient with Workers compensation Bill type
    [Arguments]    ${testdata}
    Input Text    ${textbox.create_new_patient.address}    ${test_data}[patient_adress]
    Input Text    ${textbox.create_new_patient.mobile_number}    ${test_data}[phone_number]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    guarantor_email
    Input Text    ${new.textbox.create_new_patient.guarantor}    ${test_data}[guarantor_email]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    guarantor_phone
    Input Text    ${new.textbox.create_new_patient.guarantor}    ${test_data}[phone_number]
    Javascript Click    ${textbox.create_new_patient.guarantor_relationship}
    Click On The Element    ${dropdown.create_new_patient.father}    guarantor relationship_option father    ${LONG_WAIT}
    Input Text    ${textbox.create_new_patient.guarantor_firstname}    ${test_data}[patient_last_name]
    Input Text    ${textbox.create_new_patient.guarantor_lastname}    ${test_data}[patient_first_name]
    Input Text    ${textbox.create_new_patient.guarantor_dob}    ${test_data}[guarantor_dob]
    Press Keys    ${textbox.create_new_patient.guarantor_dob}    RETURN
    Javascript Click    ${button.create_new_patient.guarantor_gender_id}
    ${new.textbox.clientportal.infectious_disease.create_new_patient.common_gender}    Update Dynamic Value    ${textbox.clientportal.infectious_disease.create_new_patient.common_gender}    ${testdata}[gender]
    Wait Until Time    ${SHORT_WAIT}
    Log    "${select_gender_option}"
    Javascript Click    ${new.textbox.clientportal.infectious_disease.create_new_patient.common_gender}
    Wait Until Element Is Visible    ${textbox.create_new_patient.guarontor_address}    ${LONG_WAIT}    guarantor address textbox is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${textbox.create_new_patient.guarontor_address}    ${test_data}[patient_adress]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_insurance_id
    Click Element    ${new.textbox.create_new_patient.guarantor}
    ${new.textbox.infectious_disease.create_new_patient.workers_compensation_bill.primary_insurance_and_primary_relation.common}    Update Dynamic Value    ${textbox.infectious_disease.create_new_patient.workers_compensation_bill.primary_insurance_and_primary_relation.common}    *SELF PAY*
    Javascript Click    ${new.textbox.infectious_disease.create_new_patient.workers_compensation_bill.primary_insurance_and_primary_relation.common}
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_relationship_to_insured
    Click Element    ${new.textbox.create_new_patient.guarantor}
    ${new.textbox.infectious_disease.create_new_patient.workers_compensation_bill.primary_insurance_and_primary_relation.common}    Update Dynamic Value    ${textbox.infectious_disease.create_new_patient.workers_compensation_bill.primary_insurance_and_primary_relation.common}    Self
    Javascript Click    ${new.textbox.infectious_disease.create_new_patient.workers_compensation_bill.primary_insurance_and_primary_relation.common}
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    claim_number
    Send Text To Textfield    ${new.textbox.create_new_patient.guarantor}    claim_number    ${LONG_WAIT}    ${testdata}[phone_number]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    date_of_injury
    ${date}    Get 2 Days Previous Date
    Send Text To Textfield    ${new.textbox.create_new_patient.guarantor}    date_of_injury    ${LONG_WAIT}    ${date}
    Press Keys    ${new.textbox.create_new_patient.guarantor}    RETURN

Edit New Patient with Medicare Bill type
    [Arguments]    ${test_data}
    Send Text To Textfield    ${textbox.create_new_patient.address}    address    ${LONG_WAIT}    ${test_data}[patient_adress]
    Send Text To Textfield    ${textbox.create_new_patient.mobile_number}    phone number    ${LONG_WAIT}    ${test_data}[phone_number]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    guarantor_email
    Send Text To Textfield    ${new.textbox.create_new_patient.guarantor}    guarantor email    ${LONG_WAIT}    ${test_data}[guarantor_email]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    guarantor_phone
    Send Text To Textfield    ${new.textbox.create_new_patient.guarantor}    guarantor phone    ${LONG_WAIT}    ${test_data}[phone_number]
    Javascript Click    ${textbox.create_new_patient.guarantor_relationship}
    Click On The Element    ${dropdown.create_new_patient.father}    guarantor relationship_option father    ${LONG_WAIT}
    Send Text To Textfield    ${textbox.create_new_patient.guarantor_firstname}    guarantor first name    ${LONG_WAIT}    ${test_data}[patient_first_name]
    Send Text To Textfield    ${textbox.create_new_patient.guarantor_lastname}    guarantor last name    ${LONG_WAIT}    ${test_data}[patient_last_name]
    Send Text To Textfield    ${textbox.create_new_patient.guarantor_dob}    guarantor dob    ${LONG_WAIT}    ${test_data}[guarantor_dob]
    Press Keys    ${textbox.create_new_patient.guarantor_dob}    RETURN
    Javascript Click    ${button.create_new_patient.guarantor_gender_id}
    ${new.dropdown_for_suggestion.new_requisition.create_patient.patient_bill.medicare\other_insurance}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill.medicare\other_insurance}    ${testdata}[gender]
    Wait Until Time    ${MINI_WAIT}
    Log    "${select_gender_option}"
    Javascript Click    ${new.dropdown_for_suggestion.new_requisition.create_patient.patient_bill.medicare\other_insurance}
    Send Text To Textfield    ${textbox.create_new_patient.guarontor_address}    guarantor address    ${LONG_WAIT}    ${test_data}[patient_adress]
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_insurance_id
    Click Element    ${new.textbox.create_new_patient.guarantor}
    ${new.textbox.infectious_disease.create_new_patient.medicare_bill.primary_insurance_option}    Update Dynamic Value    ${textbox.infectious_disease.create_new_patient.medicare_bill.primary_insurance_option}    *SELF PAY*
    Javascript Click    ${new.textbox.infectious_disease.create_new_patient.medicare_bill.primary_insurance_option}
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_relationship_to_insured
    Click Element    ${new.textbox.create_new_patient.guarantor}
    ${new.textbox.infectious_disease.create_new_patient.medicare_bill.primary_relationship_option}    Update Dynamic Value    ${textbox.infectious_disease.create_new_patient.medicare_bill.primary_relationship_option}    Self
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${new.textbox.infectious_disease.create_new_patient.medicare_bill.primary_relationship_option}    primary_relationship_to_insured    ${LONG_WAIT}
    ${new.textbox.create_new_patient.guarantor}    Update Dynamic Value    ${textbox.create_new_patient.guarantor}    primary_number
    Send Text To Textfield    ${new.textbox.create_new_patient.guarantor}    primary number    ${LONG_WAIT}    ${test_data}[phone_number]