*** Keywords ***
Open Browser With Google Chrome And Go To
    [Arguments]   ${url}
    Open Browser    ${url}   gc
    Maximize Browser Window
    Set Selenium Speed    0.2s