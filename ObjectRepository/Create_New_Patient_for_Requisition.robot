*** Variables ***
${textbox.create_new_patient.address}    xpath://input[@id='address_obj.components.delivery_line_1.value']
${textbox.create_new_patient.mobile_number}    xpath://div[@id='phone']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarantor_relationship}    xpath://div[@id='guarantor_relationship_id']//following-sibling::div//input[@type='text']
${dropdown.create_new_patient.father}    xpath://span[text()='Father']
${textbox.create_new_patient.guarantor_firstname}    xpath://div[@id='guarantor_first_name']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarantor_lastname}    xpath://div[@id='guarantor_last_name']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarantor_dob}    xpath://div[@id='guarantor_dob']//following-sibling::div//input[@type='text']
${button.create_new_patient.guarantor_gender_id}    xpath://div[@id='guarantor_gender_id']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarontor_address}    xpath:guarantor_address_obj.components.delivery_line_1.value
${messages.create_new_requisition.error_message_without_filing_mandatory_fields}    xpath://p[text()='Please fill in all required fields']
${button.client_portal.create_new_patient.cancel}    xpath://div[@aria-label='Add Patient']//section//span[text()='Cancel']
${button.client_portal.create_new_patient.edit}    xpath://span[@id='patient']//parent::div//i[@class='el-icon-edit']
${button.create_new_patient.edit.update}    xpath://span[text()='Update']
${label.create_new_requisition.updated_patient_name}    xpath://li[@class='el-select-dropdown__item selected']//span
${messages.create_new_requisition.please_attach_insurance}    xpath://p[text()='Please attache the insurance document']
${textbox.create_new_patient.guarantor}    xpath://div[@id='replaceText']//parent::div//input
${button.create_new_patient.gender}    xpath:(//li//span[text()='replaceText'])[1]
${label.create_new_requisition.create_new_patient.get_attribute_for_gender}    xpath://span[contains(text(),'replaceText')]//parent::li
${button.create_new_requisition.create_new_patient.secondary_insurance_options.self_pay_and_self}    xpath://*[contains(@id,'secondary_insured_last_name')]//following::span[text()='replaceText']
${button.create_new_requisition.create_new_patient.gender}    xpath:(//*[contains(@class,'el-select-dropdown__list')]//following::*[contains(@class,'el-scrollbar__view')][23]/li/span[text()='replaceText'])[2]
${label.create_new_requisition.create_new_patient.get_attribute_for_gender}    xpath://span[contains(text(),'replaceText')]//parent::li
${button.create_new_requisition.create_new_patient.secondary_insurance_options.self_pay_and_self}    xpath://*[contains(@id,'secondary_insured_last_name')]//following::span[text()='replaceText']
${button.create_new_requisition.create_new_patient.gender}    xpath:(//*[contains(@class,'el-select-dropdown__list')]//following::*[contains(@class,'el-scrollbar__view')][23]/li/span[text()='replaceText'])[2]
