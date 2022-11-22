*** Settings ***
Suite Setup       Launch Chrome Browser
Suite Teardown    Take Screenshot And Close Browsers
Test Setup
Test Template     LP_55 Validate Login with Invalid Username And Invalid Password
Library           DataDriver    ${datadriven_test_data_file}    sheet_name=NegativeTestData
Resource          ../../Global/super.robot

*** Test Cases ***
${test_case_name}

*** Keywords ***
LP_55 Validate Login with Invalid Username And Invalid Password
    [Arguments]    ${Username}    ${Password}    ${error_message}
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 2: Login with ${USERNAME} as username and ${PASSWORD} as password
    Send Text To Textfield    ${login.textbox.username}    Username    ${MEDIUM_WAIT}    ${Username}
    Log    ${Username} is entered in ${login.textbox.username} textbox
    Send Text To Textfield    ${login.textbox.password}    Password    ${MEDIUM_WAIT}    ${Password}
    Log    ${Password} is entered in ${login.textbox.password} textbox
    Click on Sign In Button
    Wait For The Element to be Visible    ${label.loginpage.label_for_error_messages}    error messsage label    ${MEDIUM_WAIT}
    ${Application_error_message}    Get Text    ${label.loginpage.label_for_error_messages}
    Should Be Equal    ${error_message}    ${Application_error_message}
