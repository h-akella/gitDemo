*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Get First Patient Name Details From Patient Manager
    Click On The Element    ${button.patient.manager.get.first.name}    Patient Name    ${LONG_WAIT}
    Wait for The Element to be Visible    ${button.patient.manager.requisition.icon}    Requisition tab    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Search The Patient Name From Patient Manager Search Bar
    Click On The Element    ${text.box.patient.manager.name.search.bar}    Patient Manager Search Bar    ${MEDIUM_WAIT}
    Send Text To Textfield    ${text.box.patient.manager.name.search.box}    Patietn Name Enter    ${LONG_WAIT}    Demo Demo
    Click On The Element    ${button.patient.manager.name.search.icon}    Patient Manager Search Bar Icon    ${MEDIUM_WAIT}

Click On Download PDF From Patient Manager
    Click On The Element    ${button.patient.manager.download.icon}    download_button    ${LONG_WAIT}

Select First Checkbox in Requisitions Tab From Patient Manager
    Log    Navigate to patient sample id check box
    Click On The Element    ${chechbox.patient.manager.sample.id}    Patient Name Check Box    ${MEDIUM_WAIT}

Click On Hamburger Menu Repoers From Patient Manager
    Click On The Element    ${button.Patient.manager.hamburger.menu}    Patient hamburger menu    ${MEDIUM_WAIT}    selenium
    Click On The Element    ${button.Patient.manager.hamburger.menu.reports}    Patient hamburger menu reports    ${MEDIUM_WAIT}
    Click On The Element    ${button.Patient.manager.all.reports}    Patient all reports    ${MEDIUM_WAIT}

Click On Attachments From Patient Manager
    Log    Navigate to Patient Manager attachments
    Click On The Element    ${button.patient.manager.attachments}    Attachments    ${MEDIUM_WAIT}    selenium

Click On ZIP Download From Patient Manager
    Log    Navigate to Zip download button
    Click On The Element    ${button.patient.manager.zip.download.icon}    Zip download button    ${LONG_WAIT}

Click On Upload Button From Patient Manager
    Log    Navigate to upload icon
    Click On The Element    ${button.patient.manager.upload.icon}    Upload Icon    ${LONG_WAIT}

Click On Save Button From Patient Manager
    Log    Navigate to Save Button
    Click On The Element    ${button.patient.manager.save.button}    Save Button    ${MEDIUM_WAIT}

Click On Download Attachments From Patient Manager
    Log    Navigate to Download icon
    Click On The Element    ${button.patient.manager.attachments.download.icon}    Download icon    ${LONG_WAIT}

Click on Attachment View Button From Patient Manager
    Log    Navigate to View icon
    Click On The Element    ${button.patient.manager.attachments.view.icon}    View icon    ${LONG_WAIT}

Click On Attachments Delete From Patient Manager
    Log    Navigate to delete icon
    Click On The Element    ${button.patient.manager.attachments.delete.icon}    Delete Icon    ${MEDIUM_WAIT}    Selenium
    Log    Navigate to delete conformation required
    Click On The Element    ${button.patient.manager.attachments.delete.conformation}    Delete Conformation    ${LONG_WAIT}

Click On File Type Search Bar From Patient Manager
    [Arguments]    ${testdata}
    Log    Navigate to file type selecting
    Select File Type    ${testdata}

Click On Choose File From Patient Manager
    [Arguments]    ${testdata}
    Log    Navigate to Choose file and Upload
    Wait for The Element to be Visible    ${button.patient.manager.upload.file}    upload button    ${LONG_WAIT}
    Choose File    ${button.patient.manager.upload.file}    ${upload_file_path_in_clientportal_for_view_document}
    Log    Navigate to click on file type search bar
    Click On File Type Search Bar From Patient Manager    ${testdata}

Click On Attachments View Document From Patient Manager
    [Arguments]    ${testdata}    ${test_data_file_name}
    Log    view file type
    Log    Click on Save button
    ${new.button.patient.manager.attachments.view.document}    Update Dynamic Value    ${button.patient.manager.attachments.view.document}    ${test_data_file_name}
    Wait Until Time    2
    Click On The Element    ${new.button.patient.manager.attachments.view.document}    View Button    ${SHORT_WAIT}

Navigate to Patient Manager Details Sub-Menu
    [Arguments]    ${sub-menu}
    ${new.button.accesioning.details.sub-menu_buttons}    Update Dynamic Value    ${button.accesioning.details.sub-menu_buttons}    ${sub-menu}
    Click On The Element    ${new.button.accesioning.details.sub-menu_buttons}    ${sub-menu}    ${MEDIUM_WAIT}    selenium

Perform Click on First Patinet Details button in Patient Manager
    Click On The Element    ${button.patient_manager.first_element_details}    Details    ${LONG_WAIT}    selenium
    Wait Until Element Is Not Visible    ${spinner.locator}    ${LONG_WAIT}    spinner is still visible after waiting ${MEDIUM_WAIT} seconds

Save Medication without Adding Medication type
    Navigate to Patient Manager Details Sub-Menu    Medication
    ${medication_page_title validation}    Run Keyword And Return Status    Page Should Contain    Medication
    Log    "${medication_page_title validation}"
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.patient_manager.details.medication.add}    Add_Button    ${LONG_WAIT}
    ${add_medication_page_title validation}    Run Keyword And Return Status    Page Should Contain    Adding new patient Medication
    Log    "${add_medication_page_title validation}"
    Perform Actions    Save    ${LONG_WAIT}

Validate Patient Manager Page and Click on Details
    ${patient-manager_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.page_title.patient_manager}    ${MEDIUM_WAIT}
    Log    "${patient-manager_page_title}"
    Perform Click on First Patinet Details button in Patient Manager

Delete First Medication in Details Medication page
    [Arguments]    ${Yes_No}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.patient_manager.details.medication.first_medication_hamburger.delete}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.patient_manager.details.medication.first_medication_hamburger.delete}
    ${delete_popup_validation}    Run Keyword And Return Status    Page Should Contain    Confirmation required
    Log    "${delete popup validation}"
    Perform Actions    ${Yes_No}    ${LONG_WAIT}

Add Medication in Patient Manager
    [Arguments]    ${medication_type_option}
    Click On The Element    ${button.patient_manager.details.medication.add}    Add_Button    ${LONG_WAIT}
    Click On The Element    ${button.maximize_window}    maximize    ${LONG_WAIT}
    ${add_medication_page_title validation}    Run Keyword And Return Status    Page Should Contain    Adding new patient Medication
    Log    "${add_medication_page_title validation}"
    Send Text To Textfield    ${textbox.patient_manager.details.medication.add.medication_field}    Medication_textbox    ${LONG_WAIT}    ${medication_type_option}
    ${medication_options}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${medication_type_option}
    Click On The Element    ${medication_options}    ${medication_type_option}    ${LONG_WAIT}
    Wait Until Time    ${MINI_WAIT}
    Perform Actions    Save    ${LONG_WAIT}

Edit First Medication in Details Medication Page
    [Arguments]    ${medication_type_option}    ${edit_medicate}==positive validation
    [Documentation]    This keyword is used to edit first medication in details medication page. it is designed based on positive and negative validation.
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.patient_manager.details.medication.first_medication_edit}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.maximize_window}    maximize    ${LONG_WAIT}
    ${edit_medication_page_title validation}    Run Keyword And Return Status    Page Should Contain    Editing patient Medication
    Log    "${edit_medication_page_title validation}"
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${textbox.patient_manager.details.medication.add.medication_field}
    Wait Until Element Is Visible    ${button.patient_manager.details.medication.first_medication_edit.clear_medication}    ${MEDIUM_WAIT}
    Click Element    ${button.patient_manager.details.medication.first_medication_edit.clear_medication}
    Run Keyword If    "${edit_medicate}"=="positive validation"    Click Element    ${textbox.patient_manager.details.medication.add.medication_field}
    Run Keyword If    "${edit_medicate}"=="positive validation"    Send Text To Textfield    ${textbox.patient_manager.details.medication.add.medication_field}    Medication_textbox    ${LONG_WAIT}    ${medication_type_option}
    ${medication_options}    Run Keyword If    "${edit_medicate}"=="positive validation"    Update Dynamic Value    ${label.accesioning.details.submenu}    ${medication_type_option}
    Run Keyword If    "${edit_medicate}"=="positive validation"    Click On The Element    ${medication_options}    ${medication_type_option}    ${LONG_WAIT}
    Perform Actions    Save    ${LONG_WAIT}

Validate Medication Page and Add Medication
    [Arguments]    ${add_medicate}
    ${medication_page_title validation}    Run Keyword And Return Status    Page Should Contain    Medication
    Log    "${medication_page_title validation}"
    Add Medication in Patient Manager    ${add_medicate}
    Wait Until Time    ${SHORT_WAIT}
    ${medicate_name}    Get text    ${label.patient_manager.details.medication.first_medication_name}
    Log    "${medicate_name}"
    [Return]    ${medicate_name}

Edit Attachment FileType in Details Attachment Tab in Patient Manager
    ${attachment_page_title validation}    Run Keyword And Return Status    Page Should Contain    Attachments
    Log    "${attachment_page_title validation}"
    Click Element    ${button.patient_manager.details.attachments.first_attachment.edit}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.maximize_window}    maximize    ${LONG_WAIT}
    ${edit_attachment_page_title validation}    Run Keyword And Return Status    Page Should Contain    Editing patient Attachment
    Log    "${edit_attachment_page_title validation}"
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${textbox.patient_manager.details.attachments.first_attachment.edit.filetype}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${textbox.patient_manager.details.attachments.first_attachment.edit.filetype.clear}
    Perform Actions    Save    ${LONG_WAIT}

Click on Sub-Menu in Patient manager
    [Arguments]    ${sub-menu}
    ${sub-menu_locator}    Update Dynamic Value    ${button.patient_manager.sub-menu}    ${sub-menu}
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${sub-menu_locator}    ${sub-menu}    ${MEDIUM_WAIT}

Navigate to Patient Manager Add Patient Page
    ${patient-manager_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.page_title.patient_manager}    ${MEDIUM_WAIT}
    Log    "${patient-manager_page_title}"
    Log    "Patient Manager" Page is Displayed
    Click on Sub-Menu in Patient manager    Add Patient
    ${patient-manager_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.patient_manager.add_patient.page_title}    ${MEDIUM_WAIT}
    Log    "${patient-manager_page_title}"
    Log    "Patient Details" Form is Displayed

Create New Patient in Patient Manager
    [Arguments]    ${testdata}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    First Name
    Send Text To Textfield    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    First Name    ${LONG_WAIT}    ${testdata}[first_name]
    Log    "${testdata}[first_name]" is entered
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    Last Name
    Send Text To Textfield    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Last Name    ${LONG_WAIT}    ${testdata}[last_name]
    Log    "${testdata}[last_name]" is entered
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    Date Of Birth
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    Wait Until Time    ${MINI_WAIT}
    ${new.button.clientportal.settings_icon.order_column.field_name}    Update Dynamic Value    ${button.clientportal.settings_icon.order_column.field_name}    Prev
    Click On The Element    ${new.button.clientportal.settings_icon.order_column.field_name}    Previous_month    ${LONG_WAIT}
    ${new.textbox.accessioning.requisition.details.general.guardian_dob.day}    Update Dynamic Value    ${textbox.accessioning.requisition.details.general.guardian_dob.day}    5
    Click On The Element    ${new.textbox.accessioning.requisition.details.general.guardian_dob.day}    day_value    ${LONG_WAIT}
    Wait Until Time    ${MINI_WAIT}
    Log    "DOB" is selected
    Send Text To Textfield    ${textbox.patient_manager.add_patient.patient_details.gender}    gender_options    ${LONG_WAIT}    ${testdata}[gender]
    Press Keys    None    RETURN
    Log    "${testdata}[gender]" is selected
    Perform Actions    Save    ${MEDIUM_WAIT}

Search Patient Name in Search Bar in Patient Manager
    [Arguments]    ${testdata}
    ${patient-manager_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.page_title.patient_manager}    ${MEDIUM_WAIT}
    Log    "${patient-manager_page_title}"
    Send Text To Textfield    ${textbox.patient_manager.search_bar}    search bar    ${LONG_WAIT}    ${testdata}[first_name]
    Click On The Element    ${button.patient_manager.search_bar.search}    search    ${LONG_WAIT}

Edit First Patient in Patient Manager
    ${patient-manager_page_title}    Run Keyword And Return Status    Wait Until Page Contains Element    ${label.page_title.patient_manager}    ${MEDIUM_WAIT}
    Log    "${patient-manager_page_title}"
    Log    "Patient Manager" Page is Displayed
    Click On The Element    ${button.patient_manager.first_patient.edit}    edit_first_requisition    ${LONG_WAIT}
    Wait Until Time    ${SHORT_WAIT}

Edit First Patient Details in Patient Manager and Validate Error
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    First Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}    First Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    Last Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}    Last Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    Perform Actions    Save    ${MEDIUM_WAIT}
    Verify Message    ${label.patient_manager.add_patient.firstname_error_message}    ${MEDIUM_WAIT}

Edit Patient Details with Other Insurance Bill in Patient Manager
    [Arguments]    ${testdata}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    First Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}    First Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    First Name
    Send Text To Textfield    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    First Name    ${LONG_WAIT}    ${testdata}[first_name]
    Log    "${testdata}[first_name]" is entered
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    Last Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}    Last Name
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob.clear}
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    Last Name
    Send Text To Textfield    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Last Name    ${LONG_WAIT}    ${testdata}[last_name]
    Log    "${testdata}[last_name]" is entered
    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}    Update Dynamic Value    ${textbox.patient_manager.add_patient.patient_details.common_name_dob}    Date Of Birth
    Click Element    ${new.textbox.patient_manager.add_patient.patient_details.common_name_dob}
    ${previous_month_calender_locator}    Update Dynamic Value    ${button.clientportal.settings_icon.order_column.field_name}    Prev
    Click Element    ${previous_month_calender_locator}
    ${new.textbox.accessioning.requisition.details.general.guardian_dob.day}    Update Dynamic Value    ${textbox.accessioning.requisition.details.general.guardian_dob.day}    10
    Click Element    ${new.textbox.accessioning.requisition.details.general.guardian_dob.day}
    Log    "DOB" is selected
    Send Text To Textfield    ${textbox.patient_manager.add_patient.patient_details.gender}    gender_options    ${LONG_WAIT}    ${testdata}[gender]
    Press Keys    None    RETURN
    Log    "${testdata}[gender]" is selected
    Click On The Element    ${textbox.patient_manager.first_patient.edit.address_icon}    Address_icon    ${LONG_WAIT}
    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Address line 1
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Address    ${LONG_WAIT}    ${testdata}[patient_adress]
    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    City
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    City    ${LONG_WAIT}    ${test_data}[city]
    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    State
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    State    ${LONG_WAIT}    ${test_data}[state]
    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Zip code
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Zip code    ${LONG_WAIT}    ${test_data}[zipcode]
    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Plus4 code
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Plus4 code    ${LONG_WAIT}    ${test_data}[plus4code]
    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    County
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    County    ${LONG_WAIT}    ${test_data}[county]
    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Country
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.address_icon.address_details.common}    Country    ${LONG_WAIT}    ${test_data}[country]
    Wait Until Time    ${SHORT_WAIT}
    Send Text To Textfield    ${textbox.patient_manager.first_patient.edit.bill_type}    Bill textbox    ${LONG_WAIT}    ${testdata}[patient_bill]
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${spinner.locator}
    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Guarantor Relationship
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Guarantor Relationship    ${LONG_WAIT}    Self
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${spinner.locator}
    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Primary Relationship To Insured
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Primary Relationship To Insured    ${LONG_WAIT}    Self
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.patient_manager.first_patient_edit.select_primary_insurance_option.close}    clear_self_pay    ${LONG_WAIT}
    Send Text To Textfield    ${textbox.patient_manager.first_patient.edit.bill.otherinsurance.primaryinsurance}    Primary Insurance    ${LONG_WAIT}    *SELF PAY*
    Wait Until Time    ${MINI_WAIT}
    Press Keys    None    RETURN
    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Primary Insurance Policy Number
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Primary Insurance Policy Number    ${LONG_WAIT}    ${testdata}[phone_number]
    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Guarantor Email
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Guarantor Email    ${LONG_WAIT}    ${testdata}[guarantor_email]
    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Update Dynamic Value    ${textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Guarantor Phone
    Send Text To Textfield    ${new.textbox.patient_manager.first_patient.edit.bill.otherinsurance.guarantor_primaryinsurancepolicy_primaryrelation.details.common}    Guarantor Phone    ${LONG_WAIT}    ${testdata}[phone_number]
    Perform Actions    Save    ${MEDIUM_WAIT}

Verify Admin is Able to Add Site in Patient Manager
    [Arguments]    ${testdata}
    Click On The Element    ${button.patient_manager.details.sites.add}    add button    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.patient_manager.sites.add}    add site textbox    ${MEDIUM_WAIT}    ${testdata}[site_name]
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[site_name]
    Click On The Element    ${new.label.accesioning.details.submenu}    site option    ${MEDIUM_WAIT}
    Click On The Element    ${button.patient_manager.details.add_sites.submit}    submit    ${MEDIUM_WAIT}
    ${new.label.patient_manager.added_site}    Update Dynamic Value    ${label.patient_manager.added_site}    ${testdata}[site_name]
    Wait For The Element to be Visible    ${new.label.patient_manager.added_site}    Added Site    ${MEDIUM_WAIT}
    ${new.button.patient_manager.added_site.menu_hamburger}    Update Dynamic Value    ${button.patient_manager.added_site.menu_hamburger}    ${testdata}[site_name]
    Click Element    ${new.button.patient_manager.added_site.menu_hamburger}
    ${new.button.patient_manager.added_site_hamburger_delete_option}    Update Dynamic Value    ${button.patient_manager.added_site_hamburger_delete_option}    ${testdata}[site_name]
    Click On The Element    ${new.button.patient_manager.added_site_hamburger_delete_option}    delete    ${MEDIUM_WAIT}
    Click On The Element    ${button.accesioning.details.samples.add_sample.delete.yes}    confirm delete    ${MEDIUM_WAIT}

Delete site from patient manager
    [Arguments]    ${Yes_No}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.patientmanager.site.hamburger}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${button.patientmanager.site.delete}
    ${delete_popup _validation}    Run Keyword And Return Status    Page Should Contain    Confirmation required
    Log    "${delete popup validation}"
    Perform Actions    ${Yes_No}    ${LONG_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Deleted Successfully
    Run Keyword If    '${Yes_No}'=='Yes'    Verify Message    ${new.label.accesioning.details.submenu}    ${MEDIUM_WAIT}

Add empty site to patient from Patient Manager
    Click On The Element    ${button.patientmanager.site.add}    Add    ${MEDIUM_WAIT}
    Click On The Element    ${button.patientmanager.medication.save}    Save    ${MEDIUM_WAIT}
    ${new.checkbox.create_new_requisition.ics_code}    Update Dynamic Value    ${checkbox.create_new_requisition.ics_code}    Site is a mandatory field
    Verify Message    ${new.checkbox.create_new_requisition.ics_code}    ${MEDIUM_WAIT}

Edit and Add Empty Site to Patient from Patient Manager
    Click On The Element    ${button.patient_manager.site.edit}    Edit    ${LONG_WAIT}
    Common_RF.Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.patientmanager.edit.site}    Sites    ${MEDIUM_WAIT}
    Clear Element Text    ${button.patientmanager.edit.site}
    Wait Until Time    2
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Save
    Click On The Element    ${new.label.accesioning.details.submenu}    Save    ${MEDIUM_WAIT}
    Verify Message    ${new.label.accesioning.details.submenu}    ${MEDIUM_WAIT}

Add Medication to Patient from Patient Manager
    [Arguments]    ${testdata}
    Click On The Element    ${button.add.medication.patient_manager}    ADD    ${MEDIUM_WAIT}
    Common_RF.Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.add.a.new.medication.patient_manager}    click Add new patient medication    ${MEDIUM_WAIT}    Selenium
    Wait Until Time    2
    ${new.button.patientmanager.edit.medication}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[medication_name]
    Click On The Element    ${new.button.patientmanager.edit.medication}    option    ${MEDIUM_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Save
    Click On The Element    ${new.label.accesioning.details.submenu}    Save    ${MEDIUM_WAIT}

Click on First Element Details button of Patient from Patient Manager
    Click On The Element    ${button.patient_manager.first_element_details}    Details    ${LONG_WAIT}
    Wait Until Element Is Not Visible    ${spinner.locator}    ${LONG_WAIT}    spinner is still visible after waiting ${MEDIUM_WAIT} seconds

Edit filetype of Patient from Attahcments
    Click On The Element    ${button.patint_manager_attachments.edit}    Edit icon    ${LONG_WAIT}
    Send Text To Textfield    ${button.patient_manager.attachments.edit.file.type}    file type    ${MEDIUM_WAIT}    Images
    ${new.button.patientmanager.edit.medication}    Update Dynamic Value    ${button.patientmanager.edit.medication}    2
    Click On The Element    ${new.button.patientmanager.edit.medication}    Images    ${MEDIUM_WAIT}    Selenium
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Save
    Click On The Element    ${new.label.accesioning.details.submenu}    Save    ${MEDIUM_WAIT}    Selenium

Validate Edit_Attachment of Patient from Patient Manager
    [Arguments]    ${testdata}    ${test_data_file_name}
    ${edit_attachment}    Update Dynamic Value    ${button.accesioning.details.attachments.edit}    ${test_data_file_name}
    wait until time    2
    Click On The Element    ${edit_attachment}    edit    ${SHORT_WAIT}
    Select File type in Attachments    ${testdata}    edit
    Page Should Contain    ${testdata}    [File_Type]

Validate Edit_Site of Patinet from Patinet Manager
    Click On The Element    ${button.patient_manager.site.edit}    Edit icon    ${LONG_WAIT}
    Send Text To Textfield    ${button.patientmanager.edit.site}    Editing Site    ${MEDIUM_WAIT}    A PLUS LIFESTYLE MEDICAL GROUP
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${button.patientmanager.edit.medication}    23064
    Click On The Element    ${new.label.accesioning.details.submenu}    options    ${MEDIUM_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Save
    Click On The Element    ${new.label.accesioning.details.submenu}    Save    ${MEDIUM_WAIT}

First Element Edit Button in Patient Manager
    Click On The Element    ${button.patientmanager.first.element.edit}    Edit    ${LONG_WAIT}
    Wait Until Element Is Not Visible    ${spinner.locator}    ${LONG_WAIT}    spinner is still visible after waiting ${MEDIUM_WAIT} seconds
