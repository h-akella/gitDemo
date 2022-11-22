*** Variables ***
${button.result_review.batch_review.send-peliminary}    xpath://div[@id="4b6eb101__mns_column_button"]
${button.result_review.batch_review.alerts-preliminary}    xpath://div[@class="lims-alert-box"]//ancestor::div[@class="button2 noSelect submit-button"]/div
${button.result_review.batch_review.display_reports}    xpath://input[@id="4b6eb101__mns_column_form_display_report"]
${button.result_review.batch_review.infectious-disease}    xpath://input[@id="4b6eb101__mns_column_form_template_InfectiousDisease2_asva.jrxml"]
${checkbox.result_review.batch_review.covid-only_report}    xpath://input[@id="4b6eb101__mns_column_form_template_InfectiousDisease_poct.jrxml"]
${checkbox.result_review.batch_review.view_report_in_another_window}    xpath://input[@id='4b6eb101__mns_column_form_preview_report']
${button.result_review.batch_review.add_poct}    xpath://li[@data-tabid="view_htmlelement_4"]//a
${button.result_review.batch_review.add}    xpath://div[@id="cd379583__nt_4_crud_grid_buttonset_gbtn5"]
${textbox.result_review.batch_review.select.poct}    xpath://label[@for="limsabc_qa_cd379583__nt_4_crud_virtualpage_crud_form_poct_id"]//following-sibling::div//descendant::input
${textbox.result_review.batch_review.select.poct-result}    xpath://label[@for="840ef4cc__rm_poct_result_id"]//following-sibling::div//descendant::input
${button.result_review.batch_review.savepoct}    xpath://div[@id="840ef4cc__rm_form_submit"]//div
${button.result_review.batch_review.savepoct.cross}    xpath://div[@class="lims-modal-caption-close-button"]/span
${button.result_review.batch_review.Medication}    xpath://li[@data-tabid="view_htmlelement_3"]//child::a
${button.result_review.batch_review.Medication.add_medication}    xpath://div[text()='Add Medication']//following-sibling::div[@class='toolbar-icon-circle']
${button.Results.Add_prescribed_med}    xpath://div[@class="lims-autocomplete-parent has-active-options"]
${button.result_review.batch_review.add_prescribed_medication.save}    xpath://div[@id="limsabc_qa_lifecycle_accessioning_prescribe_form_form_submit"]
${button.Results.cross}    xpath://div[@class="lims-modal-caption-close-button"]//span
${text.result_review.add_prescribed_medication.dropdown}    xpath://div[@transport="bar-abc-green2-dropdown" and text()="Clorazepate"]
${button.result_review.batch_review.comment}    xpath://li[@data-tabid="view_htmlelement_5"]//a
${button.result_review.batch_review.comment_menu.sample_comment}    xpath://div[text()='Sample Comment']//parent::div//div[@class='toolbar-icon-circle']
${frame.results_review.create_sample_comment.}    xpath://iframe[contains(@id,"extended_comment_ifr") or contains(@id,'rejection_ifr')]
${textbox.Results.reqcomment}    xpath://body[@id="tinymce"]
${button.Results.save-reqcomment}    css:div#limsabc_qa_addExtendedComment_form_form_submit
${button.Results.req_comments.close}    xpath://span[@class='icon-squarex']
${button.result_review.create_req_comments.maximize}    xpath://div[@class='lims-modal-caption-maximize-button']
${textbox.batchreview.addreqcomment}    xpath://textarea[contains(@id,'extended_comment')]
${messages.accesioning.batch_review.create_comment.save}    xpath://div[text()='Saved']
${button.result_review.batch_review.save_sample_comment}    xpath://div[text()='Save']
${textbox.accesioning.sample_comment.predefinedcomment}    xpath://div[text()='Predefined Comment']//parent::div//input[@type='text']
