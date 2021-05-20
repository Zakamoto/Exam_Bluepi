*** Keywords ***
Any Task Should Not Visible
    common_web_keywords.Web Element Should Not Visible    //ul[@id="completed-tasks"]/li

Total Task On Completed Should Be
    [Arguments]   ${expect_count}
    ${actual_count}    Get Element Count    //ul[@id="completed-tasks"]/li
    Should Be Equal    ${actual_count}      ${expect_count}

Completed Task Should Have Task Name       
    [Arguments]   ${task_name}
    common_web_keywords.Web Element Should Visible   //ul[@id="completed-tasks"]/li/span[contains(text(),"${task_name}")]

Task Should Have Icon Correct Inline Before Task Name
    [Arguments]   ${task_name}
    common_web_keywords.Web Element Should Visible   //ul[@id="completed-tasks"]/li/span[contains(text(),"${task_name}")]/i[@class="material-icons mdl-list__item-icon"]

Task Should Have DELETE Inline After Task Name    
    [Arguments]   ${task_name}
    common_web_keywords.Web Element Should Visible   //ul[@id="completed-tasks"]/li/span[contains(text(),"${task_name}")]/following-sibling::button[contains(text(),"Delete")]

DELETE Task By Name
    [Arguments]   ${task_name}
    common_web_keywords.Click Element When Ready   //ul[@id="completed-tasks"]/li/span[contains(text(),"${task_name}")]/following-sibling::button[contains(text(),"Delete")]

