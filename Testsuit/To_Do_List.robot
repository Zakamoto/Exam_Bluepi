*** Settings ***
Resource   ../imports/imports_librarys.robot
Resource   ../imports/to_do_list/import_features_to_do_list.robot
Resource   ../imports/to_do_list/import_keywords_to_do_list.robot
Resource   ../resources/env/test/to_do_list_settings.robot
Resource   ./To_Do_List_Data.robot

Test Setup    Runkeywords    common_keywords.Config
...       AND   common_web_keywords.Open Browser With Google Chrome And Go To    ${url_homepage_to_do_list}
Test Teardown   Close All Browsers

*** Test Cases ***
TC_001 Checking Homepage
    to_do_list_keywords.Text Banner To Do List Should Visible
    to_do_list_keywords.Link Text Menu Add Item Should Visible
    to_do_list_keywords.Link Text Menu To Do Tasks Should Visible
    to_do_list_keywords.Link Text Menu Completed Should Visible
    to_do_list_add_item_keywords.Input Task Should Have No Value
    to_do_list_keywords.Create New Task Button Should Visible

TC_002 To Do Tasks Should Not Have Tasks
    to_do_list_keywords.Click Menu To Do Tasks
    to_do_list_to_do_tasks_keywords.Any Task Should Not Visible
    
TC_003 Completed Should Not Have Tasks
    to_do_list_keywords.Click Menu Completed
    to_do_list_completed_keywords.Any Task Should Not Visible

TC_004 Create One Task And Task Should Visible On Page To-Do Tasks
    to_do_list_features.Create New Task   ${TC_004_New_Task}
    to_do_list_add_item_keywords.Input Task Should Have No Value
    to_do_list_keywords.Click Menu To Do Tasks 
    to_do_list_to_do_tasks_keywords.Total Task On To Do Tasks Should Be    ${1}
    to_do_list_to_do_tasks_keywords.To Do Task Should Have Task Name       ${TC_004_New_Task}
    to_do_list_to_do_tasks_keywords.Task Should Have Check Box Inline Task Name       ${TC_004_New_Task}
    to_do_list_to_do_tasks_keywords.Task Should Have DELETE Underline Task Name       ${TC_004_New_Task}
    to_do_list_keywords.Click Menu Completed
    to_do_list_completed_keywords.Any Task Should Not Visible

TC_005 Delete Task On Page To Do Tasks
    to_do_list_features.Create New Task   ${TC_005_New_Task}
    to_do_list_keywords.Click Menu To Do Tasks 
    to_do_list_to_do_tasks_keywords.DELETE Task By Name       ${TC_005_New_Task}
    to_do_list_to_do_tasks_keywords.Any Task Should Not Visible
    to_do_list_keywords.Click Menu Completed
    to_do_list_completed_keywords.Any Task Should Not Visible

TC_006 Create Multi Tasks And Complete Every Tasks
    to_do_list_features.Create Multi Tasks        ${TC_006_Tasks_List}
    to_do_list_keywords.Click Menu To Do Tasks
    ${total_tasks}     Get Length    ${TC_006_Tasks_List}
    to_do_list_to_do_tasks_keywords.Total Task On To Do Tasks Should Be    ${total_tasks}
    to_do_list_features.Verify Multi To Do Tasks        ${TC_006_Tasks_List}
    to_do_list_features.Click Multi Checkbox Tasks    ${TC_006_Tasks_List}
    to_do_list_to_do_tasks_keywords.Any Task Should Not Visible
    to_do_list_keywords.Click Menu Completed
    to_do_list_completed_keywords.Total Task On Completed Should Be        ${total_tasks}
    to_do_list_features.Verify Multi Completed Tasks       ${TC_006_Tasks_List}
    to_do_list_features.Delete Multi Completed Tasks       ${TC_006_Tasks_List}
    to_do_list_completed_keywords.Any Task Should Not Visible    
    to_do_list_keywords.Click Menu To Do Tasks
    to_do_list_to_do_tasks_keywords.Any Task Should Not Visible

TC_007 Have One Task On To Do And One Task On Completed
    to_do_list_features.Create Multi Tasks        ${TC_007_Tasks_List}
    to_do_list_keywords.Click Menu To Do Tasks
    to_do_list_to_do_tasks_keywords.Click Check Box By Task Name    ${TC_007_Tasks_List}[0]
    to_do_list_to_do_tasks_keywords.Total Task On To Do Tasks Should Be    ${1}
    to_do_list_to_do_tasks_keywords.To Do Task Should Have Task Name       ${TC_007_Tasks_List}[1]
    to_do_list_to_do_tasks_keywords.Task Should Have Check Box Inline Task Name       ${TC_007_Tasks_List}[1]
    to_do_list_to_do_tasks_keywords.Task Should Have DELETE Underline Task Name       ${TC_007_Tasks_List}[1]
    to_do_list_keywords.Click Menu Completed
    to_do_list_completed_keywords.Total Task On Completed Should Be        ${1}
    to_do_list_completed_keywords.Completed Task Should Have Task Name       ${TC_007_Tasks_List}[0]
    to_do_list_completed_keywords.Task Should Have Icon Correct Inline Before Task Name      ${TC_007_Tasks_List}[0]
    to_do_list_completed_keywords.Task Should Have DELETE Inline After Task Name       ${TC_007_Tasks_List}[0]
    to_do_list_keywords.Click Menu To Do Tasks
    to_do_list_to_do_tasks_keywords.Total Task On To Do Tasks Should Be    ${1}
    to_do_list_to_do_tasks_keywords.To Do Task Should Have Task Name       ${TC_007_Tasks_List}[1]
    to_do_list_to_do_tasks_keywords.Task Should Have Check Box Inline Task Name       ${TC_007_Tasks_List}[1]
    to_do_list_to_do_tasks_keywords.Task Should Have DELETE Underline Task Name       ${TC_007_Tasks_List}[1]
