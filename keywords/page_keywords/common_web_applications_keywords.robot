*** Keywords ***

Click Element When Ready
    [Arguments]   ${locator}
    Wait Until Page Contains Element      ${locator}    ${GLOBAL_TIMEOUT}
    Click Element      ${locator}