*** Keywords ***
Create New Task
    [Arguments]     ${text}
    to_do_list_add_item_keywords.Input Task      ${text}
    to_do_list_add_item_keywords.Click Button Add

Create Multi Tasks
    [Arguments]     ${tasks_list}
    FOR    ${task}   IN    @{tasks_list}
        to_do_list_add_item_keywords.Input Task      ${task}
        to_do_list_add_item_keywords.Click Button Add
    END

Verify Multi To Do Tasks
    [Arguments]     ${tasks_list}
    FOR    ${task}   IN    @{tasks_list}
        to_do_list_to_do_tasks_keywords.To Do Task Should Have Task Name       ${task}
        to_do_list_to_do_tasks_keywords.Task Should Have Check Box Inline Task Name       ${task}
        to_do_list_to_do_tasks_keywords.Task Should Have DELETE Underline Task Name       ${task}

    END

Click Multi Checkbox Tasks
    [Arguments]     ${tasks_list}
    FOR    ${task}   IN    @{tasks_list}
        to_do_list_to_do_tasks_keywords.Click Check Box By Task Name      ${task}
    END

Verify Multi Completed Tasks
    [Arguments]     ${tasks_list}
    FOR    ${task}   IN    @{tasks_list}
        to_do_list_completed_keywords.Completed Task Should Have Task Name       ${task}
        to_do_list_completed_keywords.Task Should Have Icon Correct Inline Before Task Name      ${task}
        to_do_list_completed_keywords.Task Should Have DELETE Inline After Task Name       ${task}
    END

Delete Multi Completed Tasks
    [Arguments]     ${tasks_list}
    FOR    ${task}   IN    @{tasks_list}
        to_do_list_completed_keywords.DELETE Task By Name      ${task}
    END