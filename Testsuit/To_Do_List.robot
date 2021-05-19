*** Settings ***
Resource   ../imports

Test Setup    Runkeywords    common_keywords.
...       AND   Open Browser With Google Chrome And Go To    ${url_homepage_to_do_list}

*** Test Cases ***
TC_001 Checking Homepage
    Text To Do List Should Visible
    Link Text Menu Add Item Should Visible
    Link Text Menu To Do Tasks Should Visible
    Link Text Menu Completed Should Visible
    Empty Input New Task Should Visible
    Create New Task Button Should Visible

TC_002 To Do Tasks Should Not Have Tasks
    
TC_003 Completed Should Not Have Tasks