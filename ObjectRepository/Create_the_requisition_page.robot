*** Variables ***
${textbox.new_requisition.clientsite}    xpath://div[@id='clientSite']//following-sibling::div//input[@type='text']
${textbox.new_requisition.orderingphysician}    xpath://div[@id='siteDoctor']//following-sibling::div//input[@type='text']
${textbox.new_requisition.sitecontact}    xpath://div[@id='siteContact']//following-sibling::div//input[@type='text']
${textbox.new_requisition.patientname}    xpath://span[@id='patient']//parent::div//input[@type='text']
${textbox.new_requisition.patientbill}    xpath://div[@id='patient.bill_id']//following-sibling::div//input[@type='text']
${textbox.new_requisition.ics_codes}    xpath://span[@id='icd_codes']//parent::div//following-sibling::div//input[@class='el-select__input is-small']
${textbox.new_requisition.medication}    xpath://span[@id='medication']//parent::div//following-sibling::div//input[@class='el-select__input is-small']
${button.new_requisition.save}    xpath://span[text()='SAVE']
${button.new_requisition.syndromic_menu_filter}    xpath://div[normalize-space(text())='Syndromic Menu Filter']//parent::div//i
${button.select_present_time}    xpath://input[@value='Now']
${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}    xpath://small[normalize-space(text())='Swab Site:']//ancestor::div//div[@class='el-select el-select--mini']
${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.baumanii}    xpath:(//div[normalize-space(text())='Acinetobacter baumanii']//label[@class='el-checkbox'])[1]
${checkbox.provide_acknowledgement}    xpath://input[@name='Provider/Delegate Acknowledgement']|//input[@name='Collector Acknowledgement']//parent::span
${button.new_requisition.confirm}    xpath://button//span[text()='Confirm']
${textbox.new_requisition.create_new_patient.patient_bill_category}    xpath://div[@id='bill_id']//following-sibling::div//input[@type='text']
${textbox.new_requisition.create_new_patient.first_name}    xpath://div[@id='first_name']//parent::div//div[@class='el-input el-input--small el-input--suffix']//input
${textbox.new_requisition.create_new_patient.DOB}    xpath://input[@placeholder='mm/dd/yyyy']
${textbox.new_requisition.create_new_patient.select_gender}    xpath://div[@id='gender_id']//following-sibling::div//input[@placeholder='Select']
${button.new_requisition.create_new_patient.save}    xpath://span[text()='Save']
${textbox.new_requisition.create_new_patient.last_name}    xpath://div[@id='last_name']//parent::div//div[@class='el-input el-input--small el-input--suffix']//input
${dropdown_for_suggestion.new_requisition}    xpath://li//span[text()='replaceText']
${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    xpath:(//li//span[text()='replaceText'])[2]
${dropdown.create_req.patient_name}    xpath://div[@x-placement]//li//span[text()='replaceText']
${button.client_portal.create_new_requisition.create_new}    xpath://*[@id='replaceText']//parent::div//button[@class='el-button el-button--default el-button--small is-circle']//i
${textbox.client_portal.createnewrequisition.create_new_order_physician}    xpath://div[@id='replaceText']//parent::div//input
${button.create_new_requisition.create_new_order_physician.save}    xpath://span[text()='Save']
${button.client_portal.create_new_requisition.syndromic_menu_filter.ketamine_option}    xpath:(//div[normalize-space(text())='KETAMINE']//span[@class='el-checkbox__input'])[1]
${label.create_new_requisition.documents.title}    xpath://span[@class='el-dialog__title' and text()='Documents']
${button.create_new_requisition.documents.done}    xpath://div[@aria-label='Documents']//button//span[text()='Done']
${button.create_new_requitition.select_insurance_attached_bill_type.documents.upload}    xpath://span[text()='Upload']//parent::button//parent::div//input
${dropdown.create_requisition.documents.filetype}    xpath:(//tr/td[2]/div[@class='el-select full-width el-select--small']//input)[replaceText]
${label.create_new_requisition.doctor_signature_label}    xpath://span[contains(text(),'Doctor Signed')]//parent::div//parent::div//img
${button.create_new_requisition.syndromic_menu_filter.pnuemonia_disease_category}    xpath://div[@title='Bacterial Pneumonia']
${checkbox.create_new_requisition.covid_only}    xpath://div[normalize-space(text())='COVID-19 Coronavirus (SARS-CoV-2)']//span[@class='el-checkbox__inner']
${textbox.create_new_requisition.patient_address}    xpath://div[@id='patient.address_obj.components.replaceText']//parent::div//input
${textbox.create_new_requisition. create_patient.city}    xpath://input[@id='patient.address_obj.components.city_name.value']
${button.create_new_requisition.patient_address_dropdown}    xpath:(//button[@class='el-button suggestion-button el-button--default el-button--mini'])[1]
${textbox.create_new_requisition.patient_delivery_address}    xpath://input[@id='patient.address_obj.components.delivery_line_1.value']
${textbox.create_new_requisition.patient_address.select_state}    xpath://div[@id='patient.address_obj.components.state_abbreviation']//parent::div//span[@class='el-input__suffix']
${textbox.create_new_requisition.patient_address_edit}    xpath://div[@id='patient.replaceText']//parent::div//input
${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.baumanii}    xpath:(//div[normalize-space(text())='Acinetobacter baumanii']//label[@class='el-checkbox'])[1]
${button.accesioning.infectioius_disease.date_received.present_now_time}    xpath://span[contains(text(),'Date Received')]//parent::div//input[@value='Now']
${textbox.accesioning.infectious_disease.new_requisition.tracking_number}    xpath://input[@placeholder='Enter tracking number']
${checkbox.accesioning.infectious_disease.new_requisition.doctor_signed.yes}    xpath://span[contains(text(),'Dr Signed On Paper')]//parent::div//span[text()='Yes']//preceding-sibling::span//span
${button.create_new_requisition.syndromic_menu_filter.pnuemonia_disease_category}    xpath://div[@title='Bacterial Pneumonia']
${button.client_portal.create_new_requisition.edit_patient}    xpath://*[@id='patient']//parent::div//button[@class='el-button el-button--default el-button--small is-circle']//i[@class='el-icon-edit']
${label.create_new_requisition.edit_patient.page_title}    xpath://span[contains(text(),'Edit Patient')]
${button.create_new_requisition.icd_code.submit}    xpath://p//b[text()='Relevant ICD Codes']//ancestor::div[@role='dialog']//span[text()='Done']
${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.baumanii}    xpath:(//div[normalize-space(text())='Acinetobacter baumanii']//label[@class='el-checkbox'])[1]
${button.accesioning.infectioius_disease.date_received.present_now_time}    xpath://span[contains(text(),'Date Received')]//parent::div//input[@value='Now']
${textbox.accesioning.infectious_disease.new_requisition.tracking_number}    xpath://input[@placeholder='Enter tracking number']
${checkbox.accesioning.infectious_disease.new_requisition.doctor_signed.yes}    xpath://span[contains(text(),'Dr Signed On Paper')]//parent::div//span[text()='Yes']//preceding-sibling::span//span
${button.create_new_requisition.documents}    xpath://button//span[text()='Documents']
${button.create_requisition.edit_icd_code}    xpath://div[@class='icd-selection-by-category']//i[@class='el-icon-edit']
${button.icd_code_option}    xpath://span[text()='replaceText']//parent::label//span[@class='el-checkbox__inner']
${textbox.create_new_order.swab.site.note}    xpath://input[@placeholder='Enter swab site note']
${button.create_new_requisition.swab_site_collection_date_now}    xpath://div[normalize-space(.)="Collection Date"]//input[@value='Now']
${button.create_new_requisition.patient_bill_type_for_attribute}    xpath://span[text()='replaceText']//parent::li
${radio_button.create_new_requisition.doctor_signed}    xpath://span[contains(text(),'Dr Signed On Paper')]//parent::div//span[text()='replaceText']//preceding-sibling::span//span
${message.common.create_new_requisition}    xpath://p[text()='replaceText']
${button.create_new_requisition.update_patient}    xpath://button//span[text()='Update']
${textbox.create_new_patient.updated_patient_name}    xpath:(//li//span[contains(text(),'replaceText')])[1]
${dropdown_for_suggestion.new_requisition.create_patient.patient_bill.medicare_other_insurance}    xpath:(//li//span[text()="replaceText"])[4]
${button.create_new_requisition.documents.capture}    xpath://button//span[text()='Capture']
${button.create_new_requisition.documents.capture_image.capture}    xpath://div[@class='el-card__body']//button//span[text()='Capture']
${checkbox.create_new_requisition.documents.file_type_save}    xpath:(//th[text()='File Name']//ancestor::table//span[@class='el-checkbox__input'])[replaceText]
${button.create_new_requisition.documents.delete}    xpath://th[text()='File Name']//ancestor::table//i[@class='el-icon-delete']
${label.create_new_requisition.documents.number_of_files}    xpath://th[text()='File Name']//ancestor::table//tbody//tr
${button.create_new_requisition.documents.file_type_option}    xpath:(//span[text()='replaceText1'])[replaceText2]
