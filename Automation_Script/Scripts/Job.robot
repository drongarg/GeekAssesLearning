*** Settings ***
Resource          ../Resources/Keyword.robot.txt

*** Test Cases ***
Create Job From Create Button
    Login To Application
    ${jobTitle}    ${companyName}    Create Job From Top Menu    TestCompany2    Job2    On Contract    Job Description Goes Here    Selenium    Bengaluru    0-2    Btech    Animation
    Validate Existence For Jobs    ${jobTitle}    ${companyName}
    Logout

Create Job From Create Top Menu on Home Page
    Login To Application
    ${jobTitle}    ${companyName}    Create Job    TestCompany3    Job3    On Contract    Job Description Goes Here    Selenium    Bengaluru    0-2    Btech    Animation
    Validate Existence For Jobs    ${jobTitle}    ${companyName}
    Logout

Create Job From Create Button With Company
    Login To Application
    ${jobTitle}    ${companyName}    Create Job From Top Menu With \ Company    TestCompany2    Job2    On Contract    Job Description Goes Here    Selenium    Bengaluru    0-2    Btech    Animation
    Validate Existence For Jobs    ${jobTitle}    ${companyName}
    Logout