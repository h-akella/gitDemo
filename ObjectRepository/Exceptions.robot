*** Variables ***
${dropdown.exceptions.details.insurance.arrow_for_selecting_dropdown}    xpath://label[contains(@for,'b2884111___form_bill_id')]//following-sibling::div//div[@class='arrow']
${label.exceptions.get_requisition_id}    xpath://tbody//tr[1]//td[7]
${label.exceptions.details.panel.add_panel.order.error_message}    xpath://div[@class='atk-notification-text' and normalize-space(.)='Error: Must be set at least one panel!']
${button.exceptions.details.insurance.bill_textbox.clear}    xpath:(//div[@title="Bill"]//following-sibling::div)[2]
${textbox.exceptions.details.insurance.bill_textbox}    xpath:(//div[@title="Bill"]//parent::div//input)[2]
${button.exceptions.details.insurance.save}    xpath:(//div[text()="Save"])[2]
${button.exceptions.details.insurance.save_and_update_patient}    xpath:(//div[text()="Save and Update the Patient"])[2]
${label.exceptions.details.insurance.bill.other_insurance.save.error_message}    xpath://span[contains(text(),'mandatory field')]
${button.exceptions.details.attachments.upload.save}    xpath://div[contains(@id,"document_upload_form_form_submit")]
${textbox.exceptions.tool_bar.search_textbox}    xpath://form[contains(@id,"crud_grid_abcquicksearch_form")]//input[contains(@name,"grid_abcquicksearch_q")]
${button.exceptions.tool_bar.search_icon}    xpath://button[contains(@id,"abcquicksearch_view")]
${label.exceptions.get_sample_id}    xpath:(//tbody//tr//td)[4]
${label.exceptions.get_sample#}    xpath:(//tbody//tr//td)[5]
${button.exceptions.details.samples.requisitions_hamburger}    xpath://td[text()='replaceText']//parent::tr//div[@class="row-dropdown-button"]
${button.exceptions.details.samples.next_page}    xpath://a[contains(@id,'details_tabs_samples_crud_grid_paginator_view')]
${button.exceptions.details.samples.hamburger_comments_option}    xpath://td[text()='replaceText']//parent::tr//div[text()='Comments']
${label.exceptions.details.samples.get_sample_type}    xpath://td[text()='replaceText']//parent::tr//td[7]
${button.exceptions.first_requisition.icon.send_notification}    xpath:(//tbody//tr)[1]//div[@title="Send Notification"]
${textbox.requisition.icon.send_notification.notify_contact}    xpath://div[text()="Notify Contact"]//preceding-sibling::input
${button.exceptions.details.samples.reject.save}    xpath://div[contains(@name,'__m_form_submit')]
${button.exceptions.details.samples.reject}    xpath://td[text()='replaceText']//parent::tr//div[@title='Reject']
${label.exceptions.details.samples.get_reject_status}    xpath://td[text()='replaceText']//parent::tr//td[4]
${button.common.details.samples.}    xpath://td[text()='replaceText1']//parent::tr//div[text()='replaceText2']
${button.common.details.samples.hamburger_submenu_options}    xpath://td[text()='replaceText1']//parent::tr//div[text()='replaceText2']
${label.exceptions.errors.get_first_error_name}    xpath:(//div[@title='Comment']//parent::td//parent::tr)[1]//td[2]
${textbox.exceptions.details.errors.search_error}    xpath://div[text()='Errors']//parent::div[contains(@id,'_error_crud_grid')]//input[contains(@name,'id_abcquicksearch_q')]
${button.exceptions.details.errors.search}    xpath://div[text()='Errors']//parent::div[contains(@id,'error_crud_grid')]//button[@class='quicksearch-icon']
${button.exceptions.details.errors.get_error_count}    xpath://div[@title='Comment']
${button.exceptions.details.errors.next_page}    xpath://a[contains(@id,'error_crud_grid_paginator_view')]
${label.exceptions.errors.edit.error_type}    xpath://option[text()='replaceText' and @selected]
${label.exceptions.details.errors.verify_error_name}    xpath://p[contains(text(),'replaceText')]
${button.exceptions.details.attachment.hamburger}    xpath://div[contains(@id,"details_tabs_view_htmlelement_5")]//tr[1]//td//div[@class="row-dropdown"]//div[contains(@class,'button')]
${button.exceptions.details.attachment.hamburger.delete}    xpath://div[contains(@id,"details_tabs_view_htmlelement_5")]//tr[1]//td//child::button[text()='Delete']
${label.exceptions.details.attachment.first_attachment_name}    xpath://div[contains(@id,"details_tabs_view_htmlelement_5")]//tr[1]//td[2]
${button.exceptions.details.attachments.edit_attachment}    xpath://div[contains(@id,"details_tabs_view_htmlelement_5")]//tr[1]//td//div[@title="Edit"]
${label.exceptions.details.attachment.first_attachment_file-type_name}    xpath://div[contains(@id,"details_tabs_view_htmlelement_5")]//tr[1]//td[3]
${label.common.details.get_all_requisition_count}    xpath://div[@title="replaceText"]
${button.exceptions.details.attachment.search_bar}    xpath://div[contains(@id,'attachments_crud_grid')]//descendant::form[contains(@id,"abcquicksearch_form")]//input[contains(@name,"icksearch_q")]
${button.exceptions.details.attachment.search_bar.search_icon}    xpath://div[contains(@id,'attachments_crud_grid')]//descendant::button[contains(@id,"icksearch_view")]
${button.exceptions.firs_req_detailks.samples.reject_requisition.save}    xpath://div[@id='limsabc_qa_lifecycle_accessioning_reject_form_form_submit']
${textbox.exceptions.details.insurance}    xpath://input[@data-shortname='replaceText' and contains(@id,'insurance')]
${button.exceptions.general.client_site_textbox.close}    xpath://input[contains(@name,'lement_form_client_site_id')]//parent::div//div[@class='lims-autocomplete-close']
${textbox.exceptions.general.client_site}    xpath://input[contains(@id,"lement_form_client_site_id")]//parent::div//input[@type='text']
${textbox.exceptions.general.site_contact}    xpath://input[contains(@id,"lement_form_site_contact_id")]//parent::div//input[@type='text']
${textbox.exceptions.general.order_physician}    xpath://div[@title='Ordering Physician']//parent::div//input
${textbox.exceptions.general.protocol}    xpath://div[text()='Protocol']//parent::div//input
${button.exceptions.firs_req_detailks.samples.reject_requisition.save}    xpath://div[@id='limsabc_qa_lifecycle_accessioning_reject_form_form_submit']
${textbox.exceptions.details.insurance}    xpath://input[@data-shortname='replaceText' and contains(@id,'insurance')]