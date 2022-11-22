*** Variables ***
${button.clientportal.neworder.submenu}    xpath://div[@class='toolbar-button-title' and text()='replaceText']
${button.clientportal.neworder.submenu.medical_neccesity_checkboxes}    xpath://span[text()='replaceText']//parent::label//span[contains(@class,'el-radio__input') or contains(@class,'el-checkbox__input')]
${button.clientportal.neworder.submenu.medical_neccesity.received_from}    xpath://div[normalize-space(text())='Received From']//following-sibling::div[1]//div//input
${label.clientportal.has_an_attachment}    xpath://tbody[@class='grid_body']//tr[replaceText]//td[@class='format-icon']//span[@class='icon icon-blue icon-reference-lab']
${label.client_portal.get_attribute_for_first_requisition_rid}    xpath://tbody[@class='grid_body']//tr[1]//div[@class='row-dropdown-button']//ancestor::tr
${button.client_portal.hamburger_menu_using_rid}    xpath://tbody[@class="grid_body"]//tr[@data-id='replaceText']//div[@class='row-dropdown-button']
${label.client_portal.first_requisition_without_attachment}    xpath:(//td[not(contains(@data-tooltips,'reference-lab;Has attachment')) and @class='format-icon'])[1]//parent::tr
${button.client_portal.req-hamburger-options}    xpath://tr[@data-id='replaceText1']//div[@class='row-dropdown active']//div[@class='row-dropdown-listitem']//div[text()='replaceText2']
${label.client_portal.regenrate_form_attachment_icon}    xpath://td[text()='replaceText']//parent::tr//td//span[@class='icon icon-blue icon-reference-lab']
${icon.client_portal.new_report.requisition_list.comments}    xpath://td[contains(@title,"comment;Has comments,, ")]//span[contains(@class,"comment")]
${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}    xpath://div[@class="new-lims-grid-swipe-arrow new-lims-grid-swipe-arrow-right visible"]
${button.client_portal.new_report.requisition_list.portal_status}    xpath://th[text()="Portal Status"]//span[@class="icon-search"]
${textbox.client_portal.new_report.requisition_list.portal_status.select_filter_dropdown_arrow}    xpath://th[text()="Portal Status"]//div[@title='Select Filter']//ancestor::div[@class='lims-dropdown-header']//div[@class='arrow']
${textbox.client_portal.new_report.requisition_list.portal_status.portal_status_textfield}    xpath://div[text()="Portal Status"]//preceding-sibling::input
${button.client_portal.new_report.requisition_list.portal_status.filter}    xpath://div[@id="64918cdc__rdetails_8_form_submit"]//div
${button.client_portal.new_report.requisition_form.preview_report}    xpath://tbody[@class="grid_body"]//child::tr[@data-id="replaceText"]//child::div[@title="Preview Report"]
${page_title.client_portal.new_report.requisition_form.preview_report}    xpath://div[contains(text(),'Final Reports')]
${textbox.client_portal.new_report.requisition_list.portal_status.select_filter.replace_value}    xpath://th[text()="Portal Status"]//div[@title='Select Filter']//ancestor::div[@class='lims-dropdown-header']//following-sibling::div[@class="dropdown-list-wrapper"]//div[text()="replaceText"]
${button.client_portal.new_order.infectious_disease.patient.edit_patient}    xpath://span[@id="patient"]//following-sibling::div//child::button//i[@class="el-icon-edit"]
${button.client_portal.new_order.infectious_disease.patient.edit_patient.first_name}    xpath://div[@id="first_name"]//following-sibling::div//child::input
${button.client_portal.new_order.infectious_disease.patient.edit_patient.last_name}    xpath://div[@id="last_name"]//following-sibling::div//child::input
${button.client_portal.new_order.infectious_disease.patient.edit_patient.cancel}    xpath://span[contains(normalize-space(.),"Edit Patient")]//parent::div//following-sibling::div//descendant::footer//descendant::span[text()="replaceText"]
${label.client_portal.new_order.infectious_disease.new_ordering_provider.error_message}    xpath://p[contains(text(),"Error saving doctorDoctor first name cannot have special caracters!")]
${button.clientportal.pending_lab_work.advance_features}    xpath://div[text()="Advance Features"]
${textbox.clientportal.advance_features.edit_collection_date.calender}    xpath://input[@placeholder="mm/dd/yyyy hh:mm"]
${textbox.clientportal.advance_features.edit_collection_date.calender.next_month_arrow(>)}    xpath://button[@aria-label="Next Month"]
${textbox.clientportal.advance_features.edit_collection_date.calender.day}    xpath://span[normalize-space(.)="replaceText"]
${textbox.clientportal.advance_features.edit_collection_date.calender.ok}    xpath://span[normalize-space(.)="OK"]
${textbox.clientportal.advance_features.edit_collection_date.calender.future_date.message}    xpath://div[normalize-space(.)="Collection Date shouldn't be greater than the current date + 7 days"]
${textbox.client_portal.requisition.details.insurance.bill}    xpath://div[@title="Bill"]//parent::div//input
${button.client_portal.requisition.details.insurance.bill.clear}    xpath://div[@title="Bill"]//following-sibling::div
${button.client_portal.requisition.details.insurance.bill.dropdown}    xpath://select[@data-shortname="bill_id"]
${button.client_portal.requisition.details.insurance.bill.save.error_message}    xpath://span[text()="Bill is a mandatory field"]
${button.client_portal.requisition.details.insurance.bill.save.message}    xpath://div[text()="Saved"]
${button.clientportal.settings_icon}    xpath://div[@title='Order Columns']
${label.client_portal.settings_icon.order_column_pagetitle}    xpath://div[@class="lims-modal-caption-wrapper"]//div[text()='Order Columns']
${button.clientportal.settings_icon.order_column.field_name}    xpath://span[text()='replaceText']
${button.clientportal.settings_icon.order_column.field_name.edit}    xpath://span[text()="replaceText"]//following-sibling::span[contains(@class,'icon-edit')]
${textbox.clientportal.settings_icon.order_column.field_name.edit.field_caption}    xpath://input[contains(@name,'edit_form_field_caption')]
${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.clear}    xpath://input[contains(@name,'edit_form_field_caption')]//following-sibling::div[@class="clear-button"]
${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.submit}    xpath://div[contains(@id,'edit_form_form_submit')]
${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.submit.message}    xpath://div[@class="atk-notification-text" and starts-with(normalize-space(.),'Edited')]
${button.clientportal.settings_icon.order_column.field_name.edit.field_caption.submit.message.save.message}    xpath://div[@class="atk-notification-text" and normalize-space(.)='Successfully saved grid order']
${label.clientportal.settings_icon.order_column.field_name.edit.pagetitle}    xpath://div[contains(text(),"Edit Column")]
${label.clientportal.data_grid.order_position}    xpath://th[3]
${label.clientportal.no_requisition_selected.advance_features.click_sub-menu.error_message}    xpath://div[@class="atk-notification-text" and normalize-space(.)="Please, select requisition"]
${label.clientportal.infectious_disease.create_requisition.cancel.page_title}    xpath://span[text()="Are you sure?"]
${button.clientportal.infectious_disease.create_requisition.cancel.yes_or_no}    xpath://span[text()="Are you sure?"]//parent::div//following-sibling::div//div[text()="replaceText"]
${textbox.clientportal.infectious_disease.new_requisition.new_ordering_provider.phone}    xpath://div[@id="phone"]//following-sibling::div//child::input
${button.client_portal.create_new_requisition.medical_neccesity.done}    xpath://div[@aria-label='Medical Necessity']//button//span[text()='Done']
${button.client_portal.infectious_disease.ics_code.done}    xpath://span[contains(text()," ICD-10 codes")]//parent::div//following-sibling::div[@class="el-dialog__footer"]//span
${checkbox.create_new_requisition.covid_only}    xpath://div[normalize-space(text())='COVID-19 Coronavirus (SARS-CoV-2)']//span[@class='el-checkbox__inner']
${button.create_new_requisition.syndromic_menu_filter.covid_disease_category}    xpath://div[@title='Covid-19']
${button.infectious_disease.aoe}    xpath://span[text()='AOE']//parent::button
${label.infectious_disease.aoe.page_title}    xpath://span[text()='Questions']
${textfield.infectious_disease.aoe.symptoms_of_covid-19}    xpath://div[contains(text(),"symptoms of COVID-19")]//following-sibling::div//input
${button.infectious_disease.aoe.symptoms_of_covid-19.yes_no_options}    xpath://div[contains(text(),'symptoms of COVID-19')]//ancestor::div[@class="el-dialog__wrapper"]//following-sibling::div[@class="v-modal"]//following-sibling::div//ul//li//span[text()="replaceText"]
${button.infectious_disease.aoe.done}    xpath://span[text()="Questions"]//parent::div//following-sibling::div//span[text()="Done"]
${button.clientportal.htrxicon.arrow}    xpath://th[text()="HTRXQZ_ICON"]//i
${textfield.clientportal.requisition.details.insurance.bill.other_insurance.patient_details}    xpath://div[text()="replaceText"]//parent::div//input
${button.clientportal.requisition.details.insurance.bill.other_insurance.guarantor_address}    xpath://div[text()="Guarantor Address"]//parent::div//following-sibling::div[@class="lims-dropdown-buttons-wrapper"]//div[@title="Address Info"]//span
${button.clientportal.requisition.details.insurance.bill.other_insurance.guarantor_dob}    xpath://div[text()="Guarantor Dob"]//ancestor::div//following-sibling::div[contains(@id,"insuranceview_form_guarantor_dob")]//div[@class=" \ calendar-button"]
${button.clientportal.requisition.details.insurance.bill.other_insurance.guarantor_address.same_as_patient}    xpath://span[text()="Guarantor Address"]//parent::label//following-sibling::div//div[text()="Same as Patient"]
${textbox.clientportal.infectious_disease.create_new_patient.common_gender}    xpath://*[contains(@class,'el-select-dropdown__list')]//following::*[contains(@class,'el-scrollbar__view')][23]/li/span[text()='replaceText']
${textbox.infectious_disease.create_new_patient.medicaid_bill.primary_insurance_and_primary_relation.common}    xpath://*[text()='replaceText']//following::span[text()='replaceText']
${textbox.infectious_disease.create_new_patient.workers_compensation_bill.primary_insurance_and_primary_relation.common}    xpath://*[contains(@id,'claim_number')]//following::span[text()='replaceText']
${textbox.infectious_disease.create_new_patient.medicare_bill.primary_insurance_option}    xpath://*[contains(@id,'secondary_insured_last_name')]//following::span[text()='replaceText']
${textbox.infectious_disease.create_new_patient.medicare_bill.primary_relationship_option}    xpath:(//li//span[text()='replaceText'])[3]