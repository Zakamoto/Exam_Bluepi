*** Keywords ***
Click Menu To Do Tasks 
    common_web_keywords.Click Element When Ready   //a[@href="#todo"]

Click Menu Completed
    common_web_keywords.Click Element When Ready   //a[@href="#completed"]

Text Banner To Do List Should Visible
    common_web_keywords.Web Element Text Should Be    //h1    TO DO LIST

Link Text Menu Add Item Should Visible
    common_web_keywords.Web Element Should Visible   //a[@href="#add-item"][contains(text(),"Add Item")]

Link Text Menu To Do Tasks Should Visible
    common_web_keywords.Web Element Should Visible   //a[@href="#todo"][contains(text(),"To-Do Tasks")]

Link Text Menu Completed Should Visible
    common_web_keywords.Web Element Should Visible   //a[@href="#completed"][contains(text(),"Completed")]

Create New Task Button Should Visible
    common_web_keywords.Web Element Should Visible      //button/i[@class="material-icons"]

