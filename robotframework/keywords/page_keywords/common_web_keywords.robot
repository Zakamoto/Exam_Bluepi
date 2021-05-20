*** Keywords ***
Open Browser With Google Chrome And Go To
    [Arguments]   ${url}
    Open Browser    ${url}   gc
    Maximize Browser Window
    Set Selenium Speed    0.2s

Click Element When Ready
    [Arguments]   ${locator}
    Wait Until Page Contains Element      ${locator}    ${GLOBAL_TIMEOUT}
    Click Element      ${locator}

Input Text When Element Ready
    [Arguments]   ${locator}    ${text}  ${clear}=${FALSE}
    Wait Until Page Contains Element      ${locator}    ${GLOBAL_TIMEOUT}
    Input Text   ${locator}    ${text}    ${clear}

Get Text When Element Ready
    [Arguments]   ${locator}
    Wait Until Page Contains Element      ${locator}    ${GLOBAL_TIMEOUT}
    ${get_text}   Get Text      ${locator}
    [Return]   ${get_text}

Web Element Should Visible
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    Wait Until Page Contains Element      ${locator}    ${timeout}

Web Element Should Not Visible
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    Wait Until Page Does Not Contain Element      ${locator}    ${timeout}

Web Element Text Should Be
    [Arguments]    ${locator}   ${expect_text}    ${timeout}=${GLOBAL_TIMEOUT}
    Wait Until Element Contains      ${locator}    ${expect_text}    ${timeout}