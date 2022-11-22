*** Settings ***
Resource          ../Global/super.robot

*** Test Cases ***
BR_001
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_007    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch Health TrackRX URL
    Launch Browser and Navigate to URL    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    ${BROWSER_NAME} browser is launched with ${URL} URL
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Move to Accessioning.Click on Accessioning and Click on Pending.
    Refuse Alert for Notifications of News
    Navigate To Main Menu    Results Review
    Select Required Arrow    xpath://th[contains(@id,'crud_grid_sort_id')]//i[contains(@class,'new-grid-column sort-arrow-')]    arrow-down
    ${R_id_list}    Create List
    FOR    ${key}    IN RANGE    5
        ${updated_key}    Evaluate    ${key}+1
        ${RID}    Get Element Attribute    //tbody//tr[${updated_key}]    data-id
        Append To List    ${R_id_list}    ${RID}
    END
    Wait Until Element Is Visible    ${button.result_review.create_batch}    ${MEDIUM_WAIT}
    Click Element    ${button.result_review.create_batch}
    ${Name_Textbox_Create_Batch}    Update Dynamic Value    ${textbox.result_review.create_batch}    Name
    ${Equipment_Textbox_Create_Batch}    Update Dynamic Value    ${textbox.result_review.create_batch}    Equipment
    ${Sample#_Textbox_Create_Batch}    Update Dynamic Value    ${textbox.result_review.create_batch}    Sample #
    ${Thermo_12k_Dropdown_Option_Create_Batch}    Update Dynamic Value    ${textbox.dropdown.result_review.create_batch}    Thermo Fisher Quant Studio 12K Flex
    ${Next_Button_Create_Batch}    Update Dynamic Value    ${textbox.dropdown.result_review.create_batch}    Next
    ${Filter_Button_Create_Batch}    Update Dynamic Value    ${textbox.dropdown.result_review.create_batch}    Filter
    ${Save_Button_Create_Batch}    Update Dynamic Value    ${textbox.dropdown.result_review.create_batch}    Save
    ${Start_Processing_Button_Create_Batch}    Update Dynamic Value    ${textbox.dropdown.result_review.create_batch}    START PROCESSING
    ${Close_Modal_Button_Create_Batch}    Update Dynamic Value    ${textbox.dropdown.result_review.create_batch}    Close Modal and Refresh Grid
    Wait For The Element to be Visible    ${Name_Textbox_Create_Batch}    ${MEDIUM_WAIT}    Name textbox
    Input Text    ${Name_Textbox_Create_Batch}    Demo_Test_01
    Input Text    ${Equipment_Textbox_Create_Batch}    Thermo Fisher Quant Studio 12K Flex
    Click On The Element    ${Thermo_12k_Dropdown_Option_Create_Batch}    Thermo 12 k Dropwon Option    ${SHORT_WAIT}
    Click On The Element    ${Next_Button_Create_Batch}    Next button    ${SHORT_WAIT}
    Wait Until Element Is Visible    ${Sample#_Textbox_Create_Batch}    ${MEDIUM_WAIT}
    FOR    ${key}    IN RANGE    5
        Input Text    ${Sample#_Textbox_Create_Batch}    ${R_id_list}[${key}]
        Click On The Element    ${Filter_Button_Create_Batch}    Filter Button    ${SHORT_WAIT}
        ${status}    Verify Text Message    Sample not added to the batch!    ${MEDIUM_WAIT}
        Exit For Loop If    '${status}'=='False'
    END
    Click On The Element    ${checkbox.result_review.create_batch.select_all_checkbox}    Select All Checkbox    ${SHORT_WAIT}
    Click On The Element    ${Save_Button_Create_Batch}    Save Button    ${SHORT_WAIT}
    Click On The Element    ${Start_Processing_Button_Create_Batch}    Start Processing    ${MEDIUM_WAIT}
    Click On The Element    ${Close_Modal_Button_Create_Batch}    Close Modal And Refresh    ${MEDIUM_WAIT}
    ${details_button}    Update Dynamic Value    ${button.accesioning.details_buttonusing_sampe_id}    ${sample_id}[${key}]
    Wait Until Element Is Visible    ${details_button}    ${MEDIUM_WAIT}

BR_005
    Login To Application    prakash.kamma    HTRXqz@123
    popup
    Wait Until Element Is Visible    //div[@class='menu-title' and text() ='Results Review']    ${MEDIUM_WAIT}
    Click Element    //div[@class='menu-title' and text() ='Results Review']
    Comment    Wait Until Element Is Visible    //div[@class='lims-dropdown-parent noSelect']//input[@class='element-input-label done-blue parsed-init']    ${MEDIUM_WAIT}
    Sleep    5
    Comment    Click Element    //div[@class='input-cell expanded']//div//input[@class='element-input-label done-blue parsed-init']
    Javascript Click    xpath://input[contains(@class,'element-input-label done-blue')]
    sleep    3
    Wait Until Element Is Visible    //input[@data-shortname='batch_id']//parent::div//input[contains(@class,'element-input-label done-blue')]    ${MEDIUM_WAIT}
    Click Element    //input[@data-shortname='batch_id']//parent::div//input[contains(@class,'element-input-label done-blue')]
    Sleep    3
    input text    //input[@data-shortname='batch_id']//parent::div//input[contains(@class,'element-input-label done-blue')]    Demo_Test_02
    Wait Until Element Is Visible    //div[text()='2022-08-25 03:59 - Demo_Test_02 (Thermo Fisher Quant Studio 12K Flex)']    ${MEDIUM_WAIT}
    Click Element    //div[text()='2022-08-25 03:59 - Demo_Test_02 (Thermo Fisher Quant Studio 12K Flex)']
    Wait Until Element Is Visible    //div[@title='Edit Batch']    ${MEDIUM_WAIT}
    Click Element    //div[@title='Edit Batch']
    Wait Until Element Is Visible    //div[@title='Rename batch']    ${MEDIUM_WAIT}
    Click Element    //div[@title='Rename batch']
    Wait Until Element Is Visible    //input[@data-shortname='batch_name']    ${MEDIUM_WAIT}
    Click Element    //input[@data-shortname='batch_name']
    input text    //input[@data-shortname='batch_name']    Demo_Test_00
    Wait Until Element Is Visible    //div[text()='Save']    ${MEDIUM_WAIT}
    Click Element    //div[text()='Save']

BR_006
    Login To Application    prakash.kamma    HTRXqz@123
    popup
    Wait Until Element Is Visible    //div[@class='menu-title' and text() ='Results Review']    ${MEDIUM_WAIT}
    Click Element    //div[@class='menu-title' and text() ='Results Review']
    Sleep    5
    Javascript Click    xpath://input[contains(@class,'element-input-label done-blue')]
    sleep    3
    Wait Until Element Is Visible    //input[@data-shortname='batch_id']//parent::div//input[contains(@class,'element-input-label done-blue')]    ${MEDIUM_WAIT}
    Click Element    //input[@data-shortname='batch_id']//parent::div//input[contains(@class,'element-input-label done-blue')]
    Sleep    3
    input text    //input[@data-shortname='batch_id']//parent::div//input[contains(@class,'element-input-label done-blue')]    Delete_QZ
    Wait Until Element Is Visible    //div[text()='2022-08-30 02:08 - Delete_QZ (Thermo Fisher Quant Studio 12K Flex)']    ${MEDIUM_WAIT}
    Click Element    //div[text()='2022-08-30 02:08 - Delete_QZ (Thermo Fisher Quant Studio 12K Flex)']
    Wait Until Element Is Visible    //div[@title='Edit Batch']    ${MEDIUM_WAIT}
    Click Element    //div[@title='Edit Batch']
    Wait Until Element Is Visible    //th[@id='limsabc_qa_lifecycle_results_review_editBatch_view_crud_grid_sort_selection']//span[@class='checkbox']    ${MEDIUM_WAIT}
    Sleep    3
    Click Element    //th[@id='limsabc_qa_lifecycle_results_review_editBatch_view_crud_grid_sort_selection']//span[@class='checkbox']
    Wait Until Element Is Visible    //div[text()='Delete']    ${MEDIUM_WAIT}
    Sleep    3
    Javascript Click    xpath://div[text()='Delete']
    Wait Until Element Is Visible    //div[@class='button-text' and text()='Yes']    ${MEDIUM_WAIT}
    Click Element    //div[@class='button-text' and text()='Yes']
