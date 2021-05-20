*** Keywords ***
Input Task
    [Arguments]    ${text}
    common_web_keywords.Input Text When Element Ready        new-task    ${text}

Click Button Add
    common_web_keywords.Click Element When Ready   //button/i[@class="material-icons"]

Input Task Should Have No Value
    ${get_text_from_input}  common_web_keywords.Get Text When Element Ready    new-task
    Should Be Equal     ${get_text_from_input}     ${EMPTY}

