*** Keywords ***
Any Task Should Not Visible
    common_web_keywords.Web Element Should Not Visible    //ul[@id="incomplete-tasks"]/li

Total Task On To Do Tasks Should Be
    [Arguments]   ${expect_count}
    ${actual_count}    Get Element Count    //ul[@id="incomplete-tasks"]/li
    Should Be Equal    ${actual_count}      ${expect_count}

To Do Task Should Have Task Name       
    [Arguments]   ${task_name}
    common_web_keywords.Web Element Should Visible   //ul[@id="incomplete-tasks"]/li/label/span[1][text()="${task_name}"]

Task Should Have Check Box Inline Task Name
    [Arguments]   ${task_name}
    common_web_keywords.Web Element Should Visible   //ul[@id="incomplete-tasks"]/li/label/span[1][text()="${task_name}"]/following-sibling::span[@class="mdl-checkbox__focus-helper"]

Task Should Have DELETE Underline Task Name       
    [Arguments]   ${task_name}
    common_web_keywords.Web Element Should Visible   //ul[@id="incomplete-tasks"]/li/label/span[1][text()="${task_name}"]/parent::label/following-sibling::button[contains(text(),"Delete")]

DELETE Task By Name
    [Arguments]   ${task_name}
    common_web_keywords.Click Element When Ready   //ul[@id="incomplete-tasks"]/li/label/span[1][text()="${task_name}"]/parent::label/following-sibling::button[contains(text(),"Delete")]

Click Check Box By Task Name
    [Arguments]   ${task_name}
    common_web_keywords.Click Element When Ready   //ul[@id="incomplete-tasks"]/li/label/span[1][text()="${task_name}"]/following-sibling::span[@class="mdl-checkbox__ripple-container mdl-js-ripple-effect mdl-ripple--center"]
