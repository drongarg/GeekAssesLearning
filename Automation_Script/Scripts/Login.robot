*** Settings ***
Resource        ../Resources/Keyword.robot.txt

*** Test Cases ***
Login with Valid Credentials
    Login To Application
    Logout
    Close Browser
