*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Send Text To Textfield
    [Arguments]    ${locator}    ${element_name}    ${wait}    ${value}
    Wait For The Element to be Visible    ${locator}    ${element_name}    ${wait}
    Wait For Spinner To Disappear    ${spinner.locator}
    Set Focus To Element    ${locator}
    Log    Clear text in ${element_name}
    Clear Element Text    ${locator}
    Log    Cleared text in ${element_name}
    Log    Enter ${value} text in ${element_name} text field
    SeleniumLibrary.Input Text    ${locator}    ${value}
    Log    Entered text ${value} into ${element_name}

Click on a button
    Click On Element JS    "Yes" button    ${web.button.my_approvals.yes_alert}    ${MEDIUM_WAIT}    JS
    Wait For Spinner To Disappear    ${spinner.locator}

Click On Element JS
    [Arguments]    ${locator_name}    ${locator}    ${wait}    ${click_by}=JS
    Comment    Click on ${locator_name}
    Log    Verifying the element ${locator_name} visibility
    Wait For Element To Be Displayed    ${locator_name}    ${locator}    ${wait}
    Log    Verifying the element ${locator_name} focus
    Wait Until Element Clickable    ${locator}
    SeleniumLibrary.Set Focus To Element    ${locator}
    Log    Click on element ${locator_name}
    Run Keyword If    '${click_by}'=='JS'    Javascript Click    ${locator}
    ...    ELSE    SeleniumLibrary.Click Element    ${locator}
    Log    Clicked on ${locator_name}

Select Dropdown Value By Enter Text
    SeleniumLibrary.Scroll Element Into View    ${arrow_locator}
    SeleniumLibrary.Set Focus To Element    ${arrow_locator}
    SeleniumLibrary.Click Element    ${arrow_locator}
    Wait For Spinner To Disappear
    SeleniumLibrary.Input Text    ${textbox_locator}    ${input_text}
    SeleniumLibrary.Wait Until Element Is Visible    ${value_locator}    ${LONG_WAIT}    option checkbox is not visible after waiting for ${LONG_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${value_locator}
    SeleniumLibrary.Set Focus To Element    ${value_locator}
    CustomLibrary.Javascript Click    ${value_locator}
    Wait For Spinner To Disappear
    Log    Waiting for ${locator_name}element visiblility
    ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${wait_time}    ${locator_name} element is not visible after waiting ${wait_time} sec
    Log    The ${locator_name} element is visible
    [Return]    ${status}

Select Radiobutton
    [Arguments]    ${locator}    ${value}
    ${locator_new}    common.Update Dynamic Value    ${locator}    ${value}
    Wait For Spinner To Disappear
    SeleniumLibrary.Set Focus To Element    ${locator_new}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator_new}    ${LONG_WAIT}    radiobutton option is not visible after waiting ${LONG_WAIT}
    Comment    SeleniumLibrary.Scroll Element Into View    ${locator_new}
    Wait Until Time    1
    SeleniumLibrary.Set Focus To Element    ${locator_new}
    CustomLibrary.Javascript Click    ${locator_new}

Wait For Spinner To Disappear
    [Arguments]    ${spinner_locator}
    FOR    ${key}    IN RANGE    1    15
        ${status}    Run Keyword And Return Status    SeleniumLibrary.Page Should Not Contain Element    ${spinner_locator}    The spinner is visible on the page.
        Wait Until Time    2
        Run Keyword If    '${status}'=='True'    Exit For Loop
    END

Fail And Take Screenshot
    [Arguments]    ${error_message}
    Take Screenshot
    Fail    ${error_message}

Set Browser Position
    [Arguments]    ${browser_name}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Set Window Position    0    5
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Set Window Position    1005    6
    Set Window Size    959    1047

Create Screenshot Directory
    Run Keyword And Ignore Error    Create Directory    ${EXECDIR}/Screenshots
    SeleniumLibrary.Set Screenshot Directory    ${EXECDIR}/Screenshots
