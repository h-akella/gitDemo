*** Variables ***
${button.accesioning.pending}    xpath://button[@id="limsabc_qa_tabmenu_i0"]
${button.accesioning.searchdetails.errors}    xpath://div[@id="limsabc_qa_lifecycle_accessioning_pending_details_tabs"]//ancestor::ul//li/a[text()='Errors']
${textbox.accesioning.requisition_completeall.tracking_number}    xpath://input[@name='tracking_number']
${textbox.accesioning.requisition_completeall.start_processing}    xpath://button[@class='el-button button-start-processing el-button--success']//span
${label.accesioning.requisition_completeall.complete_100%_process}    xpath://div[@class='percentage completed']//span[text()='100%']
${textbox.accesioning.requisition_completeall.closemodal}    xpath://span[normalize-space(text())='Close Modal and Refresh Grid']
${button.accesioning.panels}    xpath://a[text()='Panels']
${button.accesioning.pending.add_panel}    xpath://div[@class=' \ grid-toolbar-button add-button-icon' and @title='Add Panels']//div[@class='toolbar-icon-circle']
${button.accesioning.pending.add_new_panel.select_first_panel}    xpath:(//input[@type='checkbox' and @name='selection' and @id])[1]
${label.accesioning.pending.add_new_panel.select_first_panel_name}    xpath:(//input[@type='checkbox' and @name='selection' and @id])[1]//ancestor::td[@class='grid-selection-column noSelect']//following-sibling::td[1]
${button.accesioning.pending.add_new_panel.select_panel.order}    xpath://div[text()='Order']
${label.accesioning.pending.panels.panel_name}    xpath://td[@title='replaceText']
${button.accesioning.pending.panels.select_panel}    xpath://div[contains(@class,'grid-toolbar-button order-panel-button-icon')]//div[text()='Select Panels']//following-sibling::div[@class='toolbar-icon-circle']
${button.accesioning.pending.search_result_details.hamburger_menu}    xpath://div[@class='row-dropdown']//div[@class='row-dropdown-button']
${button.accesioning.pending_search_result.hamburger_menu.on_hold}    xpath://div[text()='On Hold']
${button.accesioning.complete}    xpath://div[text()='Complete']
${button.accesioning.pending_search_result.hamburger_menu.remove_hold}    xpath://div[text()='Remove Hold']
${button.accesioning.pending_search_result.panels.selectpanel.close}    xpath://div[contains(text(),'replaceText')]//parent::div[contains(@class,'lims-autocomplete-wrapper')]//div[@class='lims-autocomplete-close has-active-options']
${label.accesioning.pending.add_new_panel.first_panel}    xpath:(//input[@type='checkbox' and @name='selection' and @id])[1]//ancestor::td[@class='grid-selection-column noSelect']//following-sibling::td[1]
${button.accesioning.details.poct}    xpath://a[text()='POCT']
${button.accesioning.details.poct.add_poct}    xpath://div[text()='Add POCT']
${button.accesioning.firstelementdetails}    xpath:(//div[@title='Details'])[1]
${button.accesioning.details.samples}    xpath://a[text()='Samples']
${button.accesioning.details.samples.add_sample}    xpath://div[text()='Add Sample']
${dropdown.accesioning.details.samples.add_sample.sample_type}    xpath://div[@title='Type']//parent::div//input[@type='text']
${button.accesioning.details.samples.add_sample.save_sample}    xpath://div[contains(@id,'submit')]//div[@class='button-text' and text()='Save']
${textbox.accesioning.details.samples.add_sample.sample_name}    xpath://input[@id='limsabc_qa_lifecycle_addSample_form_name']
${button.accesioning.details.samples.add_sample.delete.no}    xpath://div[text()='No']
${button.accesioning.details.samples.add_sample.delete.yes}    xpath://div[text()='Yes']
${button.accesioning.pending_search_result.hamburger_menu.missing_data}    xpath://span[@class='icon icon-missing-data']//parent::div[@class='tabmenu-icon']
${textbox.accesioning.details.poct.add_poct.positive_checkbox_for_status}    xpath:(//td[@title]//parent::tr//td//span//input[contains(@id,'cb')]//parent::span)[1]
${checkboxbox.accesioning.details.poct.add_poct.positive_checkbox}    xpath:(//td[@title='replaceText']//parent::tr//td//span//input[contains(@id,'cb')])[1]
${button.accesioning.details.poct.add_poct.save}    xpath://div[@class=' \ submit-blue-buttons' and text()='Save' and @id='d1df1366___form_submit']
${label.accesioning.details.poct.add_poct.positive_result}    xpath://td[text()='Positive']
${button.accesioning.details.poct.add_poct.edit}    xpath://div[@title='Edit' and @class='grid-selected-row-icon pb_edit edit-icon']
${button.accesioning.details.poct.edit_poct.clear_poct_type_textbox}    xpath://div[@title='Poct Result']//parent::div//div[@class='clear-button']
${textbox.accesioning.details.poct.edit_poct.type_poct_type}    xpath://div[text()='Poct Result']//parent::div//input[@class='dropdown-text element-input-label done-blue']
${textbox.accesioning.details.poct.edit_poct.type_poct_type_dropdown_opened}    xpath://div[text()='Poct Result']//parent::div//input[@class='dropdown-text element-input-label done-blue placeholder-up']
${button.accesioning.details.poct.edit_poct.save}    xpath://div[@title='Poct Result']//ancestor::form//div//div[@class='button-text' and text()='Save']
${label.accesioning.details.poct.add_poct.negative_result}    xpath://td[text()='Negative']
${messages.accesioning.details.poct.add_poct.select_not_performed_result}    xpath://div[@class='atk-notification-text' and text()='Error: This POCT result not monitored!']
${button.accesioning.details.poct.add_poct.select_infectious_disease_type}    xpath://th[text()='Infectious Disease']//parent::tr//parent::thead//parent::table//tbody//tr[3]//td[1]
${button.accesioning.details.poct.add_poct.select_infectious_disease_type.close}    xpath://div[@class='lims-modal-caption-close-button']//span
${button.accesioning.first_element_details.Insurance}    xpath://a[text()='Insurance']
${button.accesioning.first_element_details.Insurance.update_insurance.save}    xpath://div[contains(@id,'nsuranceview_form_save' ) and text()='replaceText']
${button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}    xpath://select[contains(@name,'insuranceview_form_bill_id')]//parent::div//div[text()='replaceText']
${button.accesioning.first_element_details.insurance.update_insurance.dropdown_arrow_for_selecting_insurance_type}    xpath://label[contains(@for,'nsuranceview_form_bill_id')]//following-sibling::div//div[@class='arrow']
${message.accesioning.first_element_details.insurance.update_insurance.saved}    xpath://div[text()='Saved']
${button.accesioning.first_element_details.General}    xpath://a[text()='General']
${checkbox.accesioning.home_page.search_category}    xpath://label[text()='replaceText']//parent::div//input[@data-shortname='radio']//parent::span
${button.accesioning.details_buttonusing_sampe_id}    xpath://td[contains(@title,"replaceText")]//ancestor::tr//div[@title='Details']
${button.acessioning.remove_panel.close}    xpath://div[contains(text(),'replaceText')]//parent::div[contains(@class,'lims-autocomplete-wrapper')]//div[@class='lims-autocomplete-close has-active-options']
${label.accesioning.panle_name}    xpath://td[@title='replaceText']
${checkbox.accesioning.details.sample_id}    xpath://td[contains(@title,'replaceText')]//ancestor::tr//td[@data-init='limsabc_qa_lifecycle_accessioning_pending_crud_grid']//span
${checkbox.accesioning.poct.add_poct.select_positive_for_attribute}    xpath:(//td[@title='replaceText']//parent::tr//td//span//input[contains(@id,'cb')]//parent::span)[1]
${button.accesioning.details.menu_hamburger}    xpath://td[text()='replaceText']//parent::tr//div[@class='row-dropdown']/div[@class='row-dropdown-button']
${button.accesioning.details.hamburger_menu.delete}    xpath://td[text()='replaceText']//parent::tr//td[@class='row-dropdown-wrapper']//div//button[text()='Delete']
${label.accesioning.disease_name}    xpath://td[@title='replaceText']
${button.accessioning.billing-batch_review}    xpath://div[@title="Billing Batch Review"]//div[@class="toolbar-icon-circle"]
${button.accessioning.billing-batch-review._QA-completed}    xpath://div[@class=" view_search_box \ notification-box"]//span
${button.accessioning.billing-batch-review.green_tick_dyna,mic_QA-complete-form}    xpath://tr[@data-id='replaceText']//td[@style='white-space: nowrap']//span[1]
${button.accessioning.billing-review.requistion#-id}    xpath://p[@id="66973e3d__lumn_view_columns_view_columns_column_p_2"]
${button.accessioning.billing-batch-review.reviewed-forward}    xpath://div[@id="66973e3d__lumn_2_view_columns_view_columns_column_3_button"]
${button.accessioning.billing-batch-review.billing-review}    xpath://div[contains(@class,'small-submit-blue-buttons submit-blue-buttons') and text()='Billing Review']
${button.accessioning.batch-review}    xpath://div[@title="Batch Review"]//div[@class="toolbar-icon-circle"]
${button.accessioning.batch-review.Req#-id}    xpath://p[@id="c53c109f__umns_column_p_2"]
${button.accessioning.batch-review.reviewed-forward}    xpath://div[@id="f3da8afb__olumns_column_3_button"]
${button.accesioning.sample_details_arrow}    xpath://th[contains(@id,'crud_grid_sort_merge_icon')]//i
${label.accesioning.details.sample_id}    xpath:(//tbody[@class='grid_body']//tr//td[@style='white-space: nowrap'][4])[replaceText]
${checkbox.accesioning.details.dynamic_sampleid}    xpath://td[contains(@title,'replaceText')]//preceding-sibling::td//span[contains(@class,'checkbox')]
${button.accesioning.details.arrow}    xpath://th[contains(@id,'crud_grid_sort_merge_icon')]//i[contains(@class,'new-grid-column sort-arrow')]
${label.accesioning.details.attribute_for_sample_id}    xpath:(//tbody[@class='grid_body']//tr//td[contains(@style,'white-space: nowrap')][4])[replaceText]
${label.accesioning.details.req_id_for_attribute}    xpath:(//tbody[@class='grid_body']//tr//td[@style='white-space: nowrap'][5])[replaceText]
${messages.accesioning.billing_batch_review_page.billing_reviewed_message}    xpath://div[text()[normalize-space()='Requisition Billing Reviewed']]
${dropdown.accesioning.general.updated_bill_type}    xpath://label[contains(@for,'htmlelement_form_bill_id')]//parent::div//div[text()='replaceText' and contains(@class,'selected')]
${button.accesioning.all_menu}    xpath://span[@class='icon icon-all']//parent::div[@class='tabmenu-icon']
${button.accesioning.hamburger_submenu_options}    xpath://div[@class="row-dropdown-button"]//following-sibling::div//button[text()='replaceText']|//div[text()='replaceText']
${label.accesioning.view_ordering_physician.image}    xpath://div[@id='limsabc_qa_lifecycle_accessioning_viewSignature_view']//img
${checkbox.accesioning.first_sample_id}    xpath:(//tbody[@class='grid_body']//tr//td[contains(@style,'white-space: nowrap')][4])[1]
${label.accesioning.view_order_signature.view_signature}    xpath://div[text()='View Signature']
${button.accesioning.tool-bar-grid-buttons}    xpath://div[@title='replaceText']//div[@class='toolbar-icon-circle']
${button.accesioning.tool_bar_grid_elements}    xpath://div[@class='toolbar-button-title' and contains(text(),'replaceText')]/parent::div
${textbox.accesioning.tool_bar_grid.print_labels.label_template}    xpath://div[@title='Label Template']/parent::div//input[@type='text']
${dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    xpath://div[contains(text(),'replaceText')]
${dropdown.accesioning.tool_bar_grid.print_labels.label_template.print}    xpath://div[text()='Print']
${button.accesioning.locator_for_getting_patinet.name}    xpath://tr[@data-id='replaceText']//td[9]
${button.accesioning.details.sub-menu}    xpath://a[text()='replaceText']
${label.accesioning.details.submenu}    xpath://div[text()='replaceText']
${button.accesioning.details.samples.reject.save}    xpath://div[@name='limsabc_qa_lifecycle_accessioning_reject_form_form_submit' and text()='Save']
${button.accesioning.attachments.choose_file}    xpath://input[@type='file']
${button.accesioning.attachments.save}    xpath://div[@id='limsabc_qa_custom_molecular_document_upload_form_form_submit']|//div[contains(@id,'crud_form_form_submit')]
${button.accesioning.details.attachments.edit}    xpath://td[text()='replaceText']//parent::tr//div[@title='Edit']
${textbox.accesioning.attachments.filetype}    xpath://div[text()='File type' or text()='File Type']//ancestor::div[@class='lims-dropdown-header']//input[@type='text']
${button.accesioning.attachments.file_type.clear}    xpath://div[text()='File type' or text()='File Type']//ancestor::div[@class='lims-dropdown-header']//div[@class='clear-button']
${button.accesioning.attachments.edit_requisition_image_file_type}    xpath://div[contains(@id,'ud_form_form_submit')]//div[text()='Save']
${button.accesioning.details.attachments.view}    xpath://td[text()='replaceText']//parent::tr//div[contains(@class,'file-preview')]
${textbox.accesioning.sample_commentpredefinedcomment}    xpath://div//span[text()='Predefined Comment']//ancestor::div//input[@type='text']
${button.results.save_sample_comment}    xpath://div[text()='Save']
${label.accesioning.hamburger_option__page_title}    xpath://div[@class='lims-modal-caption-title' and text()='replaceText']
${message.accessioning.verify_sample_id}    xpath://tbody[@class='grid_body']//tr//child::td[3]//following-sibling::td[text()="replaceText"]
${dropdown.accessioning.req_list.panels.select_panels.panels}    xpath://div[@class="lims-autocomplete-textcell has-active-options" and contains(text(),'replaceText')]
${button.req-hamburger}    xpath://tbody[@class="grid_body"]//child::td[@title='replaceText']//preceding-sibling::td//div[@class="row-dropdown-button"]
${button.req-hamburger-options}    xpath://td[@title='replaceText1']//parent::tr//div//button[text()='replaceText2']|//td[@title='replaceText1']//parent::tr//div[text()='replaceText2']
${label.accessioning.get_sample-id_first_requisition}    xpath:(//tbody[@class='grid_body']//tr//td[contains(@style,'white-space: nowrap')][4])[1]
${message.successfully}    xpath://div[text()[normalize-space()='Successfully!']]
${button.actions}    xpath://div[text()='replaceText']|//span[text()='replaceText']
${button.cross(x)}    xpath://span[@class="icon-squarex"]
${button.accesioning.requisition-details_using_sample-id}    xpath://tbody[@class="grid_body"]//child::td[contains(@title,'replaceText')]//preceding-sibling::td//div[@title="Details"]
${get-attribute.accesioning.req-hamburger.add-req-error.first-error-name}    xpath://tbody[@class="grid_body"]//child::tr[@data-id="3"]//child::td[4]
${verify.accesioning.req-details.errors.added-error}    xpath://div[contains(@id,"oning_error")]//td[contains(@title,"replaceText")]
${button.accesioning.req-details.errors.hamburger}    xpath://div[contains(@id,"view_accessioning_error")]//div[@class="row-dropdown-button"]
${button.accesioning.req-details.errors.hamburger.sub-menu(delete)}    xpath://div[contains(@id,"view_accessioning_error")]//div[@class="row-dropdown-listitem"]//child::button[text()='replaceText']
${frame.accesioning.req-hamburger.reject}    xpath://iframe[@title="Rich Text Area. Press ALT-F9 for menu. Press ALT-F10 for toolbar. Press ALT-0 for help"]
${checkbox.accesioning.created_requisition_error_checkbox}    xpath://td[@title='replaceText']//preceding-sibling::td//span
${button.accesioning.req_list.print_req_form.by_replace_sample-id}    xpath://tbody[@class="grid_body"]//child::td[@title='replaceText']//preceding-sibling::td//div[@title="Print Requisition Form"]
${button.accesioning.req_list.print_label.by_replace_sample-id}    xpath://tbody[@class="grid_body"]//child::td[@title='replaceText']//preceding-sibling::td//div[@title="Print Label"]
${button.accesioning.req_list.complete.by_replace_sample-id}    xpath://tbody[@class="grid_body"]//child::td[@title='replaceText']//preceding-sibling::td//div[@title="Complete"]
${checkbox.accesioning.select_requisitions}    xpath://td[@title='replaceText']//preceding-sibling::td//span[@class="checkbox"]
${button.homepage.sub_menu}    xpath://div[@class="tabmenu-text"]//span[text()="replaceText"]
${button.accesioning.details.sub-menu_buttons}    xpath://div[contains(@id,"details_tabs")]//ancestor::ul//li/a[text()='replaceText']
${label.accesioning.attachments.file_name}    xpath://td[@title='QA_TestData.xls']
${button.accesioning.select_predefined_comment}    xpath://div[contains(text(),'replaceText')]
${textfield.accesioning.requisition_hamburger.back_to_pending.comments_field}    xpath://textarea[@name="limsabc_qa_lifecycle_sentBackToPending_form_comment"]
${button.panels.select_panel}    xpath://div[text()="Select Panels"]
${textbox.panels.select_panel.panels_dropdown}    xpath://div[text()="Panels"]//preceding-sibling::input
${button.accesioning.details.medical_neccesity.save}    xpath://label[contains(@for,'risk_assesments')]//ancestor::form//div[text()='Save']
${button.accesioning.filter}    xpath://th[text()='replaceText']//div[text()='Filter']
${textbox.accesioning.medical_necessity.available_search}    xpath://input[@id='available_search']
${label.accesioning.medical_neccesity.available_count}    xpath://div[@class='counts' and contains(text(),'Available:')]
${label.accesioning.medical_neccesity.selected_count}    xpath://div[@class='counts' and contains(text(),'Selected')]
${button.accesioning.medical_neccesity.add_all}    xpath://div[text()='Add all']
${textbox.accesioning.medicalneccesity.selected_documentation_search}    xpath://input[@id='selected_search']
${label.accesioning.details.medical_neccesity.documentaion_count}    xpath://div[@class='counts' and contains(text(),'replaceText')]
${label.accesioning.details.medical_neccesity.available_documentation_list}    xpath:(//div[@class='available-list']//div)[replaceText]
${button.accesioning.details.medical_neccesity.documentation_list}    xpath://div[@class='replaceText-list']//parent::div[@class='list-parent']
${label.accesioning.medical_neccesity.element_selected_list}    xpath://div[@class='selected-list']//div[text()='replaceText']
${button.requisition.details.general.bill_type}    xpath://select[contains(@name,'lement_form_bill_id')]//parent::div//div[text()='replaceText']
${button.accesioning.details.inner_submenu}    xpath://div[contains(@class,'grid-toolbar-button') and @title='replaceText']//div[@class='toolbar-icon-circle']
${label.accesioning.details.medical_neccesity.selected_list}    xpath://div[@class='selected-list']//parent::div[@class='list-parent']
${checkbox.accesioning.details.edical_neccesity.risk_level}    xpath://input[contains(@id,'form_risk_assesments_High')]
${messages.success}    xpath://div[text()='Success']
${messages.accesioning.common}    xpath://span[text()='replaceText']|//div[text()='replaceText']
${textfield.accesioning.req_hamburger.back_to_pending.comments_field}    xpath://textarea[@name="limsabc_qa_lifecycle_sentBackToPending_form_comment"]
${checkbox.accesioning.medical_neccessity.high_risk_assesment}    xpath://input[contains(@id,'form_risk_assesments_High')]
${button.accesioning.homepage.menu_hamburger}    xpath://div[@class='row-dropdown']
${button.accesioning.requisition_hamburger_options.audit}    xpath://div[text()='Audit']
${label.accesioning.audit.date_and_time}    xpath://legend[text()='Last Changed Date']//parent::fieldset//div
${button.accesioning.result_review.confirm_preliminary_report}    xpath://div[contains(@id,'naryReport_confirm_form_button') and text()='Yes']
${button.accesioning.result_review.confirm_already_sent_preliminary_report}    xpath://div[contains(@id,'confirmExist') and text()='Yes']
${button.accesioning.details.samples.first_requaition.reject}    xpath://div[text()='Samples']//parent::div//td[@class='row-dropdown-wrapper'][1]//div[@title='Reject']
${textbox.accesioning.details.samples.reject.reason_rejection}    xpath://textarea[@data-shortname='reason_rejection']
${button.accesioning.details.samples.reject.reject_sample.save}    xpath://form[@id='limsabc_qa_lifecycle_accessioning_rejectSample_form_form']//div[text()='Save']
${label.accesioning.details.samples.reject_sample_status}    xpath://div[text()='Samples']//parent::div//tr[1]//td[@title='Cancelled']
${button.accesioning.details.samples.edit}    xpath://div[text()='Samples']//parent::div//td[@class='row-dropdown-wrapper'][1]//div[@title='Edit']
${textbox.accesioning.details.samples.edit.edit_sample}    xpath://div[@title='Type']//parent::div//input
${button.accesioning.details.samples.edit_sample.save}    xpath://div[text()='Edit Sample']//ancestor::div[@class='lims-modal-core']//div[text()='Save']
${label.accesioning.details.samples.element_for_geting_sample_type}    xpath://tbody//tr[contains(@id,'replaceText')]//div[text()='Samples']//parent::div//tbody//td[7]
${message.common.accesioning.error}    xpath://div[contains(text(),'Error')]
${button.accesioning.home_page_requisition_buttons}    xpath://td[@title="replaceText1"]//ancestor::tr//div[@title='replaceText2']|//div[@class='replaceText2']
${button.requisition.details.general.bill_type}    xpath://select[contains(@name,'htmlelement_form_bill_id')]//parent::div//div[text()='replaceText']
${button.accesioning.requisitions_details.samples.sample_details.select_tests}    xpath://div[text()='Select Tests']//parent::div//div[@class='toolbar-icon-circle']
${button.accesioning.requisition_details.samples.select_tests.remove_all}    xpath://select[@name='limsabc_qa_lifecycle_test_form_panels[]']//parent::div//div[text()='Remove all']
${label.accesioning.details.medical_neccesity.selected_list}    xpath://div[@class='selected-list']//parent::div[@class='list-parent']
${label.accesioning.details.samples.select_tests.selected_list}    xpath://h4[text()='Select a test to order']//parent::div//div[@class='selected-list']//parent::div[@class='list-parent']
${button.accesioning.details.samples.details}    xpath://div[text()='Samples']//parent::div//td[@title='replaceText']//parent::tr//div[@title='Details']
${label.accesioning.requisition_details.samples.select_tests.element_in_available_list}    xpath://div[@class='available-list']//div[text()='replaceText']
${label.accesioning.details.samples.disease_name}    xpath://h4[text()='Tests ']//parent::div//tr//td[@title='replaceText']
${button.accesioning.first_element_details.Insurance.general.save}    xpath://div[contains(@title,'This will update the')]//div[text()='replaceText']
${textbox.accesioning.details.general.date_received}    xpath://div[@class='input-with-clear']//input[contains(@name,'lement_form_date_received')]
${button.accesioning.details.general.now}    xpath://button[text()='Now']
${checkbox.accesioning.details.general.dr_signed}    xpath://label[text()='replaceText']//parent::div//span//input
${element.accesioning.details.general}    xpath://input[@data-shortname='replaceText']
${checkbox.create_new_requisition.ics_code}    xpath://span[text()='replaceText']
${textbox.accesioning.details.general.patient_dob}    xpath://input[@data-shortname="date_of_birth" and contains(@class,"element-input-label done-blue")]
${textbox.accesioning.details.general.gender}    xpath://div[@title='Gender']//parent::div//input
${label.accesioning.details.general.patient_locator}    xpath://input[@data-initvalue='replaceText']
${button.accessioning.All.requisition_record.status.filter}    xpath://div[contains(@id,"rud_grid_3_form_submit")]//div
${button.accessioning.details.errors.add}    xpath://div[text()="Add"]//following-sibling::div
${label.accessioning.details.errors.add.page_title}    xpath://div[text()="Add Error"]
${textbox.accessioning.details.errors.add.requisition_error_type}    xpath://div[text()="Requisition Error Type"]//preceding-sibling::input
${button.accessioning.details.errors.add.save}    xpath://div[@id="limsabc_qa_lifecycle_requisitionError_form_form_submit" and text()='Save']
${button.accesioning.details.errors.add.requisition_erroe_type.cross(x)}    xpath://div[text()="Requisition Error Type"]//following-sibling::div[@class="clear-button"]
${button.accesioning.details.errors.edit_added_error}    xpath:(//td[contains(text(),"replaceText1")]//preceding-sibling::td//child::div[@title="replaceText2"])[last()]
${label.accessioning.details.errors.page_title}    xpath://div[text()="Errors"]
${label.accesioning.details.errors.resolved(tick_mark)}    xpath://td[contains(text(),"replaceText")]//parent::tr//child::div[@align="center"]
${textfield.accesioning.req_hamburger.back_to_pending.comments_field}    xpath://textarea[@name="limsabc_qa_lifecycle_sentBackToPending_form_comment"]
${label.accessioning.details.errors.audit_page.last_changed_date}    xpath://legend[text()="Last Changed Date"]//following-sibling::div
${spinner.locator}    xpath://div[contains(@class,'loader')]//div[@class='loading']//i
${button.accessioning.details.samples.add_sample}    xpath://div[text()="Add Sample"]//following-sibling::div
${textbox.accessioning.details.samples.add_sample.sample#}    xpath://div[text()="Sample #"]//preceding-sibling::input[@id='limsabc_qa_lifecycle_addSample_form_name']
${dropdown.accessioning.details.samples.add_sample.location}    xpath://label[@for="limsabc_qa_lifecycle_addSample_form_location_id"]//following-sibling::div//descendant::input
${dropdown.accessioning.details.samples.add_sample.type}    xpath://div[@title="Type"]//parent::div/input
${textbox.accessioning.details.samples.add_sample.amount}    xpath://div[text()="Amount"]//preceding-sibling::input[@name="limsabc_qa_lifecycle_addSample_form_amount"]
${button.accessioning.details.samples.add_samples.save}    xpath://div[@id="limsabc_qa_lifecycle_addSample_form_form_submit"]
${textbox.accessioning.details.samples.hamburger.edit_location.select_location}    xpath://div[text()='Select location']//preceding-sibling::input
${label.accessioning.details.samples.added_sample.location_name}    xpath://tbody[@class="grid_body"]//tr//child::td[@title="replaceText1"]//following-sibling::td[@title="replaceText2"]
${label.accessioning.requisition_hamburger.message_unreject}    xpath://div[text()[normalize-space()="Requisition Unrejected Successfully"]]
${label.accessioning.add_panel.random_panel_name}    xpath:(//input[@type='checkbox' and @name='selection' and @id])[replaceText]//ancestor::td[@class='grid-selection-column noSelect']//following-sibling::td[1]
${button.accessioning.add_panel.random_panel_name.checkbox}    xpath:(//input[@type='checkbox' and @name='selection' and @id])[replaceText]
${label.accessioning.details.panels.pagetitle}    xpath://div[contains(text(),"Panels for Requsition")]
${label.accessioning.details.sample.pagetitle}    xpath://div[text()="Samples"]
${button.accessioning.details.errors.hamburger}    xpath://tr[contains(@id,'replaceText1')]//td[text()='replaceText2']//parent::tr//div[@class="row-dropdown-button"]
${button.accessioning.details.errors.hamburger_options}    xpath://tr[contains(@id,'replaceText1')]//td[text()='replaceText2']//parent::tr//div[text()='replaceText']
${textbox.accessioning.details.samples.haburger.edit_location.select_location}    xpath://div[text()='Select location']//preceding-sibling::input
${button.accessioning.details.samples.hamburger.edit_loc.select_loc.clear_option}    xpath://div[@title="Select location"]//following-sibling::div
${button.accessioning.details.samples.hamburger.edi_loc.save}    xpath://div[contains(@id,"editLocation_form")]//div[text()="Save"]
${button.accessioning.details.samples.hamburger.comments.add}    xpath://div[@id="limsabc_qa_sample_comments_form_button" and text()="Add"]
${textbox.accessioning.details.panel.select_panel.panel_name}    xpath://div[text()="Panels"]//preceding-sibling::input
${page.accessioning.details.panel.select_panel}    xpath://div[@id="limsabc_qa_lifecycle_panel_form"]
${label.accessioning.details.panels.verify_added_panel}    xpath://td[@title="replaceText1"]//parent::tr//following-sibling::tr//descendant::td[@title="replaceText2"]
${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.baumanii}    xpath:(//div[normalize-space(text())='Acinetobacter baumanii']//label[@class='el-checkbox'])[1]
${button.accesioning.infectioius_disease.date_received.present_now_time}    xpath://span[contains(text(),'Date Received')]//parent::div//input[@value='Now']
${textbox.accesioning.infectious_disease.new_requisition.tracking_number}    xpath://input[@placeholder='Enter tracking number']
${checkbox.accesioning.infectious_disease.new_requisition.doctor_signed.yes}    xpath://span[contains(text(),'Dr Signed On Paper')]//parent::div//span[text()='Yes']//preceding-sibling::span//span
${button.accessioning.details.questionform.list.editanswer}    xpath://td[text()="replaceText"]//preceding-sibling::td//div[@title="Edit Answer"]
${button.accessioning.details.questionform.list.editanswer.dropdown_options}    xpath://div[@title="replaceText"]//preceding-sibling::input
${button.accessioning.details.questionform.list.editanswer.save}    xpath://div[contains(@id,"editQuestion_form")]//div[text()='Save']
${button.accessioning.details.questionform.list.answer_coloumn}    xpath://td[@title="replaceText"]//following-sibling::td
${textbox.accessioning.requisition.details.general.guardian_firstname}    xpath://input[@data-shortname="guardian_first_name"]
${textbox.accessioning.requisition.details.general.guardian_firstname.clear}    xpath://input[@data-shortname="guardian_first_name"]//parent::div//div[@class="clear-button"]
${textbox.accessioning.requisition.details.general.guardian_lastname}    xpath://input[@data-shortname="guardian_last_name"]
${textbox.accessioning.requisition.details.general.guardian_lastname.clear}    xpath://input[@data-shortname="guardian_last_name"]//parent::div//div[@class="clear-button"]
${textbox.accessioning.requisition.details.general.guardian_dob}    xpath://input[@data-shortname="guardian_dob"]
${textbox.accessioning.requisition.details.general.guardian_dob.year}    /xpath:/div[@id="ui-datepicker-div"]//descendant::select[@class="ui-datepicker-year"]
${textbox.accessioning.requisition.details.general.guardian_dob.month}    xpath://div[@id="ui-datepicker-div"]//descendant::select[@class="ui-datepicker-month"]
${textbox.accessioning.requisition.details.general.guardian_dob.day}    xpath://table[@class="ui-datepicker-calendar"]//td//a[text()="replaceText"]
${textbox.accessioning.requisition.details.general.guarantor_email}    xpath://div[text()="Guarantor Email"]//parent::div//input
${textbox.accessioning.requisition.details.general.guarantor_email.clear}    xpath://div[text()="Guarantor Email"]//following-sibling::div
${textbox.accessioning.requisition.details.general.guarantor_ph-no}    xpath://div[text()="Guarantor Phone"]//parent::div//input
${textbox.accessioning.requisition.details.general.guarantor_ph-no.clear}    xpath://div[text()="Guarantor Phone"]//following-sibling::div
${button.accessioning.requisition.details.general.save}    xpath://div[@title="This will update the requisition"]//div[text()="Save"]
${message.success}    xpath://div[text()[normalize-space()='Success']]
${label.accessioning.requisition.details.general.name}    xpath://input[@value="replaceText"]
${label.accessioning.requisition.details.general.guardian_dob}    xpath://input[@data-shortname="guardian_dob" and contains(@value,"replaceText")]
${label.accesioning.critical_error_for_getting_rid}    xpath:(//span[@class='icon icon-blue icon-ico_wrench_critical'])[1]//ancestor::tr
${button.home_page_requisition.complete}    xpath://tr[@data-id='replaceText']//div[contains(@title,'Complete')]
${button.accesioning.req-details.errors.hamburger.sub-menu_options}    xpath://div[contains(@id,"view_accessioning_error")]//div[@class="row-dropdown-listitem"]//child::div[text()='replaceText']
${button.accesioning.protocl_arrow}    xpath://th[contains(text(),'Protocol')]//i
${label.accesioning.get_first_rid}    xpath://tbody//tr[1]
${label.accesioning.audit.last_changed_by_name}    xpath://legend[text()='Last Changed By']//parent::fieldset//div
${label.accesioning.details.errors.resolved(tick_mark)}    xpath://td[contains(text(),"replaceText")]//following-sibling::td//child::div[@align="center"]
${button.accesioning.doctor_signature.submit}    xpath://button[@type='submit']
${button.doctor_signature.spinner}    xpath:(//div[@class='loading'])[1]
${label.doctor_signatiure.physician_demonstration}    xpath:(//td[@title='PHYSICIAN DEMONSTRATION'])[1]
${button.accesioning.filter_type}    xpath://th[text()='replaceText']//span[@class='icon-search']
${textbox.accesioning.filter.filter_sub_category}    xpath://div[text()='replaceText']//parent::div//input
${button.accesioning.apply_filter}    xpath://th[text()='replaceText']//div[text()='Filter']
${button.accesioning.details.submenu}    xpath://td[contains(@title,'replaceText1')]//parent::tr//following-sibling::tr//a[text()='replaceText2']
${textbox.accesioning.details.ssn}    xpath://input[contains(@name,'lement_form_ssn')]
${label.accesioning.attachments.page_title}    xpath://div[@class='lims-modal-caption-title']
${label.accesioning.page_title}    xpath://div[@class='lims-modal-caption-title']
${checkbox.accesioning.general.checkbox_for_attribute}    xpath://label[text()='replaceText']//parent::div//span
${textbox.accesioning.samples.add_samples.select_location}    xpath://label[@for="limsabc_qa_lifecycle_addSample_form_location_id"]//following-sibling::div//descendant::input
${textbox.accesioning.details.erros.add_error.message}    xpath://textarea[contains(@name,"requisitionError_form_message")]
${message.accesioning.error.resolve_error.resolved}    xpath://div[text()[normalize-space()='Resolved!']]
${button.accesioning.error.error_name}    xpath://td[text()='replaceText1'] //preceding-sibling::td[text()='replaceText2']
${button.accesioning.details.errors.error_hamburger}    xpath://tr[contains(@id,'replaceText1')]//td[text()='replaceText2']//parent::tr//div[@class="row-dropdown-button"]
${button.accesioning.details.errors.hamburger.submenu_for_delete}    xpath:(//tr[contains(@id,'replaceText1')]//td[contains(text(),'replaceText2')]//parent::tr//button[text()='replaceText'])[last()]
${button.accesioning.details.errors.error_name}    xpath://tr[contains(@id,'replaceText1')]//td[contains(text(),'replaceText2')]
${message.details.errors.delete_error.succesfully}    xpath://div[text()[normalize-space()="Deleted Successfully"]]
${textbox.accesioning.details.filter}    xpath://div[text()='replaceText']//preceding-sibling::textarea
${label.accesioning.pending_requisitions_without_erros.sample_id}    xpath:(//*[@class='format-icon'][@title[not(string())]])[replaceText]//parent::tr//td[6]
${checkbox.accesioning.all.all_requisitions_without_critical_error}    xpath://td[not(contains(@title,'critical')) and @data-tooltips]//parent::tr//td[contains(@data-init,'limsabc_qa_lifecycle_accessioning')]//input[@type='checkbox']
${label.accesioning.pending_requisitions_without_erros.rid}    xpath:(//*[@class='format-icon'][@title[not(string())]])[replaceText]//parent::tr//td[7]
${label.accesioning.first_requisition_pending_without_error}    xpath:(//td[not(contains(@title,'red')) and @data-tooltips]//parent::tr)[1]
${label.accesioning.first_requisition_all_without_error}    xpath:(//td[not(contains(@title,'critical')) and @data-tooltips]//parent::tr)[1]
${label.accesioning.all.rid}    xpath:(//td[not(contains(@title,'critical')) and @data-tooltips]//parent::tr)[replaceText]//td[7]
${label.accesioning.get_sample-id_from_rid}    xpath://tr[@data-id='replaceText']//td[6]
${checkbox.accesioning.details.hamburger.requisition_error.create_error_checkbox}    xpath://td[@title='replaceText']//preceding-sibling::td//span//input
${button.accesioning.protocol}    xpath://th[text()="Protocol"]//i
${button.accesioning.details.error.hamburger_for_delete_error}    xpath:(//tr[contains(@id,'replaceText1')]//td[contains(text(),'replaceText2')]//parent::tr//div[@class="row-dropdown-button"])[last()]
${message.accesioning.errors.add_comment.added}    xpath://div[text()[normalize-space()='Added']]
${button.accesioning.add_errors.navigate_to_next}    xpath://a[contains(@id,'error_crud_grid_paginator_view')]
${label.requisitions_without_error}    //td[not(contains(@title,'red')) and @data-tooltips]//parent::tr
${button.accesioning.button_for_getting_patient_name}    xpath://tr[@data-id='replaceText']//td[9]
${button.accesioning.requisition_left_menu_complete}    xpath://tr[@data-id='replaceText']//div[@title='Complete']
${accesioning.label_for_getting_r_id_from_sample_id}    xpath://td[@title='replaceText']//parent::tr
${button.accesioning.billing_review_page.billing_review}    xpath://p[contains(text(),'replaceText')]//ancestor::div[@class='atk-row']//div[text()='Billing Review']
${message.error_message.mandatory_field}    xpath://span[contains(text(),'is a mandatory field')]
${textbox.batch_review.add_medication}    xpath://select[@data-shortname='medication_id']//parent::div//input[@type='text']
${textbox.common.print_label.number_of_labels}    xpath://input[contains(@name,'printLabels_form_no_label')]
${button.common.print_labels.set_all}    xpath://div[text()='Set to All']
${button.common.sample_type}    xpath://td[text()='replaceText']
${textbox.accesioning.details.errors.add_error.message}    xpath://textarea[@name='limsabc_qa_lifecycle_requisitionError_form_message']