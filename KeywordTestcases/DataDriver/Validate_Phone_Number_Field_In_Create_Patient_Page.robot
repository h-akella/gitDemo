*** Settings ***
Suite Setup       Navigate to Create New Patient Page For Negative Validation
Suite Teardown    Take Screenshot And Close Browsers
Test Template     CP_82 Verify Error Messages When Invalid Phone Number is given in Create New Patient Field
Library           DataDriver    ${datadriven_test_data_file}    sheet_name=Create_Patient_Validation
Resource          ../../Global/super.robot

*** Test Cases ***
${test_case_name}

*** Keywords ***
CP_82 Verify Error Messages When Invalid Phone Number is given in Create New Patient Field
    [Arguments]    ${Invaliddata}    ${error_message}
    ${testdata}    Read TestData From Excel    CP082    ClientPortal
    Validate Phone Number Field in Create New Patient Field    ${testdata}    ${Invaliddata}    ${error_message}
