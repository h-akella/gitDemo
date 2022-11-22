*** Variables ***
${homescreen.label.homepage.client_portal_menu}    xpath://div[@class='menu-title' and text()='Client Portal']
${button.homepage.refusealert}    xpath://a[@id='pushActionRefuse']
${textbox.homepage.common_search}    xpath://input[contains(@class,"search_field")]
${button.homepage.common_search}    xpath://div[text()='Search']
${label.homepage.no_records_found}    xpath://div[text()='No Records Found']
${button.homepage.log_out}    xpath://div[text()='Log Out']
${button.homepage.select_menu}    xpath://div[@class='menu-title' and text()='replaceText']
${button.homepage.accesioning.on_hold_menu}    xpath://span[@class='icon icon-on-hold']//parent::div[@class='tabmenu-icon']
${button.clientportal.newordermenu}    xpath://div[text()='New Order']
${button.clientportal.neworder.infectious_disease}    xpath://div[@class='toolbar-button-title' and text()='Infectious Disease']
${button.homepage.quick_menu_hamburger}    xpath://div[@class='menu-icon nowrap']
${textbox.homepage.quick_menu_search}    xpath://input[@name='menu_search']
${button.homepage.quick_menu_search}    xpath://div[@class='search-button']
${messages.common}    xpath://div[text()='replaceText'] | //p[text()='replaceText']| //span[text()='replaceText']
${button.common.accesioning_or_attachments}    xpath://a[text()='POCT']|//a[text()='Attachments']
${textbox.requisition_filter.patient_name.search_box}    xpath://div[text()='Patient Name']//parent::div[@class='input-with-clear']//input
${button.homepage.patient_name.search_filter_button}    xpath://th[text()='Patients Name']//span[@class='icon-search']
${button.homepage.patient_name_apply_filter}    xpath://*[@id="d97b451a__asterdetails_3_form_submit"]/div
${button.homepage_result_review.requition_buttons}    xpath://td[@title='replaceText1']//ancestor::tr//div[@title='replaceText2']
${textbox.homepage.status_filter.status}    xpath://div[text()='replaceText']//parent::div//input
${button.homepage.common.filter}    xpath://th[text()='replaceText']//span[@class='icon-search']
${homepage.spinner}    xpath://div[contains(@class,'loader')]//div[@class='loading']//i
${label.modify_page_view.select_page_count}    xpath://div[@id="grid-results-selector"]//child::div[2]//select
${button.profile_page.settings_icon}    xpath://span[@class="icon-squaresettings"]
${textbox.profile_page.settings_icon.role}    xpath://div[@title="Role"]//preceding-sibling::input
${textbox.quik_menu.doctor_signature_page.search}    xpath://input[@placeholder='Search by Patient Name, Req name, Doctor, Sample']
${label.popup_alert.get_attribute}    xpath://div[@id='beamerPushModalContent']
${search_filter_using_patient_name}    xpath://label[contains(@for,'patient_name')]//ancestor::form//div[text()='Filter']
${button.homepage.clear_filter}    xpath://th[text()='replaceText']//div[text()='Clear Filter']
${button.homepage.hamburger_comments}    xpath://iframe[contains(@id,"extended_comment_ifr")]
${button.homepage.requisitions.common}    xpath://tr[@data-id='replaceText1']//div[@title='replaceText2']
