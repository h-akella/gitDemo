*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Launch Browser and Navigate to URL
    [Arguments]    ${browser_name}    ${url}
    Run Keyword If    '${browser_name}'=='headlesschrome'    Open Chrome Browser    ${url}    ${headless}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Open Chrome Browser    ${url}    ${headless}
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Open Browser    ${url}    Firefox
    Maximize Browser Window

Read TestData From Excel
    [Arguments]    ${testcaseid}    ${sheet_name}
    [Documentation]    Read TestData from excel file for required data.
    ...
    ...    Example:
    ...    Read TestData From Excel TC_01 SheetName
    ${test_data}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${TESTDATA_FOLDER}/QA_TestData.xls    ${testcaseid}    ${sheet_name}
    [Return]    ${test_data}

Take Screenshot
    Capture Page Screenshot

Set Browser Position
    [Arguments]    ${browser_name}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Set Window Position    0    5
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Set Window Position    1005    6
    Set Window Size    959    1047

Create Screenshot Directory
    Run Keyword And Ignore Error    Create Directory    ${EXECDIR}/Screenshots
    SeleniumLibrary.Set Screenshot Directory    ${EXECDIR}/Screenshots

Login To Application
    [Arguments]    ${user_name}    ${password}
    Log    Login to application with valid credentials
    Log    Login page is displayed
    Send Text To Textfield    ${login.textbox.username}    Username    ${MEDIUM_WAIT}    ${user_name}
    Log    ${user_name} is entered in ${login.textbox.username} textbox
    Send Text To Textfield    ${login.textbox.password}    Password    ${MEDIUM_WAIT}    ${password}
    Log    ${password} is entered in ${login.textbox.password} textbox
    Click on Sign In Button
    Wait For The Element to be Visible    ${homescreen.label.homepage.client_portal_menu}    Home Screen    ${LONG_WAIT}
    Screenshot.Take Screenshot

Wait Until Element Clickable And Click
    [Arguments]    ${locator}    ${time_interval}=2s
    Wait Until Keyword Succeeds    14s    ${time_interval}    Click On The Element    ${locator}

Fail And Take Screenshot
    [Arguments]    ${error_message}
    Run Keyword And Continue On Failure    Fail    ${error_message}
    Take Screenshot

Create Directories
    Create Screenshot Directory

Take Screenshot And Close Browsers
    common.Take Screenshot
    Close All Browsers

Scroll And Click
    [Arguments]    ${locator}    ${button_name}    ${WAIT_TIME}
    Scroll To Element    ${locator}
    Click On The Element    ${locator}    ${button_name}    ${WAIT_TIME}    seleniumclick

Navigate To Main Menu
    [Arguments]    ${menu_text}
    ${menu}    Update Dynamic Value    ${button.homepage.select_menu}    ${menu_text}
    Log    Navigate to ${menu} page
    Wait Until Time    2
    Click On The Element    ${menu}    ${menu}    ${MEDIUM_WAIT}
    common.Take Screenshot

Search For Details In Home Page
    [Arguments]    ${sample_id}    ${pending_searchcategory_checkbox}
    Log    Search For Details of Requisition in Home Page
    Send Text To Textfield    ${textbox.homepage.common_search}    search bar    ${LONG_WAIT}    ${sample_id}
    Log    Click on sample id checkbox
    ${new.checkbox.accesioning.home_page.search_category}    Update Dynamic Value    ${checkbox.accesioning.home_page.search_category}    ${pending_searchcategory_checkbox}
    ${class}    Get Element Attribute    ${new.checkbox.accesioning.home_page.search_category}    class
    ${STAT}    Run Keyword And Return Status    Should Be Equal    ${class}    radio
    Run Keyword If    '$(class)'!='radio checked'    Click On The Element    ${new.checkbox.accesioning.home_page.search_category}    search button    ${LONG_WAIT}    seleniumclick
    Log    Click on Search button
    Click On The Element    ${button.homepage.common_search}    search sample id    ${LONG_WAIT}
    Wait For The Element to be Visible    ${spinner.locator}    spinner element    ${MEDIUM_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}

Get 2 Days Previous Date
    ${date}    Get Current Date
    ${date}    Subtract Time From Date    ${date}    2days    result_format=%m/%d/%Y
    [Return]    ${date}

Update Dynamic Value
    [Arguments]    ${locator}    ${value}
    ${xpath}    Replace String    ${locator}    replaceText    ${value}
    [Return]    ${xpath}

Logout From Healthtrack Application
    Comment    Log out from healthtrack application
    Click On The Element    ${button.homepage.log_out}    Log Out    ${LONG_WAIT}
    Wait Until Element Is Not Visible    ${button.homepage.log_out}    ${LONG_WAIT}    Log out button is not visible after waiting ${LONG_WAIT} seconds

Refuse Alert for Notifications of News
    ${STATUS}    Run Keyword And Return Status    Wait Until Element Is Visible    ${button.homepage.refusealert}    ${SHORT_WAIT}    Refuse Alert
    Run Keyword If    '${STATUS}'=='True'    Click On Refuse Alert Button

Navigate To Pending Search Page
    Click On The Element    ${button.accesioning.pending}    Pending    ${SHORT_WAIT}

Launch Browser with Chrome options for Download
    [Arguments]    ${URL}    ${BROWSER_NAME}
    Comment    Launch browser to healthtrackRX application url
    ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=${PDF_DOWNLOAD_FOLDER}    enabled=False    name=Chrome PDF Viewer    download.extensions_to_open=applications/pdf    plugins.always_open_pdf_externally=${TRUE}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    ${BROWSER_NAME}    chrome_options=${chromeOptions}
    Go To    ${URL}
    Maximize Browser Window

Read Data From Pdf
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Pdf    ${file_path}[0]
    Log    ${pdf_data}
    ${get_data}    FilterNumber status    ${pdf_data}
    Log    ${get_data}[0]
    ${sample_id}    Set Variable    ${get_data}[0]
    Set Global Variable    ${sample_id}
    Wait Until Time    ${SHORT_WAIT}
    [Return]    ${file_path}

Verify User is able to Search and View Sample id in Result Review Page
    Log    Test Step 4: Clicked on pending results button
    Screenshot.Take Screenshot
    Comment    Verify user is able to search sample id using search text bar
    Search Id in Results review searchbar
    Log    Enter Valid ${sample_id} Sample ID and click on search button.
    Screenshot.Take Screenshot
    Comment    Verify user is able to click on check box{Sample-id} and click on Batch Review from Tool bar grid.
    Navigate to Batch Review Page with Selected Sample-id
    Log    Clicked on ${sample_id} check box and click on Batch Review from Tool bar grid.

Read Environment Configurations
    [Arguments]    ${rowname}    ${sheet_name}
    ${test_data}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${TESTDATA_FOLDER}/QA_TestData.xls    ${rowname}    ${sheet_name}

Click Element and Verify
    [Arguments]    ${locator}    ${expected_validation}    ${button_name}    ${WAIT_TIME}
    Click On The Element    ${locator}    ${button_name}    ${WAIT_TIME}    selenium
    Wait For The Element to be Visible    ${expected_validation}    ${expected_validation}    ${WAIT_TIME}
    Log    ${button_name} is clicked succesfully
    Screenshot.Take Screenshot

Click On CheckBox And Verify
    [Arguments]    ${locator}    ${attribute_locator}    ${attribute_name}    ${WAIT_TIME}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${WAIT_TIME}    checkbox is not visible after waiting ${SHORT_WAIT} seconds
    Javascript Click    ${locator}
    Log    Succesfully clicked on ${locator}
    Wait Until Time    4
    ${attribute}    Get Element Attribute    ${attribute_locator}    ${attribute_name}
    ${status}    Run Keyword And Return Status    Should Contain    ${attribute}    checked
    Run Keyword If    ${status}==False    Should Contain    ${attribute}    selected
    Log    Succesfully Vaidated that checkbox is clicked

Send Text And Select Dropdown
    [Arguments]    ${locator}    ${input_text}    ${expected_dropdown}    ${button_name}    ${WAIT_TIME}
    Click On The Element    ${locator}    ${button_name}    ${WAIT_TIME}
    SeleniumLibrary.Input Text    ${locator}    ${input_text}
    Log    Entered ${input_text} into ${button_name} field
    Wait Until Element Is Present    ${expected_dropdown}
    Javascript Click    ${expected_dropdown}

Save Activity
    [Arguments]    ${locator}    ${expected_message}    ${WAIT_TIME}
    Click On The Element    ${locator}    Save    ${WAIT_TIME}
    Wait Until Time    4
    Page Should Contain    ${expected_message}
    Screenshot.Take Screenshot
    Log    Clicked and Validated the ${expected_message} succesfully

Export Data And Verify
    [Arguments]    ${export_locator}    ${file_type}
    Javascript Click    ${export_locator}
    Wait Until Time    5
    ${actual_data}    read data
    should contain    ${expected_data}    ${actual_data}

Click And Select Dropdown
    [Arguments]    ${locator}    ${expected_dropdown}    ${WAIT_TIME}
    [Documentation]    This keyword is used to click on textbox and select dropdown
    Click On The Element    ${locator}    dropdown_locator    ${WAIT_TIME}
    Click On The Element    ${expected_dropdown}    ${expected_dropdown}_option    ${WAIT_TIME}

Select Dropdown Value
    [Arguments]    ${locator}    ${dropdown_locator}    ${dropdown_value}    ${WAIT_TIME}
    ${new.dropdown_locator}    Update Dynamic Value    ${dropdown_locator}    ${dropdown_value}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${WAIT_TIME}    ${locator} is not visible after waiting ${WAIT_TIME} seconds
    Log    ${dropdown_value} is visible after waiting ${WAIT_TIME} seconds
    Javascript Click    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${new.dropdown_locator}    ${WAIT_TIME}    ${locator} is not visible after waiting ${WAIT_TIME} seconds
    Log    ${dropdown_value} dropdown is visible after waiting ${WAIT_TIME} seconds
    Javascript Click    ${new.dropdown_locator}

Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page
    [Arguments]    ${menu_page_name}    ${WAIT_TIME}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.homepage.quick_menu_hamburger}    ${WAIT_TIME}    Quick Menu Hamburger button is not displayed after waiting seconds
    Javascript Click    ${button.homepage.quick_menu_hamburger}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.homepage.quick_menu_search}    ${WAIT_TIME}    Qucik Menu Search Box is not displayed after waiting seconds
    SeleniumLibrary.Input Text    ${textbox.homepage.quick_menu_search}    ${menu_page_name}
    Javascript Click    ${button.homepage.quick_menu_search}
    ${splited_data}    Split String    ${menu_page_name}
    ${count}    get length    ${splited_data}
    ${updated_xpath}    Run Keyword If    ${count}==2    Update Dynamic Values    ${common.patoient_manager}    ${splited_data}[0]    ${splited_data}[1]
    ...    ELSE    Update Dynamic Value    ${checkbox.create_new_requisition.ics_code}    ${splited_data}[0]
    Wait Until Element Is Visible    ${updated_xpath}    ${SHORT_WAIT}
    Click Element    ${updated_xpath}

Update Dynamic Values
    [Arguments]    ${locator}    ${value1}    ${value2}
    ${xpath}    Replace String    ${locator}    replaceText1    ${value1}
    ${updated_xpath}    Replace String    ${xpath}    replaceText2    ${value2}
    [Return]    ${updated_xpath}

Verify Sent Sample for Testing is Displayed in Pending Results Page
    [Arguments]    ${element_1_checkbox}
    Wait For The Element to be Visible    ${element_1_checkbox}    ${LONG_WAIT}    Requisition Checkbox

Verify Message
    [Arguments]    ${Message_locator}    ${WAIT_TIME}
    [Documentation]    This Keyword is Used to Verify The Message
    Wait Until Page Contains Element    ${Message_locator}    ${WAIT_TIME}
    Screenshot.Take Screenshot

Read Pdf Data
    [Timeout]
    Verify Expected File is Downloaded into Local
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    Set Test Variable    ${file_path}
    ${count}    Get Length    ${file_path}
    FOR    ${key}    IN RANGE    ${count}
        ${path}    ${extension}    Split Extension    ${file_path}[${key}]
        ${status}    Run Keyword And Return Status    Should Contain    ${extension}    pdf
        ${path}    Set Variable If    '${status}'=='True'    ${file_path}[${key}]
        Exit For Loop If    '${status}'=='True'
    END
    ${pdf_data}    Read Pdf    ${path}
    [Return]    ${pdf_data}

Verify Pdf Data and Remove Pdf File
    [Arguments]    ${pdf_data}    ${application_data_to_verify}    ${file_path}
    ${status}    Run Keyword And Return Status    Should Contain    ${pdf_data}    ${application_data_to_verify}
    ${count}    Get Length    ${file_path}
    FOR    ${key}    IN RANGE    ${count}
        Remove File    ${file_path}[${key}]
    END
    Run Keyword If    '${status}'=='False'    Fail

Get Patient Name in Accesioning
    ${new.button.accesioning.locator_for_getting_patinet.name}    Update Dynamic Value    ${button.accesioning.locator_for_getting_patinet.name}    ${home_page_requisition_id}[0]
    ${patient_name}    Get Text    ${new.button.accesioning.locator_for_getting_patinet.name}
    ${patient_name}    Split String    ${patient_name}    ${SPACE}
    [Return]    ${patient_name}

Click on Save in Reject Requisition Page and Verify Error Message
    [Arguments]    ${testdata}
    Log    Select First Element Details
    Click on First Element Details Button
    Log    Go to Reject Requisition Page
    Navigate to Reject Requisition Page In Samples Tab    ${testdata}
    Click On The Element    ${button.accesioning.details.samples.reject.save}    SAVE    ${MEDIUM_WAIT}    selenium
    ${new.messages.common}    Update Dynamic Value    ${messages.common}    Reason Rejection is a mandatory field
    Log    Verify error "Reason Rejection is a mandatory field"
    Wait For The Element to be Visible    ${new.messages.common}    Message Reason Rejection is a mandatory field    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Switch New Window And Verify
    Wait Until Time    3
    ${windowslist}    Get Window Handles
    ${defaultwindow}    get_current_window
    Should Be Equal    ${defaultwindow}    ${windows_list}[0]
    Switch Window    ${windows_list}[1]
    ${newwindow}    get_current_window
    Should Be Equal    ${newwindow}    ${windows_list}[1]

Switch to Default Window and Verify
    ${windows_list}    Get Window Handles
    ${new_window}    get_current_window
    Should Be Equal    ${new_window}    ${windows_list}[1]
    Switch Window    ${windows_list}[0]
    ${default_window}    get_current_window
    Should Be Equal    ${default_window}    ${windows_list}[0]

Clear Search and Input Text
    [Arguments]    ${Testdata}    ${Search-bar_Locator}    ${Search_Locator}
    [Documentation]    This Keyword is Used to Clear Textdata in Search-bar
    Clear Element Text    ${Search-bar_Locator}
    Input Text    ${Search-bar_Locator}    ${Testdata}[value]
    Javascript Click    ${Search_Locator}

Click on Detail Button with Sample-id
    [Documentation]    Opens the Details page of Expected Sample id Requisition
    ${new.label.result_review.sample_id}    Update Dynamic Value    ${label.result_review.sample_id}    1
    ${sample_id}    Get Element Attribute    ${new.label.result_review.sample_id}    title
    Set Test Variable    ${sample_id}
    ${new.button.accesioning.details_buttonusing_sampe_id}    Update Dynamic Value    ${button.accesioning.details_buttonusing_sampe_id}    ${sample_id}
    Javascript Click    ${new.button.accesioning.details_buttonusing_sampe_id}

Perform Actions
    [Arguments]    ${button_name}    ${WAIT_TIME}
    [Documentation]    This Keyword is used to Click on Save,Order,Add,Delete,...etc Buttons \
    ${new.button.actions}    Update Dynamic Value    ${button.actions}    ${button_name}
    Click On The Element    ${new.button.actions}    ${button_name}    ${WAIT_TIME}    selenium
    Screenshot.Take Screenshot
    Log    "${button_name}" button is Clicked

Get Element Text And Verify
    [Arguments]    ${locator}    ${expected_text}    ${attribute_name}
    [Documentation]    This keyword is used to get element text and verify
    [Timeout]
    ${actual_text}    Get Element Attribute    ${locator}    ${attribute_name}
    Should Contain    ${actual_text}    ${expected_text}
    Log    Succesfully Compared ${actual_text} with ${expected_text}

Read Data from Coloured PDF
    sleep    3
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Coloured PDF    ${file_path}[0]
    [Return]    ${pdf_data}    ${file_path}

Verify Text Message
    [Arguments]    ${Message}    ${WAIT_TIME}
    [Documentation]    This Keyword is Used to Verify The Text Message by passing the Particular Message-name as Argument.
    Wait Until Page Contains    ${Message}    ${WAIT_TIME}
    Log    "${Message}" is Displayed after waiting ${WAIT_TIME} seconds
    Screenshot.Take Screenshot

Navigate to Requisition Hamburger Sub Menu Options
    [Arguments]    ${sample_id_value}    ${Hamburger_Menu}    ${input_data}=rid    ${page_title}=None
    [Documentation]    This Keyword is used to Navigate to Hamburger Sub-menu by Passing the Selected Requisition Sample-Id \ and Menu Option Name
    ${new.button.requisition-hamburger}    Run Keyword If    '${input_data}'=='rid'    Update Dynamic Value    ${button.client_portal.hamburger_menu_using_rid}    ${sample_id_value}
    ...    ELSE    Update Dynamic Value    ${button.req-hamburger}    ${sample_id_value}
    Click On The Element    ${new.button.requisition-hamburger}    Hamburger_button    ${MEDIUM_WAIT}    selenium
    ${new.button.client_portal.req-hamburger-options}    Run Keyword If    '${input_data}'=='rid'    common.Update Dynamic Values    ${button.client_portal.req-hamburger-options}    ${sample_id_value}    ${Hamburger_Menu}
    ...    ELSE    common.Update Dynamic Values    ${button.req-hamburger-options}    ${sample_id_value}    ${Hamburger_Menu}
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${new.button.client_portal.req-hamburger-options}    ${Hamburger_Menu}    ${MEDIUM_WAIT}    selenium
    Run Keyword If    '${page_title}'!='None'    Page Should Contain    ${page_title}
    Screenshot.Take Screenshot

Navigate to Tool Bar Grid Buttons
    [Arguments]    ${button_name}
    ${new.button.accesioning.tool-bar-grid-buttons}    Update Dynamic Value    ${button.accesioning.tool-bar-grid-buttons}    ${button_name}
    Click On The Element    ${new.button.accesioning.tool-bar-grid-buttons}    ${button_name}    ${SHORT_WAIT}
    Log    Clicked on the tool bar grid button-"${button_name}"

Navigate to Module And Tab
    [Arguments]    ${menu_name}    ${sub-menu_name}
    ${menu}    Update Dynamic Value    ${button.homepage.select_menu}    ${menu_name}
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${menu}    ${menu_name}    ${LONG_WAIT}
    ${new.button.homepage.sub_menu}    Update Dynamic Value    ${button.homepage.sub_menu}    ${sub-menu_name}
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${new.button.homepage.sub_menu}    ${sub-menu_name}    ${LONG_WAIT}

Submit Page And Verify Text Message
    [Arguments]    ${submit_locator}    ${expected_message}    ${wait_time}
    ${new.button.actions}    Update Dynamic Value    ${button.actions}    ${submit_locator}
    Click On The Element    ${new.button.actions}    SAVE    ${SHORT_WAIT}    selenium
    Page Should Contain    ${expected_message}

Navigate to Details with Sub-Menu Button Page
    [Arguments]    ${Sample_Id}    ${Sub-Menu_Name}
    [Documentation]    This Keyword Used to Navigate to Details Sub-Category Page
    Navigate to Details button    ${Sample_Id}
    ${new.button.accesioning.details.submenu}    Update Dynamic Values    ${button.accesioning.details.submenu}    ${Sample_Id}    ${Sub-Menu_Name}
    Wait Until Time    ${MINI_WAIT}
    Run Keyword If    '${Sub-Menu_Name}'=='General'    Scroll Element Into View    ${textbox.accesioning.details.ssn}
    Click On The Element    ${new.button.accesioning.details.submenu}    "${Sample_Id}" details_submenu-"${Sub-Menu_Name}"    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${spinner.locator}

Search Requisition To Apply Filter Using Patient Name
    ${windows}    Get Window Handles
    Switch Window    ${windows}[0]
    Wait Until Time    ${MINI_WAIT}
    Wait For The Element To Be Clickable    ${button.homepage.patient_name.search_filter_button}    filter button    ${SHORT_WAIT}
    Click On The Element    ${button.homepage.patient_name.search_filter_button}    search_filter    ${SHORT_WAIT}
    Wait Until Time    ${MINI_WAIT}
    Clear Element Text    ${textbox.requisition_filter.patient_name.search_box}
    Input Text    ${textbox.requisition_filter.patient_name.search_box}    ${patient_name}[0] ${patient_name}[1]
    Wait Until Time    ${MINI_WAIT}
    Click On The Element    ${search_filter_using_patient_name}    search    ${MEDIUM_WAIT}    selenium
    Wait Until Time    ${MINI_WAIT}
    Wait For Spinner To Disappear    ${homepage.spinner}
    Click on First Element Details Button

Navigate To Attachments to Verify Delete Attachment Functionality
    Click On The Element    ${button.common.accesioning_or_attachments}    attachment    ${SHORT_WAIT}
    Verify Delete Attachment Functionality    requisition.pdf

Navigate to Tab
    [Arguments]    ${sub-menu}
    ${button.homepage.sub_menu.new}    Update Dynamic Value    ${button.homepage.sub_menu}    ${sub-menu}
    Click On The Element    ${button.homepage.sub_menu.new}    ${sub-menu}    ${SHORT_WAIT}

Click on Home-Page Requisitions Button
    [Arguments]    ${home_page_requisition_button}    ${sample_id}
    Wait Until Time    ${MINI_WAIT}
    ${new.home_page_requisition_button}    Update Dynamic Value    ${home_page_requisition_button}    ${sample_id}
    Javascript Click    ${new.home_page_requisition_button}
    Wait For Spinner To Disappear    ${spinner.locator}

Get First Requisition (Sample-Id,RID)
    [Arguments]    ${get_id-value_locator}
    Wait Till Element Is Displayed    ${get_id-value_locator}    ${MEDIUM_WAIT}
    ${sample_id}    Get Element Attribute    ${get_id-value_locator}    title
    Log    "${sample_id}" is Received

Click On The Element
    [Arguments]    ${locator}    ${element_name}    ${wait_time}    ${click}=jsclick
    [Documentation]    This keyword used to wait for the element and it will perform a Click.
    Wait For The Element to be Visible    ${locator}    ${element_name}    ${wait_time}
    Wait For The Element To Be Enabled    ${locator}    ${element_name}    ${wait_time}
    Wait For The Element To Be Clickable    ${locator}    ${element_name}    ${wait_time}
    Run Keyword If    '${click}'=='jsclick'    Javascript Click    ${locator}
    ...    ELSE    Click Element    ${locator}
    Log    ${element_name} element is clicked succesfully after waiting ${wait_time} seconds

Wait For The Element to be Visible
    [Arguments]    ${locator}    ${button_name}    ${wait_time}
    Log    Wait for ${wait_time} seconds for ${button_name} element to be visible
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    ${wait_time}
    Log    ${button_name} element is visible after waiting ${wait_time} seconds
    Screenshot.Take Screenshot
    [Return]    ${status}

Clear Filter
    [Arguments]    ${FIlter_Category}
    ${new.button.homepage.common.filter}    Update Dynamic Value    ${button.homepage.common.filter}    ${FIlter_Category}
    ${new.button.homepage.clear_filter}    Update Dynamic Value    ${button.homepage.clear_filter}    ${FIlter_Category}
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${new.button.homepage.common.filter}
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${new.button.homepage.clear_filter}
    Wait Until Time    ${MINI_WAIT}
    Wait Until Element Is Not Visible    ${homepage.spinner}    ${LONG_WAIT}
    Wait Until Time    ${MINI_WAIT}

Select Required Arrow
    [Arguments]    ${arrow_locator}    ${given_arrow_attribute}
    FOR    ${Key}    IN RANGE    5
        ${application_arrow_attribute}    Get Element Attribute    ${arrow_locator}    class
        ${down_arrow_status}    Run Keyword And Return Status    Should Contain    ${application_arrow_attribute}    ${given_arrow_attribute}
        Run Keyword If    ${down_arrow_status}==False    Javascript Click    ${arrow_locator}
        Exit For Loop If    ${down_arrow_status}==True
        Screenshot.Take Screenshot
        wait until time    3
    END

Perform Actions in Forgot Password Page
    [Arguments]    ${Data}
    Input Text    ${textbox.login.forgot_password_link.email_textbox}    ${Data}
    Perform Actions    Send    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Settings Icon
    Wait Until Element Is Visible    ${button.clientportal.settings_icon}    ${MEDIUM_WAIT}    "Order column" is not Visible until ${MEDIUM_WAIT} seconds
    Click Element    ${button.clientportal.settings_icon}
    Wait Until Page Contains Element    ${label.client_portal.settings_icon.order_column_pagetitle}
    Screenshot.Take Screenshot

Exchange Order Columns
    [Arguments]    ${Exchange_Order1}    ${Exchange_Order2}
    ${new.button.clientportal.settings_icon.order_column.field_name}    Update Dynamic Value    ${button.clientportal.settings_icon.order_column.field_name}    ${Exchange_Order1}
    Wait Until Element Is Visible    ${new.button.clientportal.settings_icon.order_column.field_name}    ${MEDIUM_WAIT}    "first_name" is not visible until "${MEDIUM_WAIT}" seconds
    ${new.button.clientportal.settings_icon.order_column.field_name}    Update Dynamic Value    ${button.clientportal.settings_icon.order_column.field_name}    ${Exchange_Order2}
    Wait Until Element Is Visible    ${new.button.clientportal.settings_icon.order_column.field_name}    ${MEDIUM_WAIT}    "second_name" is not visible until "${MEDIUM_WAIT}" seconds
    Drag And Drop    ${new.button.clientportal.settings_icon.order_column.field_name}    ${new.button.clientportal.settings_icon.order_column.field_name}
    Screenshot.Take Screenshot

Change Profile Page Role
    [Arguments]    ${Role_name}
    [Documentation]    This keyword is used to change the Role in profile page by passing the role_name ex...,External.etc \
    Wait Until Element Is Visible    ${button.profile_page.settings_icon}    ${MEDIUM_WAIT}    "Profile page settings icon" is not visible until "${MEDIUM_WAIT}" seconds
    Mouse Over    ${button.profile_page.settings_icon}
    Wait Until Element Is Visible    ${textbox.profile_page.settings_icon.role}    ${MEDIUM_WAIT}    "Role" is not visible until "${MEDIUM_WAIT}" seconds
    Click Element    ${textbox.profile_page.settings_icon.role}
    ${new.label.accesioning.details.submenu}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${Role_name}
    Wait Until Element Is Visible    ${new.label.accesioning.details.submenu}    ${MEDIUM_WAIT}    "External" is not visible until "${MEDIUM_WAIT}" seconds
    Click Element    ${new.label.accesioning.details.submenu}
    Wait Until Time    5
    Screenshot.Take Screenshot

Read and Remove File path
    Wait Until Time    ${SHORT_WAIT}
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${count}    Get Length    ${file_path}
    FOR    ${key}    IN RANGE    ${count}
        Remove File    ${file_path}[${key}]
    END

Read coloured Pdf and continue on Failure
    [Arguments]    ${file_path}
    ${pdf_data}    Read Coloured PDF    ${file_path}[0]
    Set Test Variable    ${pdf_data}

Click on Sign In Button
    Wait Until Time    2
    Click On The Element    ${login.button.signin}    Sign in    ${SHORT_WAIT}

Click On Refuse Alert Button
    ${Alert_Text}    Get Text    ${label.popup_alert.get_attribute}
    Wait Until Time    1
    Click On The Element    ${button.homepage.refusealert}    ${Alert_Text} Alert    ${SHORT_WAIT}

Verify Expected File is Downloaded into Local
    Log    Validate File is Present in Local
    Wait Until Time    ${MINI_WAIT}
    FOR    ${key}    IN RANGE    1    35
        ${status}    Run Keyword And Return Status    Directory Should Not Be Empty    ${EXECDIR}\\Downloads
        Wait Until Time    2
        Run Keyword If    '${status}'=='True'    Exit For Loop
    END

Wait For The Element To Be Enabled
    [Arguments]    ${locator}    ${button_name}    ${wait_time}
    Log    Wait for ${wait_time} seconds for ${button_name} element to be enabled
    SeleniumLibrary.Wait Until Element Is Enabled    ${locator}    ${wait_time}

Wait For The Element To Be Clickable
    [Arguments]    ${locator}    ${button_name}    ${wait_time}
    Log    Wait for ${wait_time} seconds for ${button_name} element to be clickable
    Wait Until Element Clickable    ${locator}    ${wait_time}

Verify Pdf data
    [Arguments]    ${pdf_data}    ${application_data_to_verify}
    ${status}    Run Keyword And Return Status    Should Contain    ${pdf_data}    ${application_data_to_verify}
    Run Keyword If    '${status}'=='False'    Fail

Get Future Date
    ${date}    Get Current Date
    ${date}    Add Time To Date    ${date}    7days    result_format=%m/%d/%Y
    [Return]    ${date}

Launch Chrome Browser
    Open Browser    ${URL}    gc
    Maximize Browser Window

Navigate to Details button
    [Arguments]    ${Sample_Id}
    ${new.button.accesioning.requisition-details_using_sample-id}    Update Dynamic Value    ${button.accesioning.requisition-details_using_sample-id}    ${Sample_Id}
    Click On The Element    ${new.button.accesioning.requisition-details_using_sample-id}    "${Sample_Id}"-details_icon    ${LONG_WAIT}
    Wait For Spinner To Disappear    ${homepage.spinner}

Read Coloured Pdf and Verify
    [Arguments]    ${application_data_to_verify}
    Verify Expected File is Downloaded into Local
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Coloured Pdf    ${file_path}[0]
    Should Contain    ${pdf_data}    ${application_data_to_verify}