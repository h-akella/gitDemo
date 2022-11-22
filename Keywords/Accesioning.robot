*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Add New Panel and Verify Panel is Added
    [Arguments]    ${testdata}
    Log    Verify Error Messages When no panel is selected
    Verify Error Message when No Panel Is Selected    ${testdata}
    Run Keyword If    '${testdata}[Negative_validation]'=='Negative_validation'    Return From Keyword
    Wait For The Element to be Visible    ${button.accesioning.pending.add_new_panel.select_first_panel}    Required Panel checkbox    ${MEDIUM_WAIT}
    ${panel_name}    Get Element Attribute    ${label.accesioning.pending.add_new_panel.first_panel}    title
    ${splitted_panel_name}    Split String    ${panel_name}    \ (***
    ${updated_panel_name}    Set Variable    ${splitted_panel_name}[0]
    Log    Select any panel and click on Order
    Javascript Click    ${button.accesioning.pending.add_new_panel.select_first_panel}
    Screenshot.Take Screenshot
    Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    order button    ${MEDIUM_WAIT}
    Wait Until Time    ${MINI_WAIT}
    Log    Verify Panel is added
    Wait Until Page Contains    ${updated_panel_name}    ${MEDIUM_WAIT}    ${updated_panel_name} is not visible after waiting ${MEDIUM_WAIT} seconds
    [Return]    ${updated_panel_name}

Remove Created Panel
    [Arguments]    ${updated_panel_name}
    Log    Click on select Panels
    Javascript Click    ${button.accesioning.pending.panels.select_panel}
    Wait Until Time    2
    Log    Remove panels on panels tab
    ${new.button.acessioning.remove_panel.close}    Update Dynamic Value    ${button.acessioning.remove_panel.close}    ${updated_panel_name}
    Click Element    ${new.button.acessioning.remove_panel.close}
    Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    Order Button    ${MEDIUM_WAIT}
    Wait Until Time    3
    Comment    ${panel_name}    Update Dynamic Value    ${button.acessioning.remove_panel.close}    ${updated_panel_name}
    Log    Verify Panel is removed
    Wait Until Element Is Not Visible    ${new.button.acessioning.remove_panel.close}    ${LONG_WAIT}    Added ${updated_panel_name} Panel name is not displayed after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot

Navigate To Panels Page
    [Arguments]    ${details_button}
    Wait Until Time    2
    Click On The Element    ${details_button}    details button    ${SHORT_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.accesioning.panels}    panels button    ${SHORT_WAIT}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${button.accesioning.pending.add_panel}    ${SHORT_WAIT}    add panel
    Run Keyword If    ${status}==False    Javascript Click    ${button.accesioning.panels}
    Wait For The Element to be Visible    ${button.accesioning.pending.add_panel}    Add panel button    ${MEDIUM_WAIT}

Verify User Able To Move Sample Id To On Hold
    Log    Verify User able to Move Sample id in On Hold Search
    Wait Until Time    3
    Javascript Click    ${button.accesioning.pending.search_result_details.hamburger_menu}
    Wait Until Time    3
    Javascript Click    ${button.accesioning.pending_search_result.hamburger_menu.on_hold}
    Click On The Element    ${button.homepage.accesioning.on_hold_menu}    On hold menu    ${LONG_WAIT}

Verify User is Able to Create Panel
    [Arguments]    ${testdata}    ${RID}
    Log    Search For Sample ID
    ${details_button}    Search For Created Sample Details In Accesioning Module    ${testdata}    1    ${RID}
    Log    Searched For Requisition with Sample ID.
    Log    Click on Details
    Log    Navigate to Panels Tab
    Wait Until Time    3
    Navigate To Panels Page    ${details_button}
    Log    Navigated to Panels Tab***
    Screenshot.Take Screenshot
    Log    Validate user able to Add New Panel
    ${updated_panel_name}=    Add New Panel and Verify Panel is Added    ${testdata}
    Screenshot.Take Screenshot
    [Return]    ${updated_panel_name}

Remove Sample Id from on Hold
    Comment    Remove sample id from On Hold section
    Wait Until Time    3
    Javascript Click    ${button.accesioning.pending.search_result_details.hamburger_menu}
    Wait Until Time    3
    Javascript Click    ${button.accesioning.pending_search_result.hamburger_menu.remove_hold}
    Wait Until Time    3
    Wait Until Element Is Visible    ${message.successfully}    ${LONG_WAIT}

Create New Sample and Verify Added in Samples Page
    [Arguments]    ${testdata}
    Input Text    ${textbox.accesioning.details.samples.add_sample.sample_name}    ${testdata}[sample_name]
    ${sample_name}    Set Variable    ${testdata}[sample_name]
    SeleniumLibrary.Wait Until Element Is Visible    ${dropdown.accesioning.details.samples.add_sample.sample_type}    ${LONG_WAIT}    Sample type dropdown is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${dropdown.accesioning.details.samples.add_sample.sample_type}    ${testdata}[sample_type]
    Press Keys    ${dropdown.accesioning.details.samples.add_sample.sample_type}    RETURN
    Javascript Click    ${button.accesioning.details.samples.add_sample.save_sample}
    Log    Created New Sample in Accessioning page***
    ${hamburger_button}    Update Dynamic Value    ${label.accesioning.pending.panels.panel_name}    ${sample_name}
    SeleniumLibrary.Wait Until Element Is Visible    ${hamburger_button}    ${LONG_WAIT}    Hamburger is not visible after waiting ${LONG_WAIT} seconds
    [Return]    ${sample_name}

Verify Delete Button by Clicking No in Delete Samples Page
    [Arguments]    ${poct_category}
    Wait Until Time    3
    Log    ${poct_category}
    ${menu_hamburger_button}    Update Dynamic Value    ${button.accesioning.details.menu_hamburger}    ${poct_category}
    Click On The Element    ${menu_hamburger_button}    Home Page Hamburger    ${SHORT_WAIT}    seleniumclick
    Wait Until Time    3
    ${delete_button}    Update Dynamic Value    ${button.accesioning.details.hamburger_menu.delete}    ${poct_category}
    SeleniumLibrary.Wait Until Element Is Visible    ${delete_button}    ${LONG_WAIT}    Delete button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${delete_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.samples.add_sample.delete.no}    ${LONG_WAIT}    Do not delete pop up button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.samples.add_sample.delete.no}
    ${disease_name}    Update Dynamic Value    ${label.accesioning.disease_name}    ${poct_category}
    SeleniumLibrary.Wait Until Element Is Visible    ${disease_name}    ${LONG_WAIT}    Disease name is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${menu_hamburger_button}
    Log    Verified POCT is not deleted by Clicking on"No" button on confirmation page***
    Screenshot.Take Screenshot
    [Return]    ${delete_button}

Verify Delete Button by Clicking Yes in Delete Samples Page
    [Arguments]    ${poct_category}    ${delete_button}
    Javascript Click    ${delete_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.samples.add_sample.delete.yes}    ${LONG_WAIT}    Do not delete pop up button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.samples.add_sample.delete.yes}
    ${poct_category_disease}    Update Dynamic Value    ${label.accesioning.pending.panels.panel_name}    ${poct_category}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${poct_category_disease}    ${LONG_WAIT}    Disease name is still visible after waiting ${LONG_WAIT} seconds
    Log    Verified POCT got deleted by Clicking on"Yes" button on confirmation page.
    Screenshot.Take Screenshot

Navigate to On-Hold Menu
    Log    Navigate to On - Hold Menu for Creating Samples
    Click On The Element    ${button.homepage.accesioning.on_hold_menu}    On-hold menu    ${LONG_WAIT}

Navigate to Missing_Data Menu
    Log    Navigate to Missing Data Menu for Creating Samples
    Click On The Element    ${button.accesioning.pending_search_result.hamburger_menu.missing_data}    On-hold menu    ${LONG_WAIT}

Click on First Element Details Button
    Click On The Element    ${button.accesioning.firstelementdetails}    First Requisition Details button    ${SHORT_WAIT}    selenium
    Wait For Spinner To Disappear    ${homepage.spinner}

Navigate to Add POCT Page
    Javascript Click    ${button.accesioning.details.poct}
    Wait Until Element Is Visible    ${button.accesioning.details.poct.add_poct}    ${SHORT_WAIT}    Add Poct element is not visible after waiitng ${SHORT_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.add_poct}

Select Positive as POCT Type And Verify is Updated
    ${disease}    Get Element Attribute    ${button.accesioning.details.poct.add_poct.select_infectious_disease_type}    title
    ${positive_checkbox_to_get_attribute}    Update Dynamic Value    ${checkbox.accesioning.poct.add_poct.select_positive_for_attribute}    ${disease}
    ${status}    Get Element Attribute    ${positive_checkbox_to_get_attribute}    class
    ${positive_checkbox_to_select}    Update Dynamic Value    ${checkboxbox.accesioning.details.poct.add_poct.positive_checkbox}    ${disease}
    Run Keyword If    '${status}'=='checkbox'    Javascript Click    ${positive_checkbox_to_select}
    sleep    3
    Javascript Click    ${button.accesioning.details.poct.add_poct.save}
    sleep    3
    SeleniumLibrary.Wait Until Element Is Visible    ${label.accesioning.details.poct.add_poct.positive_result}    ${LONG_WAIT}    Positive label is not visible after waiting ${LONG_WAIT} seconds
    Log    Selected Positive for COVID Rapid Antigen Test and clicked on Save***
    Javascript Click    ${label.accesioning.details.poct.add_poct.positive_result}
    Screenshot.Take Screenshot
    [Return]    ${disease}

Select Negative as POCT Type And Verify is Updated
    [Arguments]    ${test_data}
    Wait Until Element Is Visible    ${button.accesioning.details.poct.add_poct.edit}    ${LONG_WAIT}    Edit button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.add_poct.edit}
    Javascript Click    ${button.accesioning.details.poct.edit_poct.clear_poct_type_textbox}
    Input Text    ${textbox.accesioning.details.poct.edit_poct.type_poct_type}    ${test_data}[poct_negative_type]
    Press Keys    ${textbox.accesioning.details.poct.edit_poct.type_poct_type_dropdown_opened}    RETURN
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.poct.edit_poct.save}    ${LONG_WAIT}    Save button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.edit_poct.save}
    SeleniumLibrary.Wait Until Element Is Visible    ${label.accesioning.details.poct.add_poct.negative_result}    ${LONG_WAIT}    Negative label is not visible after waiting ${LONG_WAIT} seconds
    Log    Selected Negative for COVID Rapid Antigen Test and clicked on save***
    Screenshot.Take Screenshot

Verify Add and Delete POCT in Accesioning Module
    [Arguments]    ${test_data}
    Comment    Verify Add and Delete POCT in Accesioning Module
    Comment    Navigate To Details of First Displayed Element
    Click on First Element Details Button
    Comment    Navigate To Add POCT page
    Navigate to Add POCT Page
    Log    Navigated to Details tab and clicked on Add POCT Tab***
    Screenshot.Take Screenshot
    Comment    Select positive as POCT Status and Verify
    ${disease}=    Select Positive as POCT Type And Verify is Updated
    Log    Verified COVID Rapid Antigen POCT is added and POCT result is "Positive"
    Comment    Select Negative as POCT Status and Verify
    Select Negative as POCT Type And Verify is Updated    ${test_data}
    Log    Verified COVID Rapid Antigen POCT is added and POCT result is "Negative"
    Comment    Select Not Performed as POCT Status and Verify
    Select Not Performed as POCT Type And Verify is Updated    ${test_data}
    Comment    Verify POCT is not deleted when not deleted using no option
    ${delete_button}=    Verify Delete Button by Clicking No in Delete Samples Page    ${disease}
    Comment    Verify POCT is not deleted when deleted using yes option
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${disease}    ${delete_button}

Verify Add and Delete POCT in On-Hold Menu
    [Arguments]    ${testdata}
    Comment    Navigate to ON-Hold Menu
    Navigate to On-Hold Menu
    Comment    Navigate To Details of First Displayed Element
    Click on First Element Details Button
    Comment    Navigate To Add POCT page
    Navigate to Add POCT Page
    Comment    Select positive as POCT Status and Verify
    ${disease1}=    Select Positive as POCT Type And Verify is Updated
    Comment    Verify POCT is not deleted when not deleted using no option
    Select Negative as POCT Type And Verify is Updated    ${testdata}
    Comment    Select Not Performed as POCT Status and Verify
    Select Not Performed as POCT Type And Verify is Updated    ${testdata}
    Comment    Verify POCT is not deleted when not deleted using no option
    Verify Delete Button by Clicking No in Delete Samples Page    ${disease1}
    Comment    Verify POCT is deleted when deleted using yes option
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${disease1}

Verify Add and Delete POCT in Missing Data Menu
    [Arguments]    ${testdata}
    Comment    Navigate to Missing Data Menu
    Navigate to Missing_Data Menu
    Comment    Navigate To Details of First Displayed Element
    Click on First Element Details Button
    Comment    Navigate To Add POCT page
    Navigate to Add POCT Page
    Comment    Select positive as POCT Status and Verify
    ${disease2}=    Select Positive as POCT Type And Verify is Updated
    Comment    Verify POCT is not deleted when not deleted using no option
    Select Negative as POCT Type And Verify is Updated    ${testdata}
    Comment    Select Not Performed as POCT Status and Verify
    Select Not Performed as POCT Type And Verify is Updated    ${testdata}
    Comment    Verify POCT is not deleted when not deleted using no option
    Verify Delete Button by Clicking No in Delete Samples Page    ${disease2}
    Comment    Verify POCT is deleted when deleted using yes option
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${disease2}

Select Not Performed as POCT Type And Verify is Updated
    [Arguments]    ${test_data}
    Wait Until Element Is Visible    ${button.accesioning.details.poct.add_poct.edit}    ${LONG_WAIT}    Edit button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.add_poct.edit}
    Javascript Click    ${button.accesioning.details.poct.edit_poct.clear_poct_type_textbox}
    Input Text    ${textbox.accesioning.details.poct.edit_poct.type_poct_type}    ${test_data}[poct_not_performed_type]
    Press Keys    ${textbox.accesioning.details.poct.edit_poct.type_poct_type_dropdown_opened}    RETURN
    Javascript Click    ${button.accesioning.details.poct.edit_poct.save}
    Wait Until Element Is Visible    ${messages.accesioning.details.poct.add_poct.select_not_performed_result}    ${LONG_WAIT}    Error message is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.add_poct.select_infectious_disease_type.close}
    Log    Test Step 9 : Selected Not Performed for COVID Rapid Antigen Test and clicked on save

Verify Add and Delete Sample in Accesioning Module
    [Arguments]    ${testdata}
    Comment    Create and Verify New Samples in Pending Menu
    Comment    Navigate to Add Samples Page
    Click on Details and Go to Add Sample Page
    Log    Test Step 4 : Clicked on Details Tab and Navigated to Add Sample page***
    Screenshot.Take Screenshot
    Comment    Create New Sample and Verify is Added in Samples Page
    ${sample_name}=    Create New Sample and Verify Added in Samples Page    ${testdata}
    Log    Verified Newly Added Samples in Accessioning page***
    Screenshot.Take Screenshot
    Comment    Verify delete functionality by clicking no in Delete Options
    ${delete_button}    Verify Delete Button by Clicking No in Delete Samples Page    ${sample_name}
    Comment    Verify delete functionality by clicking yes in Delete Options
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${sample_name}    ${delete_button}

Verify Add and Delete Sample in On Hold Menu

Verify Add and Delete POCT in Missing Tab Menu

Verify Selected Requisition Details In Billing-Batch Review
    [Arguments]    ${home_page_requisition-id}    ${requisition_id_count}
    Log    Verifies whether the selected requisition details are displaying
    FOR    ${key}    IN RANGE    ${requisition_id_count}
        Wait Until Time    1
        ${updated_key}    Evaluate    ${key}+1
        ${class_value}    Get Element Attribute    ${button.accessioning.billing-batch-review.billing-review}    class
        ${disable_status}    Run Keyword And Return Status    Should Contain    ${class_value}    disable
        Run Keyword If    '${disable_status}'=='False'    Click on Billing Review For Selected Requisition    ${home_page_requisition-id}    ${key}
        Run Keyword If    '${disable_status}'=='False'    Wait For The Element to be Visible    ${messages.accesioning.billing_batch_review_page.billing_reviewed_message}    message    ${MEDIUM_WAIT}
        Wait Until Time    3
        Switch to Default Window and Verify
        Run Keyword If    ${key}==0    Click Arrow Down Button    ${button.accesioning.details.arrow}    new-grid-column sort-arrow-down
        Reload Page
        Wait Until Time    3
        ${new.button.accessioning.billing-batch-review.green_tick_dyna,mic_QA-complete-form}    Update Dynamic Value    ${button.accessioning.billing-batch-review.green_tick_dyna,mic_QA-complete-form}    ${home_page_requisition_id}[${key}]
        Wait For The Element to be Visible    ${new.button.accessioning.billing-batch-review.green_tick_dyna,mic_QA-complete-form}    Billing_QA_Complete    ${MEDIUM_WAIT}
        Screenshot.Take Screenshot
        Switch New Window And Verify
        Wait For The Element to be Visible    ${button.accessioning.billing-review.requistion#-id}    billing_review    ${SHORT_WAIT}
        Screenshot.Take Screenshot
        Log    ${home_page_requisition-id}
        ${billing_page_requisition-id}    Get text    ${button.accessioning.billing-review.requistion#-id}
        Log    ${billing_page_requisition-id}
        ${equality_status}    BuiltIn.Run Keyword And Return Status    Should Contain    ${billing_page_requisition-id}    ${home_page_requisition_id}[${key}]
        BuiltIn.Run Keyword If    '${equality_status}'=='True'    Wait For The Element to be Visible    ${button.accessioning.billing-batch-review.reviewed-forward}    Reviewed Forward button    ${MEDIUM_WAIT}
        Javascript Click    ${button.accessioning.billing-batch-review.reviewed-forward}
        Wait For Spinner To Disappear    ${spinner.locator}
        Screenshot.Take Screenshot
    END

Verify Selected Requisition Details In Batch-Review
    [Arguments]    ${home.page_requisition-id}    ${requisition_id_count}
    FOR    ${key}    IN RANGE    ${requisition_id_count}
        ${updated_key}    Evaluate    ${key}+1
        Wait Until Time    1
        Log    ${home.page_requisition-id}
        ${batch_review_page_requisition-id}    Get text    ${button.accessioning.batch-review.Req#-id}
        Log    ${batch_review_page_requisition-id}
        ${equality_status}    Run Keyword And Return Status    Should Contain    ${home.page_requisition-id}[${key}]    ${batch_review_page_requisition-id}
        Run Keyword If    ${equality_status}==True    Javascript Click    ${button.accessioning.batch-review.reviewed-forward}
        Wait For Spinner To Disappear    ${spinner.locator}
        Screenshot.Take Screenshot
    END
    Log    Goto Accessinoing refresh the page and Verify that selected requisition record is in Green color tick mark.

Select Multiple Requisitions in Accessioning in Pending
    [Arguments]    ${Count_Value}
    Log    Select Multiple Requisitions Using Sample Id
    @{home_page_requisition_id}    Create List
    @{updated_sample_id}    Create List
    FOR    ${key}    IN RANGE    0    ${Count_Value}
        ${key}    Evaluate    ${key}+1
        ${updated_key}    Convert To String    ${key}
        ${new.label.accesioning.details.sample_id}    Update Dynamic Value    ${label.accesioning.pending_requisitions_without_erros.sample_id}    ${updated_key}
        Wait For The Element to be Visible    ${new.label.accesioning.details.sample_id}    Sample Id Label For Attribute    ${SHORT_WAIT}
        ${sample_id_attribute}    Get Element Attribute    ${new.label.accesioning.details.sample_id}    title
        Log    Sample_Id- is Received
        @{Sample_Id}    Split String    ${sample_id_attribute}    ,
        ${new.label.accesioning.details.req_id_for_attribute}    Update Dynamic Value    ${label.accesioning.pending_requisitions_without_erros.rid}    ${updated_key}
        ${RID}    Get Element Attribute    ${new.label.accesioning.details.req_id_for_attribute}    title
        Log    "${RID}" is Received
        ${RID_count}    Get length    ${RID}
        Run Keyword If    ${RID_count}==6    Append To List    ${home_page_requisition_id}    ${RID}
        Log    ${home_page_requisition_id}
        @{Requisition_Id}    Split String    ${RID}    ,
        ${new.checkbox.accesioning.requisition_checkboxes}    Update Dynamic Value    ${checkbox.accesioning.select_requisitions}    ${Requisition_Id}[0]
        Click On The Element    ${new.checkbox.accesioning.requisition_checkboxes}    Requisition checkbox    ${SHORT_WAIT}    seleniumclick
        Append To List    ${updated_sample_id}    ${Sample_Id}[0]
        Log    ${updated_sample_id}
        Take Screenshot
    END
    ${requisition_id_count}    Get Length    ${home_page_requisition_id}
    Set Test Variable    ${home_page_requisition_id}    ${home_page_requisition_id}
    Set Test Variable    ${requisition_id_count}    ${requisition_id_count}
    Set Test Variable    ${updated_sample_id}    ${updated_sample_id}
    [Teardown]

Click on Billing Review For Selected Requisition
    [Arguments]    ${home.page_req-id}    ${key}
    ${billing_review_button}    Update Dynamic Value    ${button.accesioning.billing_review_page.billing_review}    ${home.page_req-id}[${key}]
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${billing_review_button}    ${MEDIUM_WAIT}    Billing review button is not visible after waiting ${MEDIUM_WAIT} seconds
    Run Keyword If    ${status}==True    Wait Until Element Clickable    ${billing_review_button}    ${MEDIUM_WAIT}
    Run Keyword If    ${status}==True    Click Element    ${billing_review_button}
    Run Keyword If    ${status}==False    Javascript Click    ${button.accessioning.billing-batch-review.reviewed-forward}
    Wait Until Element Is Visible    ${billing_review_button}    ${MEDIUM_WAIT}    Billing review button is not visible after waiting ${MEDIUM_WAIT}seconds
    Run Keyword If    ${status}==False    Javascript Click    ${billing_review_button}

Change Bill Type
    [Arguments]    ${testdata}    ${R-id}    ${negative_validation}=Positive    ${save_button}=None
    Log    Change Bill Type to Insurance Attached Optiion
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Insurance
    ${bill_type_list}    Split String    ${testdata}[Bill_Type]    ,
    ${count}    Get Length    ${bill_type_list}
    FOR    ${Key}    IN RANGE    ${count}
        ${new.button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}    ${bill_type_list}[${Key}]
        ${attribute_status}    Get Element Attribute    ${new.button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}    class
        ${status}    Run Keyword And Return Status    Should Contain    ${attribute_status}    selected
        Run Keyword If    ${status}==False    Javascript Click    ${new.button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}
        ${bill_type_option}    Set Variable    ${bill_type_list}[${Key}]
        Set Test Variable    ${new.button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}
        Exit For Loop If    ${status}==False
    END
    Set Test Variable    ${bill_type_option}
    Wait Until Time    2
    ${new.button.accesioning.first_element_details.Insurance.update_insurance.save}    Run Keyword If    '${save_button}'=='None'    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.update_insurance.save}    Save
    ...    ELSE    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.update_insurance.save}    Save and Update the Patient
    Click On The Element    ${new.button.accesioning.first_element_details.Insurance.update_insurance.save}    Save    ${SHORT_WAIT}
    Run Keyword If    '${negative_validation}'=='Positive'    Wait For The Element to be Visible    ${message.accesioning.first_element_details.insurance.update_insurance.saved}    saved message    ${SHORT_WAIT}
    ...    ELSE    Wait Until Page Contains Element    ${message.error_message.mandatory_field}    ${SHORT_WAIT}    Error Message
    Screenshot.Take Screenshot

Navigate to General and Verify Bill Type is Updated
    [Arguments]    ${bill_type_option}
    log    Navigate To General Tab and Check Updated Bill Type
    Javascript Click    ${button.accesioning.first_element_details.General}
    Wait Until Time    3
    ${new.button.requisition.details.general.bill_type}    Update Dynamic Value    ${button.requisition.details.general.bill_type}    ${bill_type_option}
    ${string}    Get Element Attribute    ${new.button.requisition.details.general.bill_type}    class
    Should Contain    ${string}    selected

Create New Requisition To Validate Patient Bill Type
    [Arguments]    ${testdata}    ${bill_type_option}=None    ${bill_type_validation}=None
    Log    Select ${test_data}[clientsitetotype] as client
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Log    Verify user is able to select order physician
    Select Order Physician    ${testdata}
    Log    Selected ${test_data}[orderphysician_name] as order physician
    Log    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Log    Verify Patient Bill Type
    Validate Patient Bill Type in Create New Requisition Page    ${testdata}    ${bill_type_option}    ${bill_type_validation}

Go to View Order Physician Signature Page and Verify
    ${sample_id}    Get Element Attribute    ${checkbox.accesioning.first_sample_id}    title
    ${menu_hamburger_button}    Update Dynamic Value    ${button.accesioning.details.menu_hamburger}    ${sample_id}
    Navigate to Requisition Hamburger Sub Menu Options    ${testdata}[Hamburger_submenu_option]    ${menu_hamburger_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${label.accesioning.view_order_signature.view_signature}    ${MEDIUM_WAIT}    View signature label is not displayed after waiting for ${MEDIUM_WAIT} seconds
    SeleniumLibrary.Wait Until Element Is Visible    ${label.accesioning.view_ordering_physician.image}    ${MEDIUM_WAIT}    Image is not displayed after waiting for ${MEDIUM_WAIT} seconds

Navigate to All Category Menu
    Javascript Click    ${button.accesioning.all_menu}
    Screenshot.Take Screenshot
    Wait Until Page Contains    Display requisitions for the last    ${LONG_WAIT}    All Page is Not Visible After Waiting ${LONG_WAIT} seconds
    Log    Navigated to All category Menu

Verify Order Physician Signature Label
    Comment    View order physician label and verify image is displayed
    Wait For The Element to be Visible    ${label.accesioning.view_order_signature.view_signature}    View signature label    ${MEDIUM_WAIT}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${label.accesioning.view_ordering_physician.image}    ${LONG_WAIT}    Image is not displayed after waiting for ${MEDIUM_WAIT} seconds
    Run Keyword If    '${status}'=='False'    Wait Until Page Contains    Requisition hasn't been signed by ordering_physician    ${MEDIUM_WAIT}
    Log    Physician Signature modal is displayed and Verified Ordering Physician Signature
    Screenshot.Take Screenshot

Verify Tool Bar Grid Names
    [Arguments]    ${testdata}
    Comment    Veirfy tool bar grid names with icon names displayed when mouse hovered
    ${Tool_Bar_Element_Names}    Split String    ${testdata}[Tool_bar_text]    ,
    ${Count}    Get Length    ${Tool_Bar_Element_Names}
    FOR    ${key}    IN RANGE    ${Count}
        ${Tool_Bar_Element_Name}    Split String    ${Tool_Bar_Element_Names}[${key}]    ${SPACE}
        ${new.button.accesioning.tool_bar_grid_elements}    Update Dynamic Value    ${button.accesioning.tool_bar_grid_elements}    ${Tool_Bar_Element_Name}[0]
        ${Tool_Bar_Text}    Get Element Attribute    ${new.button.accesioning.tool_bar_grid_elements}    title
        Should Be Equal    ${Tool_Bar_Text}    ${Tool_Bar_Element_Names}[${key}]
    END

Select label Template and Click On Print
    [Arguments]    ${testdata}
    Click On The Element    ${textbox.accesioning.tool_bar_grid.print_labels.label_template}    Label Template    ${MEDIUM_WAIT}    seleniumclick
    ${new.dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    Update Dynamic Value    ${dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    ${test_data}[Select_label_Template]
    Click On The Element    ${new.dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    Label Template    ${MEDIUM_WAIT}
    Run Keyword If    '${testdata}[Set_all]'=='True'    Enter Label Number and Click on Set All    ${testdata}
    Click On The Element    ${dropdown.accesioning.tool_bar_grid.print_labels.label_template.print}    Print    ${MEDIUM_WAIT}    selenium

Upload File And Verify In Attachments
    [Arguments]    ${testdata}
    Comment    Upload Xlsx file in attachments and Verify
    Log    Click on Upload button
    Wait Until Time    3
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Details_inner_menu_buttons]
    Javascript Click    ${new.label.accesioning.details.submenu}
    Wait For The Element to be Visible    ${button.accesioning.attachments.choose_file}    upload file    ${MEDIUM_WAIT}
    Log    Choose file and select file type
    Wait Until Time    2
    Choose File    ${button.accesioning.attachments.choose_file}    ${TESTDATA_FOLDER}\\${test_data_file_name}
    Wait Until Time    2
    Select File type in Attachments    ${testdata}
    Run Keyword If    '${testdata}[Negative_validation]'=='Negative_validation'    Return From Keyword
    ${details_menu_hamburger}    Update Dynamic Value    ${button.accesioning.details.menu_hamburger}    ${test_data_file_name}
    Wait For The Element to be Visible    ${details_menu_hamburger}    Hamburger menu    ${MEDIUM_WAIT}
    Scroll Element Into View    ${details_menu_hamburger}
    Page Should Contain    ${test_data_file_name}
    Screenshot.Take Screenshot
    [Return]    ${details_menu_hamburger}    ${test_data_file_name}

Verify Delete Attachment Functionality
    [Arguments]    ${file_name}
    ${new.button.accesioning.details.menu_hamburger}    Update Dynamic Value    ${button.accesioning.details.menu_hamburger}    ${file_name}
    Click On The Element    ${new.button.accesioning.details.menu_hamburger}    details_hamburger    ${MEDIUM_WAIT}    selenium
    ${new.button.accesioning.details.hamburger_menu.delete}    Update Dynamic Value    ${button.accesioning.details.hamburger_menu.delete}    ${file_name}
    Click On The Element    ${new.button.accesioning.details.hamburger_menu.delete}    Hamburger_Delete    ${MEDIUM_WAIT}    selenium
    Click On The Element    ${button.accesioning.details.samples.add_sample.delete.no}    No    ${MEDIUM_WAIT}    selenium
    Wait until Time    2
    Page Should Contain    ${file_name}
    Log    Click on "Yes" button on confirmation page and verify Attachment is Deleted
    Click On The Element    ${new.button.accesioning.details.menu_hamburger}    details_hamburger    ${MEDIUM_WAIT}    selenium
    Click On The Element    ${new.button.accesioning.details.hamburger_menu.delete}    Hamburger_Delete    ${MEDIUM_WAIT}    selenium
    Click On The Element    ${button.accesioning.details.samples.add_sample.delete.yes}    No    ${MEDIUM_WAIT}    selenium
    ${new.label.accesioning.attachments.file_name}    Update Dynamic Value    ${label.accesioning.attachments.file_name}    ${file_name}
    Wait until Time    2
    Page Should Not Contain    ${new.label.accesioning.attachments.file_name}

Select File type in Attachments
    [Arguments]    ${testdata}    ${input}=normal
    Wait For The Element to be Visible    ${label.accesioning.page_title}    page title label    ${SHORT_WAIT}
    ${page_title}    Get Text    ${label.accesioning.page_title}
    Wait Until Time    3
    Run Keyword If    '${input}'=='normal'    Javascript Click    ${button.accesioning.attachments.save}
    ${new.messages.accesioning.common}    Update Dynamic Value    ${messages.accesioning.common}    ${testdata}[Error_Messages]
    Run Keyword If    '${input}'=='normal'    Verify Message    ${new.messages.accesioning.common}    ${MEDIUM_WAIT}
    Run Keyword If    '${testdata}[Negative_validation]'=='Negative_validation'    Return From Keyword
    Click On The Element    ${textbox.accesioning.attachments.filetype}    File Type    ${MEDIUM_WAIT}
    ${file_type_locator}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[File_Type]
    Log    Click on Save button
    Log    Verify on attachments tab the document is displayed
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${file_type_locator}    ${SHORT_WAIT}    ${testdata}[File_Type] file type
    Run Keyword If    ${status}==True    Javascript Click    ${file_type_locator}
    ...    ELSE    Javascript Click    ${button.accesioning.attachments.file_type.clear}
    Run Keyword If    ${status}==False    Javascript Click    ${textbox.accesioning.attachments.filetype}
    Run Keyword If    ${status}==False    Javascript Click    ${file_type_locator}
    Wait Until Time    3
    Run Keyword If    '${page_title}'=='Upload'    click element    ${button.accesioning.attachments.save}
    ...    ELSE    Javascript Click    ${button.accesioning.attachments.edit_requisition_image_file_type}

Verify Error Message when No Panel Is Selected
    [Arguments]    ${testdata}
    Wait For The Element to be Visible    ${button.accesioning.pending.add_panel}    Add panel button    ${MEDIUM_WAIT}
    Wait Until Time    2
    Javascript Click    ${button.accesioning.pending.add_panel}
    Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    Order button    ${MEDIUM_WAIT}
    Comment    Click Order and Verify Negative Message without Selecting Panel
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Error_Messages]
    Verify Message    ${new.label.accesioning.details.submenu}    ${MEDIUM_WAIT}

Edit Attachment
    [Arguments]    ${testdata}    ${test_data_file_name}
    Log    Edit file type
    Log    Click on Save button
    ${new.button.accesioning.details.attachments.edit}    Update Dynamic Value    ${button.accesioning.details.attachments.edit}    ${test_data_file_name}
    Wait Until Time    2
    Click On The Element    ${new.button.accesioning.details.attachments.edit}    edit    ${SHORT_WAIT}
    Select File type in Attachments    ${testdata}    edit
    Log    Verify file type is updated
    Page Should Contain    ${testdata}[File_Type]

Verify Admin able to View Attachment and Remove
    [Arguments]    ${file_type}
    ${new.button.accesioning.details.attachments.view}    Update Dynamic Value    ${button.accesioning.details.attachments.view}    ${Test_Data_File_Name}
    Comment    Click on View Attachment and Download to verify its viewable
    Wait Until Time    3
    Javascript Click    ${new.button.accesioning.details.attachments.view}
    Log    We are Inserted Static Wait for 5 seconds to download file into local
    Wait Until Time    5
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${file_data}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${file_path}[0]    AC072    Accesioning
    ${file_data}    Set Variable    ${file_data}
    ${file_data}    Convert To String    ${file_data}
    Should Contain    ${file_data}    ${file_type}

Select Predefined Comments in Reject Comments Page
    [Arguments]    ${testdata}
    ${new.hamburger_option_page}    Update Dynamic Value    ${label.accesioning.hamburger_option__page_title}    ${testdata}[Hamburger_submenu_option]
    Wait For The Element to be Visible    ${new.hamburger_option_page}    ${testdata}[Hamburger_submenu_option]    ${MEDIUM_WAIT}
    Click On The Element    ${textbox.accesioning.sample_commentpredefinedcomment}    Select predefined Comments    ${MEDIUM_WAIT}    sele
    ${new.button.accesioning.select_predefined_comment}    Update Dynamic Value    ${button.accesioning.select_predefined_comment}    ${testdata}[Predefined_comment]
    Click On The Element    ${new.button.accesioning.select_predefined_comment}    ${testdata}[Predefined_comment] option    ${MEDIUM_WAIT}

Verify New Panel is Added
    Comment    Validate user able to Add New Panel
    ${updated_panel_name}=    Add New Panel
    Screenshot.Take Screenshot
    Log    Succesfully Attached New Panel***
    Wait Until Page Contains Element    ${page_view.panels}
    Screenshot.Take Screenshot
    Comment    Verify panel is Added
    ${status}    Run Keyword And Return Status    Page Should Contain    ${updated_panel_name}
    Run Keyword If    ${status}==False    Fail

Navigate to Select_Panels in Panels Page
    Click On The Element    ${button.panels.select_panel}    Select Panel    ${MEDIUM_WAIT}

Select New Panel in Req_List
    [Arguments]    ${testdata}
    comment    Select panel from list by passing Text
    Wait Until Element Is Visible    ${textbox.panels.select_panel.panels_dropdown}    ${MEDIUM_WAIT}
    Wait Until Time    2
    Input Text    ${textbox.panels.select_panel.panels_dropdown}    ${testdata}[Panel_dropdown_type]
    Wait Until Time    2
    Press Keys    None    RETURN
    Screenshot.Take Screenshot
    ${new.dropdown.accessioning.req_list.panels.select_panels.panels}    Update Dynamic Value    ${dropdown.accessioning.req_list.panels.select_panels.panels}    ${testdata}[Panel_dropdown_type]
    ${updated_panel_name}    Get Text    ${new.dropdown.accessioning.req_list.panels.select_panels.panels}
    Log    ${updated_panel_name}
    Log    Test Step :Selects the Panel name from list appeared
    comment    click on order
    Javascript Click    ${button.accesioning.pending.add_new_panel.select_panel.order}
    Screenshot.Take Screenshot
    [Return]    ${updated_panel_name}

Verify Selected Panel is Added to Panels Tab
    [Arguments]    ${test-data}
    ${updated_panel_name}    Select New Panel in Req_List    ${test-data}
    Log    Test Step 9:Navigated to Select Panels page to Add panels
    comment    Verify Selected Panel is Added
    Wait Until Time    2
    Comment    Wait Until Page Contains Element    ${page_view.panels}    ${LONG_WAIT}
    Page Should Contain    ${updated_panel_name}
    Screenshot.Take Screenshot
    [Teardown]
    [Return]    ${updated_panel_name}

Perform Actions in Complete Page From Tool Bar Grid Buttons
    [Arguments]    ${testdata}    ${page_title}    ${Button}=None
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.select_present_time}    Present Time button    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.accesioning.requisition_completeall.tracking_number}    tracking number    ${MEDIUM_WAIT}    ${testdata}[track-id]
    Click On The Element    ${textbox.accesioning.requisition_completeall.start_processing}    Start processing    ${SHORT_WAIT}    seleniumclick
    Screenshot.Take Screenshot
    Wait For The Element to be Visible    ${label.accesioning.requisition_completeall.complete_100%_process}    100% process    ${LONG_WAIT}
    Run Keyword If    ${Button}=="Close Modal and Refresh Grid"    Javascript Click    ${textbox.accesioning.requisition_completeall.closemodal}

Navigate to Hamburger Options in Details_Errors Page
    [Arguments]    ${Sub_Menu-Name}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.req-details.errors.hamburger}    ${MEDIUM_WAIT}
    Scroll And Click    ${button.accesioning.req-details.errors.hamburger}    Hamburger_menu_in_Errors_Page    ${MEDIUM_WAIT}
    Log    "Hamburger_menu_in_Errors_Page" is Clicked
    Screenshot.Take Screenshot
    ${new.button.accesioning.req-details.errors.hamburger.sub-menu}    Run Keyword If    "${Sub_Menu-Name}"=="Delete"    Update Dynamic Value    ${button.accesioning.req-details.errors.hamburger.sub-menu(delete)}    ${Sub_Menu-Name}
    ...    ELSE    Update Dynamic Value    ${button.accesioning.req-details.errors.hamburger.sub-menu_options}    ${Sub_Menu-Name}
    Wait Until Time    ${SHORT_WAIT}
    Click On The Element    ${new.button.accesioning.req-details.errors.hamburger.sub-menu}    ${MEDIUM_WAIT}    ${Sub_Menu-Name}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Log    "${Sub_Menu-Name}" is Clicked

Add Requisition Error from Requisition Hamburger
    [Arguments]    ${testdata}
    [Documentation]    This keyword is used to Add Requisition Error by Getting Attribute from the First Error Name and by Replacing that Attribute Value into Locator ,Particular Error Checkbox is Selected
    Wait Until Time    3
    ${Requisition_Error_Name}    Get Element Attribute    ${get-attribute.accesioning.req-hamburger.add-req-error.first-error-name}    title
    Log    "${Requisition_Error_Name}" is Received
    ${new.checkbox.accesioning.created_requisition_error_checkbox}    Update Dynamic Value    ${checkbox.accesioning.created_requisition_error_checkbox}    ${Requisition_Error_Name}
    ${checkbox_class-attribute}    Get Element Attribute    ${new.checkbox.accesioning.created_requisition_error_checkbox}    class
    ${new.checkbox.accesioning.details.hamburger.requisition_error.create_error_checkbox}    Update Dynamic Value    ${checkbox.accesioning.details.hamburger.requisition_error.create_error_checkbox}    ${Requisition_Error_Name}
    Run Keyword If    "${checkbox_class-attribute}"=="checkbox"    Click On The Element    ${new.checkbox.accesioning.details.hamburger.requisition_error.create_error_checkbox}    requisition checkbox with error name    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Perform Actions    Save    ${MEDIUM_WAIT}
    [Return]    ${Requisition_Error_Name}

Verify Error Added in Details Errors Page
    [Arguments]    ${Requisition_Error_Name}
    ${new.verify.accesioning.req-details.errors.added-error}    Update Dynamic Value    ${verify.accesioning.req-details.errors.added-error}    ${Requisition_Error_Name}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${new.verify.accesioning.req-details.errors.added-error}    ${MEDIUM_WAIT}
    Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.errors.next_page}
    Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
    Run Keyword If    '${status}'=='False'    Wait Until Page Contains Element    ${new.verify.accesioning.req-details.errors.added-error}    ${MEDIUM_WAIT}
    Log    "${Requisition_Error_Name}" is Displayed
    Screenshot.Take Screenshot

Add Comments in Hamburger Comments Page
    [Arguments]    ${sample_Id}    ${Testdata}
    Navigate to Requisition Hamburger Sub Menu Options    ${sample_Id}    Comments
    Log    Navigated to "Hamburger_Comments" Page
    Wait Until Element Is Not Visible    ${spinner.locator}    ${MEDIUM_WAIT}
    Select Frame And Input Req Comments    ${Testdata}[comment]    ${button.homepage.hamburger_comments}
    Perform Actions    Add    ${MEDIUM_WAIT}
    Log    "Add" is Clicked
    Javascript Click    ${button.cross(x)}

Click Arrow Down Button
    [Arguments]    ${arrow_locator}    ${arrow_button_attribute}
    FOR    ${key}    IN RANGE    4
        ${application_arrow_button_attribute}    Get Element Attribute    ${button.accesioning.sample_details_arrow}    class
        ${down_arrow_status}    Run Keyword And Return Status    Should Be Equal    ${application_arrow_button_attribute}    ${arrow_button_attribute}
        Log    "${down_arrow_status}" is Received
        Run Keyword If    '${down_arrow_status}'=='False'    Javascript Click    ${button.accesioning.sample_details_arrow}
        Log    "${button.accesioning.sample_details_arrow}" is Clicked
        Screenshot.Take Screenshot
        Wait Until Time    3
        Exit For Loop If    '${down_arrow_status}'=='True'
    END

Get First Requisition Sample Id
    Wait Until Time    ${SHORT_WAIT}
    wait_until_element_is_present    ${label.accessioning.get_sample-id_first_requisition}
    ${sample_id}    Get Element Attribute    ${label.accessioning.get_sample-id_first_requisition}    title
    Log    "${sample_id}" is Received
    Set Test Variable    ${sample_id}
    [Return]    ${sample_id}

Search for Multiple Sample-id in Search-Bar & Verify
    [Arguments]    ${testdata}    ${count_value}    ${sample_id}    ${message}=None
    FOR    ${key}    IN RANGE    ${count_value}
        Search For Details In Home Page    ${sample_id}[${key}]    ${testdata}[pending_searchcategory_checkbox]
        Run Keyword If    "${message}"!="None"    Wait For The Element to be Visible    ${label.homepage.no_records_found}    no records found label    ${MEDIUM_WAIT}
        Screenshot.Take Screenshot
    END

Verify user is able to Reject Selected Requisition
    [Arguments]    ${ID_Value}    ${Testdata}
    Navigate to Requisition Hamburger Sub Menu Options    ${ID_Value}    Reject
    Log    Navigate to Reject Comments Page
    Select Predefined Comments in Reject Comments Page    ${Testdata}
    Log    Select Predefined Cmments
    Enter Requirement Comments    ${testdata}[Predefined_comment]
    Wait Until Time    3
    Perform Actions    Save    ${MEDIUM_WAIT}
    Verify Text Message    Requisition Rejected    ${MEDIUM_WAIT}

Enter Comments in Requisition Hamburger For "Back to Pending"
    [Arguments]    ${testdata}
    Click On The Element    ${textfield.accesioning.req_hamburger.back_to_pending.comments_field}    reason rejection    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textfield.accesioning.req_hamburger.back_to_pending.comments_field}    comments    ${MEDIUM_WAIT}    ${testdata}[comment]
    Perform Actions    Send back for Testing    ${MEDIUM_WAIT}
    Log    "${testdata}[comment]" is Entered and Clicked on "Send back for Testing"

Click On All Menu in Accesioning
    Javascript Click    ${button.accesioning.all_menu}

Navigate To Attachments Page in Accesioning
    [Arguments]    ${testdata}
    ${new.button.accesioning.details.sub-menu}    Update Dynamic Value    ${button.accesioning.details.sub-menu}    ${testdata}[Details_Menu_buttons]
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Details_Menu_buttons]
    Set Focus To Element    ${new.button.accesioning.details.sub-menu}
    Wait Until Time    2
    Click Element and Verify    ${new.button.accesioning.details.sub-menu}    ${new.label.accesioning.details.submenu}    ${testdata}[Details_Menu_buttons]    ${MEDIUM_WAIT}

Get First Requisition RID
    Wait For The Element to be Visible    ${label.accesioning.get_first_rid}    first requisition    ${SHORT_WAIT}
    ${RID}    Get Element Attribute    ${label.accesioning.get_first_rid}    data-id
    Log    "${RID}" is Received
    [Return]    ${RID}

Create New Patient With Insurance Type
    [Arguments]    ${testdata}
    ${create_new_patient_locator}    Update Dynamic Value    ${button.client_portal.create_new_requisition.create_new}    patient
    Click On The Element    ${create_new_patient_locator}    Create_New_Patient    ${SHORT_WAIT}    seleniumclick
    Click On The Element    ${textbox.new_requisition.create_new_patient.patient_bill_category}    Bill category button    ${SHORT_WAIT}
    ${new.dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    ${testdata}[patient_bill]
    Click On The Element    ${new.dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    Patient bill options    ${SHORT_WAIT}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.first_name}    ${LONG_WAIT}    Patient first name textbox is not visible after waiting ${LONG_WAIT} seconds
    ${patient_name}    Set Variable    ${testdata}[patient_first_name]    ${testdata}[patient_last_name]
    Set Global Variable    ${patient_name}
    Input Text    ${textbox.new_requisition.create_new_patient.first_name}    ${patient_name}[0]
    Input Text    ${textbox.new_requisition.create_new_patient.last_name}    ${patient_name}[1]
    ${date}    Get 2 Days Previous Date
    Input Text    ${textbox.new_requisition.create_new_patient.DOB}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Javascript Click    ${textbox.new_requisition.create_new_patient.select_gender}
    ${select_gender_option}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[gender]
    Set Global Variable    ${select_gender_option}
    Click On The Element    ${select_gender_option}    select_gender    ${LONG_WAIT}
    Input Text    ${textbox.create_new_patient.address}    ${testdata}[patient_address]
    Input Text    ${textbox.create_new_patient.mobile_number}    ${testdata}[phone_number]
    Click On The Element    ${button.new_requisition.create_new_patient.save}    SAVE    ${LONG_WAIT}
    Screenshot.Take Screenshot
    Wait Until Page Contains    Patient saved    ${LONG_WAIT}    Success message is not displayed after waiting ${LONG_WAIT} seconds

Validate Documentation in Medical Neccesity
    [Arguments]    ${test_data}
    Input Text    ${textbox.accesioning.medical_necessity.available_search}    ${test_data}[Medical_Necessity_Documentation]
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${test_data}[Medical_Necessity_Documentation]
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    available documentation    ${MEDIUM_WAIT}
    Click On The Element    ${button.accesioning.medical_neccesity.add_all}    add all    ${SHORT_WAIT}
    Send Text To Textfield    ${textbox.accesioning.medicalneccesity.selected_documentation_search}    selected documentation search box    ${MEDIUM_WAIT}    ${test_data}[Medical_Necessity_Documentation]
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    available documentation    ${MEDIUM_WAIT}

Validate Add All Documentation on Medical necessity
    ${new.available_documenation_locator}    Update Dynamic Value    ${label.accesioning.details.medical_neccesity.documentaion_count}    Available
    ${new.selected_documenation_locator}    Update Dynamic Value    ${label.accesioning.details.medical_neccesity.documentaion_count}    Selected
    ${new.dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    Update Dynamic Value    ${dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    Add all
    ${new.dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    Update Dynamic Value    ${dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    Remove all
    Log    Validate Available Documentation Count
    Wait For The Element to be Visible    ${new.available_documenation_locator}    available documentation    ${MEDIUM_WAIT}
    Log    Click on Add All Button
    Click On The Element    ${new.dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    add all    ${MEDIUM_WAIT}
    Log    Validate Selected Documentation Count
    Wait For The Element to be Visible    ${new.selected_documenation_locator}    selected documentation    ${MEDIUM_WAIT}
    Log    Click on Remove All
    Click On The Element    ${new.dropdown.accesioning.tool_bar_grid.print_labels.label_template.options}    remove all    ${MEDIUM_WAIT}
    Log    Verify Updated Count displayed in Available Documentation
    Wait For The Element to be Visible    ${new.available_documenation_locator}    available documentation    ${MEDIUM_WAIT}

Verify Error Message When no Bill Type is Selected
    [Arguments]    ${R-id}
    Navigate to Details with Sub-Menu Button Page    ${R-id}    Insurance
    ${new.button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}    Please, select
    Javascript Click    ${new.button.accesioning.first_element_details.Insurance.update_insurance.select_insurance_attached_option}
    Wait Until Time    2
    ${new.button.accesioning.first_element_details.Insurance.update_insurance.save}    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.update_insurance.save}    Save
    Click On The Element    ${new.button.accesioning.first_element_details.Insurance.update_insurance.save}    Save    ${SHORT_WAIT}

Drag And Drop First Documentation To Selected List
    [Documentation]    This Keyword is About \ Drag And Drop Documentation From Selected to Available
    Wait For The Element to be Visible    ${label.accesioning.medical_neccesity.selected_count}    selected_list    ${SHORT_WAIT}
    ${new.first.label.accesioning.details.medical_neccesity.available_documentation_list}    Update Dynamic Value    ${label.accesioning.details.medical_neccesity.available_documentation_list}    1
    ${new.second.label.accesioning.details.medical_neccesity.available_documentation_list}    Update Dynamic Value    ${label.accesioning.details.medical_neccesity.available_documentation_list}    2
    ${available_documenation_one}    Get Text    ${new.first.label.accesioning.details.medical_neccesity.available_documentation_list}
    ${available_documenation_two}    Get Text    ${new.second.label.accesioning.details.medical_neccesity.available_documentation_list}
    Set Test Variable    ${available_documenation_one}
    Set Test Variable    ${available_documenation_two}
    Scroll Element Into View    ${new.second.label.accesioning.details.medical_neccesity.available_documentation_list}
    Wait Until Time    3
    Javascript Click    ${checkbox.accesioning.medical_neccessity.high_risk_assesment}
    Do_Drag_and_Drop    ${available_documenation_one}    ${label.accesioning.details.medical_neccesity.selected_list}

Drag And Drop Second Documentation To Selected List
    [Documentation]    This Keyword is About Drag And Drop Documentation From Available to Selected
    ${new.dragged_element_in_selected_list}    Update Dynamic Value    ${label.accesioning.medical_neccesity.element_selected_list}    ${available_documenation_one}
    ${dragged_element_in_selected_list_two}    Update Dynamic Value    ${label.accesioning.medical_neccesity.element_selected_list}    ${available_documenation_two}
    Wait Until Element Is Visible    ${new.dragged_element_in_selected_list}    ${LONG_WAIT}    selected_list
    Do_Drag_and_Drop    ${available_documenation_two}    ${label.accesioning.details.medical_neccesity.selected_list}
    Set Focus To Element    ${button.accesioning.details.medical_neccesity.save}
    Wait Until Element Clickable    ${button.accesioning.details.medical_neccesity.save}    ${MEDIUM_WAIT}
    Javascript Click    ${button.accesioning.details.medical_neccesity.save}
    Verify Message    ${message.accesioning.first_element_details.insurance.update_insurance.saved}    ${MEDIUM_WAIT}

Validate Sample History in Audit Screen When Searched With Tracking Number
    Log    Verify The Sample History in Audit Screen
    Wait Until Time    3
    Click Element    ${button.accesioning.homepage.menu_hamburger}
    Click On The Element    ${button.accesioning.requisition_hamburger_options.audit}    audit button    ${SHORT_WAIT}
    Wait For The Element to be Visible    ${label.accesioning.audit.date_and_time}    last changed label in audit    ${SHORT_WAIT}
    Wait For The Element to be Visible    ${label.accesioning.audit.last_changed_by_name}    last changed byname in audit    ${SHORT_WAIT}
    ${Last_Changed_By}    Get Text    ${label.accesioning.audit.last_changed_by_name}
    Should Be Equal    prakash.kamma    ${Last_Changed_By}

Reject Sample and Verify in Samples Page
    [Arguments]    ${testdata}
    Add Samples    ${testdata}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.accesioning.details.samples.first_requaition.reject}    reject    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Reject Sample
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    Page title    ${LONG_WAIT}
    Send Text To Textfield    ${textbox.accesioning.details.samples.reject.reason_rejection}    reason rejection    ${LONG_WAIT}    qa
    Click On The Element    ${button.accesioning.details.samples.reject.reject_sample.save}    save    ${LONG_WAIT}    selenium
    Wait For The Element to be Visible    ${label.accesioning.details.samples.reject_sample_status}    sample status    ${LONG_WAIT}

Change Sample Type in Edit Sample Type Page
    [Arguments]    ${sample_id}    ${testdata}
    Add Samples    ${testdata}
    Wait For The Element to be Visible    ${button.accesioning.details.samples.edit}    edit samples    ${MEDIUM_WAIT}
    ${sample_type_locator}    Update Dynamic Value    ${label.accesioning.details.samples.element_for_geting_sample_type}    ${sample_id}
    Set Test Variable    ${sample_type_locator}
    ${application_sample_type}    Get Element Attribute    ${sample_type_locator}    title
    Javascript Click    ${button.accesioning.details.samples.edit}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Edit Sample
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    edit sample title    ${SHORT_WAIT}
    Modify Sample Type    ${testdata}
    Click On The Element    ${button.accesioning.details.samples.edit_sample.save}    save    ${MEDIUM_WAIT}
    Wait For The Element to be Visible    ${sample_type_locator}    sample type    ${SHORT_WAIT}

Verify Sample Type
    [Arguments]    ${sample_type_locator}    ${sample_type_option}
    ${new.button.common.sample_type}    Update Dynamic Value    ${button.common.sample_type}    ${sample_type_option}
    Wait For The Element to be Visible    ${new.button.common.sample_type}    sample type label    ${MEDIUM_WAIT}

Verify Edit Samples in Samples tab
    [Arguments]    ${Testdata}
    Log    Verify Edit samples Functionality in Pending
    ${sample_id}    Get First Requisition Sample Id
    ${R-id}    Get First Requisition RID
    Log    Get the First Requisition Sample id and R-id
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Samples
    Log    Navigated to Samples Page
    Log    Edit Sample Type in Edit Sample Page
    Change Sample Type in Edit Sample Type Page    ${R-id}    ${Testdata}
    Log    Verify Sample Type in Add Sample Page
    Verify Sample Type    ${sample_type_locator}    ${sample_type_option}

Verify Reject Sample Functionality
    [Arguments]    ${testdata}
    Log    Select one Requisition ID and Click on Requisition sub menu.
    ${sample_id}    Get First Requisition Sample Id
    Log    Requisition is Selected
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Samples
    Log    Navigate to Samples Page
    Reject Sample and Verify in Samples Page    ${testdata}

Change Bill Type in General Tab
    [Arguments]    ${sample_id}    ${testdata}    ${save_button}
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    General
    Click On The Element    ${button.accesioning.first_element_details.General}    General tab    ${MEDIUM_WAIT}
    Wait Until Time    3
    ${bill_type_list}    Split String    ${testdata}[Bill_Type]    ,
    ${count}    Get Length    ${bill_type_list}
    FOR    ${Key}    IN RANGE    ${count}
        ${bill_type_option_locator}    Update Dynamic Value    ${button.requisition.details.general.bill_type}    ${bill_type_list}[${Key}]
        ${selected_bill_type_attribute}    Get Element Attribute    ${bill_type_option_locator}    class
        ${status}    Run Keyword And Return Status    Should Contain    ${selected_bill_type_attribute}    selected
        Run Keyword If    ${status}==False    Javascript Click    ${bill_type_option_locator}
        ${bill_type_option}    Set Variable    ${bill_type_list}[${Key}]
        Set Test Variable    ${bill_type_option_locator}
        Set Test Variable    ${bill_type_option}
        Exit For Loop If    ${status}==False
    END
    ${gurantor_mail_textbox}    Update Dynamic Value    ${element.accesioning.details.general}    guarantor_email
    ${gurantor_phone_number_textbox}    Update Dynamic Value    ${element.accesioning.details.general}    guarantor_phone
    Send Text To Textfield    ${gurantor_mail_textbox}    guarantor mail textbox    ${MEDIUM_WAIT}    ${testdata}[guarantor_email]
    Send Text To Textfield    ${gurantor_phone_number_textbox}    guarantor phone number    ${MEDIUM_WAIT}    ${testdata}[guarantor_phone_number]
    Wait Until Time    3
    Javascript Click    ${textbox.accesioning.details.general.date_received}
    Click On The Element    ${button.accesioning.details.general.now}    now button in calendar    ${MEDIUM_WAIT}
    ${button.save}    Run Keyword If    '${save_button}'=='None'    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.general.save}    Save
    ...    ELSE    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.general.save}    Save and Update the Patient
    Click On The Element    ${button.save}    save button    ${MEDIUM_WAIT}    selenium
    Wait For The Element to be Visible    ${messages.success}    success message    ${MEDIUM_WAIT}
    Wait Until Element Is Not Visible    ${messages.success}    ${MEDIUM_WAIT}    Success message is still visible after waiting ${MEDIUM_WAIT} seconds

Navigate to Select Tests and Validate Drag and Drop in Available List
    [Arguments]    ${sample_id}    ${disease_name}
    ${new.button.accesioning.details.samples.details}    Update Dynamic Value    ${button.accesioning.details.samples.details}    ${sample_id}
    Click On The Element    ${new.button.accesioning.details.samples.details}    samples label    ${LONG_WAIT}
    Click On The Element    ${button.accesioning.requisitions_details.samples.sample_details.select_tests}    select tests    ${LONG_WAIT}
    Click On The Element    ${button.accesioning.requisition_details.samples.select_tests.remove_all}    Remove all button    ${LONG_WAIT}
    ${new.label.accesioning.requisition_details.samples.select_tests.element_in_available_list}    Update Dynamic Value    ${label.accesioning.requisition_details.samples.select_tests.element_in_available_list}    ${disease_name}
    Wait For The Element to be Visible    ${new.label.accesioning.requisition_details.samples.select_tests.element_in_available_list}    available list    ${LONG_WAIT}
    ${element_to_drag}    Set Variable    ${disease_name}
    Do_Drag_and_Drop    ${element_to_drag}    ${label.accesioning.details.samples.select_tests.selected_list}
    Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    Order    ${LONG_WAIT}
    ${new.label.accesioning.details.samples.disease_name}    Update Dynamic Value    ${label.accesioning.details.samples.disease_name}    ${disease_name}
    Wait For The Element to be Visible    ${new.label.accesioning.details.samples.disease_name}    disease list    ${LONG_WAIT}

Navigate to General Tab and Verify Doctor Signed Functionality
    [Arguments]    ${testdata}
        Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
        Navigate to Details with Sub-Menu Button Page    ${sample_id}    General
        ${yes_checkbox}    Update Dynamic Value    ${checkbox.accesioning.details.general.dr_signed}    Yes
        ${no_checkbox}    Update Dynamic Value    ${checkbox.accesioning.details.general.dr_signed}    No
        ${yes_checkbox_locator_for_attribute}    Update Dynamic Value    ${checkbox.accesioning.general.checkbox_for_attribute}    Yes
        ${no_checkbox_locator_for_attribute}    Update Dynamic Value    ${checkbox.accesioning.general.checkbox_for_attribute}    No
        Wait Until Time    3
        Click On CheckBox And Verify    ${yes_checkbox}    ${yes_checkbox_locator_for_attribute}    class    ${MEDIUM_WAIT}
        ${new.button.accesioning.first_element_details.Insurance.general.save}    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.general.save}    Save
        Click Element    ${new.button.accesioning.first_element_details.Insurance.general.save}
        Wait For The Element to be Visible    ${messages.success}    success message    ${MEDIUM_WAIT}
        Wait Until Element Is Not Visible    ${messages.success}    ${MEDIUM_WAIT}    success message is displayed
        Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
        Navigate to Details with Sub-Menu Button Page    ${sample_id}    General
        Click On CheckBox And Verify    ${no_checkbox}    ${no_checkbox_locator_for_attribute}    class    ${MEDIUM_WAIT}
        Click On The Element    ${new.button.accesioning.first_element_details.Insurance.general.save}    save button    ${MEDIUM_WAIT}
        Wait For The Element to be Visible    ${messages.success}    success message    ${MEDIUM_WAIT}

Validate Invalid Email Format In General Tab
    [Arguments]    ${testdata}
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    General
    Log    Input All Patient Details
    Input All Patient Details Fields In General Tab    ${testdata}
    ${new.button.accesioning.first_element_details.Insurance.general.save}    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.general.save}    Save and Update the Patient
    Click Element    ${new.button.accesioning.first_element_details.Insurance.general.save}
    Verify Text Message    Error in Email    ${SHORT_WAIT}

Validate Change Bill Type in General
    [Arguments]    ${testdata}    ${save_button}=None
    Log    Search For Sample Id
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Log    Change Bill Type of Requisition in General Page
    Change Bill Type in General Tab    ${sample_id}    ${testdata}    ${save_button}
    Log    Verify Update Bill Type In General
    Navigate to General and Verify Bill Type is Updated    ${bill_type_option}

Update Patient Details in General Tab
    [Arguments]    ${testdata}
    ${patient_first_name_textbox.element.accesioning.details.general}    Update Dynamic Value    ${element.accesioning.details.general}    first_name
    ${patient_last_name_textbox.element.accesioning.details.general}    Update Dynamic Value    ${element.accesioning.details.general}    last_name
    Click Element    ${button.exceptions.general.client_site_textbox.close}
    Wait For Spinner To Disappear    ${spinner.locator}
    Input Text    ${textbox.exceptions.general.client_site}    ${testdata}[requisition_client_site]
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[requisition_client_site]
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    client site dropdown option    ${MEDIUM_WAIT}
    Click Element    ${new.label.accesioning.details.submenu}
    Screenshot.Take Screenshot
    Wait For Spinner To Disappear    ${spinner.locator}
    Screenshot.Take Screenshot
    Input Text    ${textbox.exceptions.general.site_contact}    ${testdata}[requisition_site_contact]
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[requisition_site_contact]
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    site contact dropdown option    ${MEDIUM_WAIT}
    Click Element    ${new.label.accesioning.details.submenu}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click Element    ${textbox.exceptions.general.order_physician}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[requisition_order_physician]
    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    order physician dropdown option    ${MEDIUM_WAIT}
    Click Element    ${new.label.accesioning.details.submenu}
    Input All Patient Details Fields In General Tab    ${testdata}
    Send Text To Textfield    ${patient_first_name_textbox.element.accesioning.details.general}    Patient First Name Textbox    ${MEDIUM_WAIT}    ${testdata}[patient_first_name]
    Send Text To Textfield    ${patient_last_name_textbox.element.accesioning.details.general}    Patient Last Name Textbox    ${MEDIUM_WAIT}    ${testdata}[patient_last_name]
    ${updated_patient_name}    Set Variable    ${testdata}[patient_first_name]    ${testdata}[patient_last_name]
    Set Test Variable    ${updated_patient_name}
    ${new.button.accesioning.first_element_details.Insurance.general.save}    Update Dynamic Value    ${button.accesioning.first_element_details.Insurance.general.save}    Save and Update the Patient
    Send Text To Textfield    ${textbox.exceptions.general.protocol}    protocal textbox    ${MEDIUM_WAIT}    BBP
    Press Keys    None    RETURN
    Click Element    ${new.button.accesioning.first_element_details.Insurance.general.save}
    Wait Until Element Is Visible    ${messages.success}    ${MEDIUM_WAIT}    success message is not visible after waiting ${MEDIUM_WAIT} seconds
    Wait Until Element Is Not Visible    ${message.accesioning.first_element_details.insurance.update_insurance.saved}    ${MEDIUM_WAIT}    success message is still visible after waiting ${MEDIUM_WAIT} seconds
    Scroll Element Into View    ${textbox.homepage.common_search}

Validate Updated Patient Details in Accesioning General Page
    [Arguments]    ${sample_id}    ${testdata}    ${patient_name}
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    General
    ${female_gender_Locator}    Update Dynamic Value    ${label.accesioning.details.submenu}    Female
    ${patient_first_name.label.accesioning.details.general.patient_locator}    Update Dynamic Value    ${label.accesioning.details.general.patient_locator}    ${patient_name}[1]
    ${patient_last_name.label.accesioning.details.general.patient_locator}    Update Dynamic Value    ${label.accesioning.details.general.patient_locator}    ${patient_name}[0]
    ${Application_Gender}    Get Element Attribute    ${female_gender_Locator}    class
    Should Contain    ${Application_Gender}    selected
    Wait For The Element to be Visible    ${patient_first_name.label.accesioning.details.general.patient_locator}    First name    ${MEDIUM_WAIT}
    Wait For The Element to be Visible    ${patient_last_name.label.accesioning.details.general.patient_locator}    Last name    ${MEDIUM_WAIT}

Modify Patient Details and Verify
    [Arguments]    ${testdata}
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    General
    Log    Modify Patient Details
    Update Patient Details in General Tab    ${testdata}
    Log    Verify Modified Patient Details in General Tab
    Validate Updated Patient Details in Accesioning General Page    ${sample_id}    ${testdata}    ${updated_patient_name}

Select Filter Type in Accesioning
    [Arguments]    ${FIlter_Category}    ${FIlter_Type_Option}
    ${new.button.accesioning.filter_type}    Update Dynamic Value    ${button.accesioning.filter_type}    ${FIlter_Category}
    ${new.textbox.accesioning.filter.filter_sub_category}    Update Dynamic Value    ${textbox.accesioning.filter.filter_sub_category}    ${FIlter_Category}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${FIlter_Type_Option}
    ${new.button.accesioning.apply_filter}    Update Dynamic Value    ${button.accesioning.apply_filter}    ${FIlter_Category}
    Click On The Element    ${new.button.accesioning.filter_type}    ${FIlter_Category} type search icon    ${MEDIUM_WAIT}
    Send Text To Textfield    ${new.textbox.accesioning.filter.filter_sub_category}    Status Filter Type    ${MEDIUM_WAIT}    ${FIlter_Type_Option}
    Wait Until Time    ${MINI_WAIT}
    ${status}    Wait For The Element to be Visible    ${new.label.accesioning.details.submenu}    filter_option    ${SHORT_WAIT}
    Run Keyword If    '${status}'=='True'    Javascript Click    ${new.label.accesioning.details.submenu}
    Click On The Element    ${new.button.accesioning.apply_filter}    Filter button    ${MEDIUM_WAIT}
    Wait For The Element to be Visible    ${homepage.spinner}    spinner    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${homepage.spinner}
    Screenshot.Take Screenshot

Add Requisition Error Type in Errors
    [Arguments]    ${requisition_error_name}    ${testdata}    ${comment}=No
    Send Text To Textfield    ${textbox.accessioning.details.errors.add.requisition_error_type}    requisition name    ${MEDIUM_WAIT}    ${requisition_error_name}
    Press Keys    None    RETURN
    Wait For Spinner To Disappear    ${spinner.locator}
    Send Text To Textfield    ${textbox.accesioning.details.errors.add_error.message}    message textbox    ${MEDIUM_WAIT}    ${testdata}[comment]
    Run Keyword If    '${comment}'!='No'    Select Frame And Input Req Comments    ${testdata}[comment]    ${frame.accesioning.req-hamburger.reject}
    Log    Requisition Error "${requisition_error_name}" is added
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.accessioning.details.errors.add.save}    Save    ${MEDIUM_WAIT}    SeleniumClick
    Screenshot.Take Screenshot
    Wait Until Element Is Not Visible    ${button.accessioning.details.errors.add.save}    ${MEDIUM_WAIT}    Save Button is still visible after waiting ${MEDIUM_WAIT} seconds

Add Errors to Requisition in Different Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending    On-Hold    Missing data    All
    Comment    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
    FOR    ${key}    IN RANGE    0    1
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        ${RID}    Get First Requisition RID
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
        Verify Error Added in Details Errors Page    ${testdata}[comment]
        Log    Verified the "${testdata}[requisition_error_type]" Error
    END

Edit the Existing Error in Details Errors Page in Different Tabs
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending    On-Hold    Missing data    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        ${RID}    Get First Requisition RID
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        ${new.button.accesioning.details.errors.edit_added_error}    Update Dynamic Values    ${button.accesioning.details.errors.edit_added_error}    ${added_error}    Edit
        ${status}=    Wait For The Element to be Visible    ${new.button.accesioning.details.errors.edit_added_error}    added_error_name    ${MEDIUM_WAIT}
        Run Keyword If    '${status}'=='False'    Click Element    ${button.exceptions.details.samples.next_page}
        Run Keyword If    '${status}'=='False'    Wait For Spinner To Disappear    ${spinner.locator}
        Click On The Element    ${new.button.accesioning.details.errors.edit_added_error}    Edit Error    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Click On The Element    ${textbox.accessioning.details.errors.add.requisition_error_type}    Requisition_Error_Type_Textbox    ${MEDIUM_WAIT}    SeleniumClick
        Add Requisition Error Type in Errors    No Insurance    ${testdata}
        Verify Error Added in Details Errors Page    No Insurance
        Log    "No Insurance" Error name is Visible
    END

Add Samples
    [Arguments]    ${testdata}
    Click On The Element    ${button.accessioning.details.samples.add_sample}    Add_sample    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.accessioning.details.samples.add_sample.sample#}    sample# textbox    ${MEDIUM_WAIT}    ${testdata}[comment]
    Screenshot.Take Screenshot
    Click On The Element    ${textbox.accesioning.samples.add_samples.select_location}    select location textbox    ${MEDIUM_WAIT}    selenium
    Wait For Spinner To Disappear    ${spinner.locator}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[select_sample_location]
    Click On The Element    ${new.label.accesioning.details.submenu}    select location options    ${MEDIUM_WAIT}    selenium
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${dropdown.accessioning.details.samples.add_sample.type}    sample type textbox    ${MEDIUM_WAIT}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    Blood
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${new.label.accesioning.details.submenu}
    Send Text To Textfield    ${textbox.accessioning.details.samples.add_sample.amount}    amount textbox    ${MEDIUM_WAIT}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.accessioning.details.samples.add_samples.save}    save    ${MEDIUM_WAIT}
    ${status}    Wait For The Element to be Visible    ${spinner.locator}    ${MEDIUM_WAIT}    spinner is not visible after waiiting ${MEDIUM_WAIT} seconds
    Run Keyword If    '${status}'=='True'    Wait For Spinner To Disappear    ${spinner.locator}

Hamburger_Unreject Requisition
    ${RID}    Get First Requisition RID
    Log    "${RID}" is Received
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Unreject
    Wait Until Page Contains Element    ${label.accessioning.requisition_hamburger.message_unreject}    ${LONG_WAIT}
    Screenshot.Take Screenshot

Add Panel_name
    Wait Until Element Is Visible    ${label.accesioning.pending.add_new_panel.first_panel}    ${LONG_WAIT}
    ${panel_name}    Get Element Attribute    ${label.accesioning.pending.add_new_panel.first_panel}    title
    ${splitted_panel_name}    Split String    ${panel_name}    \ (***
    ${updated_panel_name}    Set Variable    ${splitted_panel_name}[0]
    Click On The Element    ${button.accesioning.pending.add_new_panel.select_first_panel}    Select_First_Panel    ${MEDIUM_WAIT}
    Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    Order    ${MEDIUM_WAIT}

Add Panel Name in Random
    [Arguments]    ${Panel_position}
    [Documentation]    This keyword is used to add panel by selecting random panel checkbox from list by giving th position value of single panel i.e..,(1,2,3,....)upto the nth value
    ${random_panel_selection}    Update Dynamic Value    ${label.accessioning.add_panel.random_panel_name}    ${Panel_position}
    Wait Until Element Is Visible    ${random_panel_selection}    ${LONG_WAIT}
    ${panel_name}    Get Element Attribute    ${random_panel_selection}    title
    ${splitted_panel_name}    Split String    ${panel_name}    \ (***
    Set Test Variable    ${updated_panel_name}    ${splitted_panel_name}[0]
    ${new.button.accessioning.add_panel.random_panel_name.checkbox}    Update Dynamic Value    ${button.accessioning.add_panel.random_panel_name.checkbox}    ${Panel_position}
    Click On The Element    ${new.button.accessioning.add_panel.random_panel_name.checkbox}    Select_Panel_name    ${MEDIUM_WAIT}
    Click On The Element    ${button.accesioning.pending.add_new_panel.select_panel.order}    Order    ${MEDIUM_WAIT}

Verify Added Panel Name in Requisition
    Add Panel Name in Random    40
    Navigate to Details with Sub-Menu Button Page    ${home_page_requisition_id}[0]    Panels
    Wait Until Page Contains Element    ${label.accessioning.details.add_panel.pagetitle}    ${MEDIUM_WAIT}
    Log    Navigated to "Panels" Page
    Wait Until Page Contains    ${updated_panel_name}    ${LONG_WAIT}
    Screenshot.Take Screenshot

Guardian Details
    [Arguments]    ${testdata}
    Click On The Element    ${textbox.accessioning.requisition.details.general.guardian_firstname}    guardian_firstname    ${MEDIUM_WAIT}    SeleniumClick
    ${guardian_firstname_status}    Get Element Attribute    ${textbox.accessioning.requisition.details.general.guardian_firstname}    data-initvalue
    Run Keyword If    "${guardian_firstname_status}"!="$0"    Click On The Element    ${textbox.accessioning.requisition.details.general.guardian_firstname.clear}    guardian_firstname_clear    ${MEDIUM_WAIT}    SeleniumClick
    Send Text To Textfield    ${textbox.accessioning.requisition.details.general.guardian_firstname}    guardian_firstname    ${MEDIUM_WAIT}    ${testdata}[first_name]
    Log    "${testdata}[first_name]" is entered into guardian_firstname textbox
    Click On The Element    ${textbox.accessioning.requisition.details.general.guardian_lastname}    guardian_lastname    ${MEDIUM_WAIT}    SeleniumClick
    ${guardian_lastname_status}    Get Element Attribute    ${textbox.accessioning.requisition.details.general.guardian_lastname}    data-initvalue
    Run Keyword If    "${guardian_lastname_status}"!="$0"    Click On The Element    ${textbox.accessioning.requisition.details.general.guardian_lastname.clear}    patient_lastname_clear    ${MEDIUM_WAIT}    SeleniumClick
    Send Text To Textfield    ${textbox.accessioning.requisition.details.general.guardian_lastname}    guardian_lastname    ${MEDIUM_WAIT}    ${testdata}[last_name]
    Log    "${testdata}[last_name]" is entered into guardian_lastname textbox
    Click On The Element    ${textbox.accessioning.requisition.details.general.guardian_dob}    guardian_DOB    ${MEDIUM_WAIT}    SeleniumClick
    Select From List By Value    ${textbox.accessioning.requisition.details.general.guardian_dob.year}    ${testdata}[dob_year]
    Log    "${testdata}[dob_year]" is selected in guardian_DOB
    Select From List By Value    ${textbox.accessioning.requisition.details.general.guardian_dob.month}    ${testdata}[dob_month]
    Log    "${testdata}[dob_month]" is selected in guardian_DOB
    ${new.textbox.accessioning.requisition.details.general.guardian_dob.day}    Update Dynamic Value    ${textbox.accessioning.requisition.details.general.guardian_dob.day}    ${testdata}[dob_day]
    Click On The Element    ${new.textbox.accessioning.requisition.details.general.guardian_dob.day}    patient_DOB_day    ${MEDIUM_WAIT}    SeleniumClick

Guarantor Details
    [Arguments]    ${testdata}
    Click On The Element    ${textbox.accessioning.requisition.details.general.guarantor_email}    Guarantor_Email    ${MEDIUM_WAIT}    SeleniumClick
    ${email_status}    Get Element Attribute    ${textbox.accessioning.requisition.details.general.guarantor_email}    data-initvalue
    Run Keyword If    "${email_status}"!="$0"    Click On The Element    ${textbox.accessioning.requisition.details.general.guarantor_email.clear}    Clear_Email    ${MEDIUM_WAIT}    SeleniumClick
    Input Text    ${textbox.accessioning.requisition.details.general.guarantor_email}    ${testdata}[email]
    Log    "${testdata}[email]" is entered into Guarantor_Email textbox
    Click On The Element    ${textbox.accessioning.requisition.details.general.guarantor_ph-no}    Guarantor_phone_number    ${MEDIUM_WAIT}    SeleniumClick
    ${ph.no_status}    Get Element Attribute    ${textbox.accessioning.requisition.details.general.guarantor_ph-no}    data-initvalue
    Run Keyword If    "${ph.no_status}"!="$0"    Click On The Element    ${textbox.accessioning.requisition.details.general.guarantor_ph-no.clear}    Clear_phone_number    ${MEDIUM_WAIT}    SeleniumClick
    Input Text    ${textbox.accessioning.requisition.details.general.guarantor_ph-no}    ${testdata}[ph_number]
    Log    "${testdata}[ph_number]" is entered into Guarantor_phone_number textbox

Verify Updated Guardian Details
    [Arguments]    ${testdata}
    ${new.label.accessioning.requisition.details.general.first_name}    Update Dynamic Value    ${label.accessioning.requisition.details.general.name}    ${testdata}[first_name]
    Wait Until Page Contains Element    ${new.label.accessioning.requisition.details.general.first_name}
    Screenshot.Take Screenshot
    ${new.label.accessioning.requisition.details.general.last_name}    Update Dynamic Value    ${label.accessioning.requisition.details.general.name}    ${testdata}[last_name]
    Wait Until Page Contains Element    ${new.label.accessioning.requisition.details.general.last_name}
    Screenshot.Take Screenshot
    ${new.label.accessioning.requisition.details.general.guardian_dob}    Update Dynamic Value    ${label.accessioning.requisition.details.general.guardian_dob}    ${testdata}[dob_year]
    Wait Until Page Contains Element    ${new.label.accessioning.requisition.details.general.guardian_dob}
    Screenshot.Take Screenshot

Save Requisition in General Tab
    Wait Until Time    ${SHORT_WAIT}
    Click On The Element    ${button.accessioning.requisition.details.general.save}    Save    ${MEDIUM_WAIT}
    Wait Until Page Contains Element    ${message.success}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Edit Question Form
    [Arguments]    ${testdata}
    ${new.button.accessioning.details.questionform.list.editanswer}    Update Dynamic Value    ${button.accessioning.details.questionform.list.editanswer}    ${testdata}[question_form]
    Click Element    ${new.button.accessioning.details.questionform.list.editanswer}
    Wait Until Time    ${MINI_WAIT}
    ${new.button.accessioning.details.questionform.list.editanswer.dropdown_options}    Update Dynamic Value    ${button.accessioning.details.questionform.list.editanswer.dropdown_options}    ${testdata}[question_form]
    Click Element    ${new.button.accessioning.details.questionform.list.editanswer.dropdown_options}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[question_form_editanswer]
    Click On The Element    ${new.label.accesioning.details.submenu}    ${testdata}[question_form] selecting options    ${MEDIUM_WAIT}
    Click On The Element    ${button.accessioning.details.questionform.list.editanswer.save}    Save    ${MEDIUM_WAIT}

Verify Edited Answer in Question Form
    [Arguments]    ${testdata}
    ${new.button.accessioning.details.questionform.list.answer_coloumn}    Update Dynamic Value    ${button.accessioning.details.questionform.list.answer_coloumn}    ${testdata}[question_form]
    Wait For The Element to be Visible    ${new.button.accessioning.details.questionform.list.answer_coloumn}    Question_Form_Answer_Block    ${MEDIUM_WAIT}
    ${Answer_status}    Get Text    ${new.button.accessioning.details.questionform.list.answer_coloumn}
    Should Be Equal    ${testdata}[question_form_editanswer]    ${Answer_status}
    Screenshot.Take Screenshot

Remove Sample Id From On Hold and Handle Alert
    Comment    Remove sample id from On Hold section
    Wait Until Time    3
    Javascript Click    ${button.accesioning.pending.search_result_details.hamburger_menu}
    Wait Until Time    3
    Javascript Click    ${button.accesioning.pending_search_result.hamburger_menu.remove_hold}
    Wait Until Time    3
    Run Keyword And Ignore Error    Alert Should Not Be Present    action=ACCEPT
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${message.successfully}    ${LONG_WAIT}
    Log    ${status}

Delete Error in Errors Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending    On-Hold    Missing data    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        Run Keyword If    "${Page_Name}[${key}]"!="${Page_Name}[1]"    Javascript Click    ${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}
        Wait Until Time    ${SHORT_WAIT}
        Run Keyword If    "${Page_Name}[${key}]"!="${Page_Name}[1]"    Javascript Click    ${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}
        Run Keyword If    "${Page_Name}[${key}]"!="${Page_Name}[1]"    Select Filter Type in Accesioning    Client Site    Facility Demo, LLC.
        ...    ELSE    Select Filter Type in Accesioning    Status    ACCESSIONED
        Wait Until Time    ${SHORT_WAIT}
        ${RID}    Get First Requisition RID
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
        ${Added_Requisition_error}    Update Dynamic Value    ${button.accesioning.error.error_name}    ${testdata}[requisition_error_type]
        Screenshot.Take Screenshot
        Verify Delete Error In Details Page    ${testdata}    ${RID}
    END

Resolve Error in Errors Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending    All    On-Hold    Missing data
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        ${RID}    Get First Requisition RID
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
        ${new.button.accesioning.details.errors.edit_added_error}    Update Dynamic Values    ${button.accesioning.details.errors.edit_added_error}    ${testdata}[comment]    Resolved
        ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${new.button.accesioning.details.errors.edit_added_error}    ${MEDIUM_WAIT}    added error is not visible after waiting ${MEDIUM_WAIT} seconds
        Run Keyword If    '${status}'=='True'    Click Element    ${new.button.accesioning.details.errors.edit_added_error}
        Run Keyword If    '${status}'=='False'    Click Element    ${button.accesioning.add_errors.navigate_to_next}
        Run Keyword If    '${status}'=='False'    Wait Until Element Is Visible    ${new.button.accesioning.details.errors.edit_added_error}    ${MEDIUM_WAIT}    added error is not visible after waiting ${MEDIUM_WAIT} seconds
        Run Keyword If    '${status}'=='False'    Click Element    ${new.button.accesioning.details.errors.edit_added_error}
        Verify Message    ${message.accesioning.error.resolve_error.resolved}    ${MEDIUM_WAIT}
        ${Resolved_Tick_Mark}    Update Dynamic Value    ${label.accesioning.details.errors.resolved(tick_mark)}    ${testdata}[comment]
        Verify Message    ${Resolved_Tick_Mark}    ${MEDIUM_WAIT}
    END

Add Comments to Errors in Errors
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending    On-Hold    Missing data    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        ${RID}    Get First Requisition RID
        Log    "${RID}" is Received
        Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
        Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
        Log    Navigated to "Errors" Page
        Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
        Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
        Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
        ${new.button.accesioning.details.errors.edit_added_error}    Update Dynamic Values    ${button.accesioning.details.errors.edit_added_error}    ${testdata}[comment]    Comment
        Click On The Element    ${new.button.accesioning.details.errors.edit_added_error}    Comment button    ${MEDIUM_WAIT}    selenium
        Select Frame And Input Req Comments    ${testdata}[comment]    ${frame.accesioning.req-hamburger.reject}
        Perform Actions    Add Comment    ${MEDIUM_WAIT}
        Verify message    ${message.accesioning.errors.add_comment.added}    ${MEDIUM_WAIT}
        Click On The Element    ${button.cross(x)}    Comments_Page_Close    ${MEDIUM_WAIT}
        Select Filter Status For Comments in Errors Tab    ${testdata}
        ${status}    Run Keyword And Return Status    Wait Until Page Contains    <p>${testdata}[comment]</p>    ${MEDIUM_WAIT}
        Run Keyword If    '${status}'=='False'    Click Element    ${button.accesioning.add_errors.navigate_to_next}
        Wait Until Page Contains    <p>${testdata}[comment]</p>    ${MEDIUM_WAIT}
        Screenshot.Take Screenshot
    END

Edit Locations in Samples
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending    On-Hold    Missing data    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        Run Keyword If    "${Page_Name}[${key}]"=="${Page_Name}[0]"    Javascript Click    ${button.accesioning.protocol}
        ...    ELSE    Select Filter Type in Accesioning    Status    ACCESSIONED
        Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Run Keyword If    "${Page_Name}[${key}]"=="${Page_Name}[0]"    Get First Requisition Rid in Pending in Accesioning
        ...    ELSE    Get First Requisition RID
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait Until Page Contains Element    ${label.accessioning.details.sample.pagetitle}    ${MEDIUM_WAIT}
        Log    Navigated to "Samples" Page
        Add Samples    ${testdata}
        Wait For Spinner To Disappear    ${spinner.locator}
        ${new.button.accessioning.details.errors.hamburger}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger}    ${RID}    ${testdata}[comment]
        Click On The Element    ${new.button.accessioning.details.errors.hamburger}    samples hamburger    ${MEDIUM_WAIT}    selenium
        Input Mandatory Fields In Edit Location Page    ${testdata}
        Wait For Spinner To Disappear    ${spinner.locator}
        ${new.label.accessioning.details.samples.added_sample.location_name}    Update Dynamic Values    ${label.accessioning.details.samples.added_sample.location_name}    ${testdata}[comment]    ${testdata}[select_sample_location]
        Wait Until Page Contains Element    ${new.label.accessioning.details.samples.added_sample.location_name}    ${MEDIUM_WAIT}
        Screenshot.Take Screenshot
    END

Add Comments and Verify in Samples
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending    On-Hold    Missing data    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to Accessioning "${Page_Name}[${key}]" Page
        Run Keyword If    "${Page_Name}[${key}]"=="${Page_Name}[0]"    Javascript Click    ${button.accesioning.protocol}
        ...    ELSE    Select Filter Type in Accesioning    Status    ACCESSIONED
        Wait For Spinner To Disappear    ${spinner.locator}
        ${RID}    Get First Requisition RID
        Navigate to Details with Sub-Menu Button Page    ${RID}    Samples
        Wait Until Page Contains Element    ${label.accessioning.details.sample.pagetitle}    ${MEDIUM_WAIT}
        Log    Navigated to "Samples" Page
        Add Samples    ${testdata}
        Add Comment in Samples Page    ${testdata}    ${RID}
        Verify Text Message    ${testdata}[comment]    ${MEDIUM_WAIT}
        Javascript Click    ${button.cross(x)}
    END

Select Requisitions of Facility Demo, LLC.Client Site
    Wait Until Time    ${SHORT_WAIT}
    Javascript Click    ${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}
    Wait Until Time    ${SHORT_WAIT}
    Javascript Click    ${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}
    Select Filter Type in Accesioning    Client Site    Facility Demo, LLC.
    Wait Until Time    ${SHORT_WAIT}
    Javascript Click    ${button.accesioning.protocol}

Complete Requisition
    Get First Requisition Sample Id
    Click on Home-Page Requisitions Button    ${button.accesioning.req_list.complete.by_replace_sample-id}    ${sample_id}
    Wait Until Time    5
    ${file}    Read File Path    ${EXECDIR}\\Downloads
    ${status}    Run Keyword And Return Status    File Should Exist    ${file}[0]
    Run Keyword If    "${status}"=="True"    Verify Text Message    Requisition Completed    ${SHORT_WAIT}
    Run Keyword If    "${status}"=="True"    Log    Message -"Requisition Completed" is Displayed
    Run Keyword If    "${status}"=="False"    Get Random Requisitions Sample_id    2
    Run Keyword If    "${status}"=="False"    Click on Home-Page Requisitions Button    ${button.accesioning.req_list.complete.by_replace_sample-id}    ${sample_id}
    Run Keyword If    "${status}"=="False"    Read and Remove File path
    Run Keyword If    "${status}"=="False"    Verify Text Message    Requisition Completed    ${SHORT_WAIT}

Add Critical Error For Negative Validation
    [Arguments]    ${testdata}
    Click On The Element    ${button.accesioning.protocl_arrow}    protocol arrow    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Wait For The Element to be Visible    ${label.accesioning.get_first_rid}    first requisition    ${SHORT_WAIT}
    ${RID}    Get Element Attribute    ${label.accesioning.get_first_rid}    data-id
    Navigate to Details with Sub-Menu Button Page    ${RID}    Errors
    Wait Until Page Contains Element    ${label.accessioning.details.errors.page_title}    ${MEDIUM_WAIT}
    Log    Navigated to "Errors" Page
    Log    Click on Add Error
    Click On The Element    ${button.accessioning.details.errors.add}    Add    ${MEDIUM_WAIT}
    Click On The Element    ${button.maximize_window}    Maximize_page    ${MEDIUM_WAIT}
    Add Requisition Error Type in Errors    ${testdata}[requisition_error_type]    ${testdata}
    Verify Error Added in Details Errors Page    ${testdata}[requisition_error_type]
    ${RID}    Get Element Attribute    ${label.accesioning.critical_error_for_getting_rid}    data-id
    ${new.button.home_page_requisition.complete}    Update Dynamic Value    ${button.home_page_requisition.complete}    ${RID}
    Reload Page
    Wait Until Time    2
    Click on Home-Page Requisitions Button    ${new.button.home_page_requisition.complete}    ${RID}
    Wait Until Page Contains    Error:    ${LONG_WAIT}    Expected error message is displayed after waiting ${LONG_WAIT} seconds

Enter Reason Rejection Comments and Submit For Back To Pending
    [Arguments]    ${testdata}
    Click On The Element    ${textfield.accesioning.req_hamburger.back_to_pending.comments_field}    reason rejection    ${MEDIUM_WAIT}
    Input Text    ${textfield.accesioning.req_hamburger.back_to_pending.comments_field}    ${testdata}[comment]
    Perform Actions    Clear Results and Send Back    ${MEDIUM_WAIT}
    Wait Until Time    2
    Wait For Spinner To Disappear    ${spinner.locator}
    Log    Comments are Entered and Clicked on "Send back for Testing"

Get Sample Id and Sent Back to Pending In Accesioning
    [Arguments]    ${testdata}
    Log    New Requisition is Created
    Log    Goto Quick Menu and Click on Accessioning.
    Navigate to Module And Tab    Accessioning    All
    Log    "Accessioning" data page is displayed.
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    Navigate to Requisition Hamburger Sub Menu Options    ${sample_id}    Back to Pending    sample_id
    Enter Reason Rejection Comments and Submit For Back To Pending    ${testdata}

Remove Files in Directory
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${count}    Get Length    ${file_path}
    FOR    ${key}    IN RANGE    ${count}
        Remove File    ${file_path}[${key}]
    END

Validate Error Messages in Complete Processing Page
    [Arguments]    ${testdata}
    Wait For Spinner To Disappear    ${spinner.locator}
    Click On The Element    ${button.select_present_time}    present time    ${MEDIUM_WAIT}
    Wait For The Element to be Visible    ${textbox.accesioning.requisition_completeall.tracking_number}    tracking_number_textbox    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.accesioning.requisition_completeall.tracking_number}    Tracking Number    ${MEDIUM_WAIT}    ${testdata}[track-id]
    Click On The Element    ${textbox.accesioning.requisition_completeall.start_processing}    Start processing    ${SHORT_WAIT}    selenium
    Verify Text Message    ${testdata}[Error_Messages]    ${MEDIUM_WAIT}
    Log    Alert should be Triggered to Enter Valid 5 Digits Tracking Number. Error_Message - "${testdata}[Error_Messages]" Verification is Completed

Navigate to Tool Bar Grid Buttons For PDF
    [Arguments]    ${button_name}
    ${Tool_Bar_Grid_Button}    Update Dynamic Value    ${button.accesioning.tool-bar-grid-buttons}    ${button_name}
    Click On The Element    ${Tool_Bar_Grid_Button}    ${button_name}    ${SHORT_WAIT}
    Log    We are Waiting here for 10 seconds to check to download files locally for getting required data
    Wait Until Time    10
    Take Screenshot

Navigate to Billing Batch Review Page
    ${tool_bar_grid_button}    Update Dynamic Value    ${button.accesioning.tool-bar-grid-buttons}    Billing Batch Review
    Scroll To Element    ${tool_bar_grid_button}
    Click On The Element    ${tool_bar_grid_button}    Billing Batch Review    ${SHORT_WAIT}
    Screenshot.Take Screenshot
    [Teardown]

Verify User Able to Add New Requisition Error
    [Arguments]    ${Testdata}
    ${r_id}    Get First Requisition Rid in Pending in Accesioning
    ${new.label.accesioning.get_sample-id_from_rid}    Update Dynamic Value    ${label.accesioning.get_sample-id_from_rid}    ${r_id}
    ${sample_id}    Get Element Attribute    ${new.label.accesioning.get_sample-id_from_rid}    title
    Log    Requisition is Selected
    Navigate to Requisition Hamburger Sub Menu Options    ${sample_id}    Add Requisition Errors    sampleid
    Log    "Add Requisition Errors" is Displayed & Navigated to Requisition Hamburger "Add Requisition Errors" Page
    Log    Select one Requisition Error and Click on Save.
    ${Requisition_Error_Name}    Add Requisition Error from Requisition Hamburger    ${Testdata}
    Verify Message    ${messages.success}    ${MEDIUM_WAIT}
    Log    "Success" Pop-up Message is Displayed
    Search For Details In Home Page    ${sample_id}    Sample ID
    Log    Navigated to Errors Page
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Errors
    Log    Navigated to Errors Page
    Verify Error Added in Details Errors Page    ${Requisition_Error_Name}
    Log    Verified the Error Reflected under Errors Tab in Requisition Detail.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application

Verify Print Labels in Accesioning
    [Arguments]    ${testdata}
    Select Multiple Requisitions in Accessioning in Pending    2
    ${patient_name}    Get Patient Name in Accesioning
    Navigate to Tool Bar Grid Buttons For PDF    ${testdata}[Tool_bar_grid_button]
    Select label Template and Click On Print    ${testdata}
    Log    Select Label Template and Print Page
    ${pdf_data}    Read Pdf Data
    Verify Pdf data    ${pdf_data}    ${patient_name}[0]
    Log    Verified Pdf data and Removed PDF File

Navigate to Reject Requisition Page In Samples Tab
    [Arguments]    ${testdata}
    ${new.button.accesioning.details.sub-menu}    Update Dynamic Value    ${button.accesioning.details.sub-menu}    ${testdata}[Details_Menu_buttons]
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[Details_Menu_buttons]
    Wait Until Time    2
    Click Element and Verify    ${new.button.accesioning.details.sub-menu}    ${new.label.accesioning.details.submenu}    Samples    ${MEDIUM_WAIT}
    Log    Click on Reject
    ${reject_label_button}    Update Dynamic Value    ${button.accesioning.details.inner_submenu}    ${testdata}[Details_inner_menu_buttons]
    Click On The Element    ${reject_label_button}    Reject_Label    ${MEDIUM_WAIT}

Reload and Clear Status FiIter
    Reload Page
    Clear Filter    Status

Select Requisition and Perform Back to Pending
    [Arguments]    ${testdata}
    Log    Select Filter Type using Accesioning Filter Type
    Select Filter Type in Accesioning    Status    ACCESSIONED
    Log    Selected Status Filter Type using Accesioning Filter Status
    ${RID}    Get First Requisition RID
    Log    Requisition is Selected
    Verify user is able to Reject Selected Requisition    ${RID}    ${testdata}
    Log    Reload And Clear Applied Status FIlter
    Reload and Clear Status FiIter
    Log    Remove Applied Filter
    Select Filter Type in Accesioning    Status    Rejected
    ${RID}    Get First Requisition RID
    Set Test Variable    ${RID}
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    Back to Pending
    Log    "Back to Pending" modal is displayed.

Input All Patient Details Fields In General Tab
    [Arguments]    ${testdata}
    ${element.accesioning.details.general.email_textbox}    Update Dynamic Value    ${element.accesioning.details.general}    email
    ${element.accesioning.details.general.gurantor_phone_number_textbox}    Update Dynamic Value    ${element.accesioning.details.general}    guarantor_phone
    ${element.accesioning.details.general.phone_number_textbox}    Update Dynamic Value    ${element.accesioning.details.general}    phone
    ${element.accesioning.details.general.guarantor_email_textbox}    Update Dynamic Value    ${element.accesioning.details.general}    guarantor_email
    Send Text To Textfield    ${element.accesioning.details.general.email_textbox}    Email_Textbox    ${MEDIUM_WAIT}    ${testdata}[email]
    Send Text To Textfield    ${element.accesioning.details.general.phone_number_textbox}    Phone Number Textbox    ${MEDIUM_WAIT}    ${testdata}[patient_phone_number]
    Send Text To Textfield    ${element.accesioning.details.general.guarantor_email_textbox}    Guarantor TextBox    ${MEDIUM_WAIT}    ${testdata}[guarantor_email]
    Send Text To Textfield    ${element.accesioning.details.general.gurantor_phone_number_textbox}    Guarantor Phone Number TextBox    ${MEDIUM_WAIT}    ${testdata}[guarantor_phone_number]
    Click On The Element    ${textbox.accesioning.details.general.gender}    Gender Textbox    ${MEDIUM_WAIT}
    Send Text To Textfield    ${textbox.accesioning.details.general.gender}    Gender Textbox    ${MEDIUM_WAIT}    ${testdata}[gender]
    Press Keys    None    RETURN
    Wait Until Time    3
    Javascript Click    ${textbox.accesioning.details.general.date_received}
    Click On The Element    ${button.accesioning.details.general.now}    Calendar Now    ${MEDIUM_WAIT}

Handle Optional Alert
    Run Keyword And Ignore Error    Alert Should Not Be Present    action=ACCEPT

Input Mandatory Fields In Edit Location Page
    [Arguments]    ${testdata}
    ${new.button.accessioning.details.errors.hamburger_options}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger_options}    ${RID}    ${testdata}[comment]
    ${button.accesioning.req-details.samples.hamburger.sub-menu.new_locator}    Update Dynamic Value    ${new.button.accessioning.details.errors.hamburger_options}    Edit Location
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${button.accesioning.req-details.samples.hamburger.sub-menu.new_locator}
    Click On The Element    ${textbox.accessioning.details.samples.haburger.edit_location.select_location}    select location textbox    ${MEDIUM_WAIT}    selenium
    ${new.label.accesioning.details.select_location.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[select_sample_location]
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${new.label.accesioning.details.select_location.submenu}
    Click On The Element    ${button.accessioning.details.samples.hamburger.edi_loc.save}    Save    ${MEDIUM_WAIT}

Select Filter Status For Comments in Errors Tab
    [Arguments]    ${testdata}
    ${new.button.accesioning.filter_type}    Update Dynamic Value    ${button.accesioning.filter_type}    Comments
    Click On The Element    ${new.button.accesioning.filter_type}    Comments    ${MEDIUM_WAIT}
    ${new.textbox.accesioning.details.filter}    Update Dynamic Value    ${textbox.accesioning.details.filter}    Comments
    Click On The Element    ${new.textbox.accesioning.details.filter}    Comments textbox    ${MEDIUM_WAIT}
    Input Text    ${new.textbox.accesioning.details.filter}    <p>${testdata}[comment]</p>
    Wait Until Time    ${MINI_WAIT}
    ${new.button.accesioning.apply_filter}    Update Dynamic Value    ${button.accesioning.apply_filter}    Comments
    Click On The Element    ${new.button.accesioning.apply_filter}    Filter    ${MEDIUM_WAIT}

Verify Delete Error In Details Page
    [Arguments]    ${testdata}    ${RID}
    ${new.button.accesioning.details.error.hamburger_for_delete_error}    Update Dynamic Values    ${button.accesioning.details.error.hamburger_for_delete_error}    ${RID}    ${testdata}[requisition_error_type]
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${new.button.accesioning.details.error.hamburger_for_delete_error}    Errors_Hamburger    ${LONG_WAIT}    selenium
    ${new.button.accesioning.details.errors.hamburger.submenu_for_delete}    Update Dynamic Values    ${button.accesioning.details.errors.hamburger.submenu_for_delete}    ${RID}    ${testdata}[requisition_error_type]
    ${new.button.accesioning.req-details.errors.hamburger.sub-menu.locator}    Update Dynamic Value    ${new.button.accesioning.details.errors.hamburger.submenu_for_delete}    Delete
    Wait Until Time    ${MINI_WAIT}
    click element    ${new.button.accesioning.req-details.errors.hamburger.sub-menu.locator}
    Perform Actions    No    ${MEDIUM_WAIT}
    ${new.button.accesioning.details.errors.error_name}    Update Dynamic Values    ${button.accesioning.details.errors.error_name}    ${RID}    ${testdata}[requisition_error_type]
    Page Should Contain Element    ${new.button.accesioning.details.errors.error_name}
    Log    Verified that Error is not Deleted
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${new.button.accesioning.details.error.hamburger_for_delete_error}    Errors_Hamburger    ${LONG_WAIT}    selenium
    Wait Until Time    ${MINI_WAIT}
    click element    ${new.button.accesioning.req-details.errors.hamburger.sub-menu.locator}
    Perform Actions    Yes    ${MEDIUM_WAIT}
    Wait Until Page Contains Element    ${message.details.errors.delete_error.succesfully}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Log    Verified that Error is Deleted

Get First Requisition Rid in Pending in Accesioning
    Wait For The Element to be Visible    ${label.accesioning.first_requisition_pending_without_error}    first requisition    ${SHORT_WAIT}
    ${RID}    Get Element Attribute    ${label.accesioning.first_requisition_pending_without_error}    data-id
    Log    "${RID}" is Received
    Set Test Variable    ${RID}
    [Return]    ${RID}

Get First Requisition Rid in All in Accesioning
    Wait For The Element to be Visible    ${label.accesioning.first_requisition_all_without_error}    first requisition    ${SHORT_WAIT}
    ${RID}    Get Element Attribute    ${label.accesioning.first_requisition_all_without_error}    data-id
    Log    "${RID}" is Received
    Set Test Variable    ${RID}

Select Multiple Requisitions in All
    [Arguments]    ${Count_Value}
    Log    Select Multiple Requisitions Using Rid
    @{home_page_requisition_id}    Create List
    @{updated_sample_id}    Create List
    FOR    ${key}    IN RANGE    0    ${Count_Value}
        ${key}    Evaluate    ${key}+1
        ${updated_key}    Convert To String    ${key}
        ${new.label.accesioning.all.rid}    Update Dynamic Value    ${label.accesioning.all.rid}    ${updated_key}
        ${RID}    Get Element Attribute    ${new.label.accesioning.all.rid}    title
        Log    "${RID}" is Received
        ${RID_count}    Get length    ${RID}
        Run Keyword If    ${RID_count}==6    Append To List    ${home_page_requisition_id}    ${RID}
        Log    ${home_page_requisition_id}
        @{Requisition_Id}    Split String    ${RID}    ,
        ${new.checkbox.accesioning.select_requisitions}    Update Dynamic Value    ${checkbox.accesioning.select_requisitions}    ${Requisition_Id}[0]
        Click On The Element    ${new.checkbox.accesioning.select_requisitions}    Requisition checkbox    ${SHORT_WAIT}    seleniumclick
        Take Screenshot
    END
    ${requisition_id_count}    Get Length    ${home_page_requisition_id}
    Set Test Variable    ${home_page_requisition_id}    ${home_page_requisition_id}
    Set Test Variable    ${requisition_id_count}    ${requisition_id_count}

Add Comment in Samples Page
    [Arguments]    ${testdata}    ${RID}
    ${new.button.accessioning.details.errors.hamburger}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger}    ${RID}    ${testdata}[comment]
    Click On The Element    ${new.button.accessioning.details.errors.hamburger}    Samples_Hamburger    ${LONG_WAIT}    selenium
    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Update Dynamic Values    ${button.accessioning.details.errors.hamburger_options}    ${RID}    ${testdata}[comment]
    ${button.accesioning.req-details.created_sample_hamburger.comments}    Update Dynamic Value    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Comments
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.accesioning.req-details.created_sample_hamburger.comments}    Comments    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Select Frame And Input Req Comments    ${testdata}[comment]    ${frame.accesioning.req-hamburger.reject}
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${button.accessioning.details.samples.hamburger.comments.add}    Add    ${LONG_WAIT}

Verify Un Reject In All Tab
    [Arguments]    ${testdata}
    Select Filter Type in Accesioning    Status    ACCESSIONED
    ${RID}    Get First Requisition RID
    Log    Select multiple requisitions and Click on Reject Comments from hamburger menu.
    Navigate to Requisition Hamburger Sub Menu Options    ${RID}    ${testdata}[Hamburger_submenu_option]
    Log    Navigate to Reject Comments Page
    Log    Select Predefined Comment<<Enter the Comments and Click on Save.
    Select Predefined Comments in Reject Comments Page    ${testdata}
    Log    Selected Predefined Cmments
    Enter Requirement Comments    ${testdata}[Predefined_comment]
    Log    Save sample comments
    Save Activity    ${button.results.save_sample_comment}    ${testdata}[Message]    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}
    Navigate to Tab    All
    Clear Filter    Status
    Select Filter Type in Accesioning    Status    Rejected
    Log    Requisition-Record of "Status" with Filter-"Rejected" is Selected
    Log    Select Multiple Requisitions and Click on "Un-Reject" from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    "${testdata}[requisition_checkbox_count]" Requisitions is Selected
    Navigate to Tool Bar Grid Buttons    Unreject
    Log    "Unreject Requisition" Modal is displayed.
    Log    Click on Start Processing. & Click on Close Modal and refresh Grid.
    Navigate to Start Process and Close Modal Grid
    Log    Requisition Processed completed successfully.
    Search for Multiple Sample-id in Search-Bar & Verify    ${testdata}    ${requisition_id_count}    ${home_page_requisition_id}

Get First Requisition Id Without ROB LAB Patient Name
    Wait Until Element Is Visible    ${label.requisitions_without_error}    ${MEDIUM_WAIT}
    ${count}    Get Element Count    ${label.requisitions_without_error}
    FOR    ${KEY}    IN RANGE    ${count}
        ${updated_key}    Evaluate    ${KEY}+1
        ${RID}    Get Element Attribute    (${label.requisitions_without_error})[${updated_key}]    data-id
        ${new.button.accesioning.button_for_getting_patient_name}    Update Dynamic Value    ${button.accesioning.button_for_getting_patient_name}    ${RID}
        ${patientname}    Get Element Attribute    ${new.button.accesioning.button_for_getting_patient_name}    title
        ${RID}    Set Variable If    '${patientname}'!='ROB LAB'    ${RID}
        Run Keyword If    '${patientname}'!='ROB LAB'    Exit For Loop
    END
    Set Test Variable    ${RID}

Get R-id
    [Arguments]    ${sample_id}
    ${new.accesioning.label_for_getting_r_id_from_sample_id}    Update Dynamic Value    ${accesioning.label_for_getting_r_id_from_sample_id}    ${sample_id}
    ${Rid}    Get Element Attribute    ${new.accesioning.label_for_getting_r_id_from_sample_id}    data-id
    [Return]    ${Rid}

Enter Label Number and Click on Set All
    [Arguments]    ${test_data}
    Send Text To Textfield    ${textbox.common.print_label.number_of_labels}    Number of sample labels textbox    ${MEDIUM_WAIT}    ${test_data}[Label_Number]
    Click On The Element    ${button.common.print_labels.set_all}    Set to all button    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}