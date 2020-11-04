*** Settings ***
Test Teardown
Resource          ../Resources/Keyword.robot.txt

*** Test Cases ***
To Create Company
    Login To Application
    ${companyName}    Create Company    TestCompany6    ddrr6@gmail.com    +91993333290    5-10    Animation    https://www.vignesh.com    Bengaluru
    Validate Existence For Company    ${companyName}
    Logout
