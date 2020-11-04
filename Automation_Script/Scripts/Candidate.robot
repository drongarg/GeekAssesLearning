*** Settings ***
Resource          ../Resources/Keyword.robot.txt
Library           ExcelRobot
Library          ../Resources/WriteToExcel.py

*** Variables ***
${SheetName}      Candidate
${ExcelPath}      Data/MasterData.xlsx
${candidateName}    ${EMPTY}
${candidateEmail}    ${EMPTY}
${candidateMobile}    ${EMPTY}
${caniddateResume}    ${EMPTY}

*** Test Cases ***
*** Comment ***
To Add Candidate From Create Button Multiple Candidate
    Login To Application
    ${rownum}=    RowNumber    ${ExcelPath}    ${SheetName}
    FOR    ${i}    IN RANGE    1    ${rownum}
        ${status}=    ExcelReading    ${ExcelPath}    0    ${i}    ${SheetName}
        Run Keyword If    '${status}' == 'Used'    Continue For Loop
        ${candidateName}=    ExcelReading    ${ExcelPath}    1    ${i}    ${SheetName}
        ${candidateEmail}=    ExcelReading    ${ExcelPath}    2    ${i}    ${SheetName}
        ${candidateMobile}=    ExcelReading    ${ExcelPath}    3    ${i}    ${SheetName}
        ${CandidateResume}=    ExcelReading    ${ExcelPath}    4    ${i}    ${SheetName}
        ${candidateName}    Add Candidate    ${candidateName}    ${candidateEmail}    ${candidateMobile}    ${CandidateResume}
        Validate Existence For Candidate    ${candidateName}
        WriteToExcel.write_value_to_cell        ${ExcelPath}    ${SheetName}    ${i}    0    Used
    END
    Logout

*** Test Cases ***
Add Candidate From Create Top Menu on Home Page
    Login To Application
    ${rownum}=    RowNumber    ${ExcelPath}    ${SheetName}
    FOR    ${i}    IN RANGE    1    9
        ${status}=    ExcelReading    ${ExcelPath}    0    ${i}    ${SheetName}
        Run Keyword If    '${status}' == 'Used'    Continue For Loop
        ${candidateName}=    ExcelReading    ${ExcelPath}    1    ${i}    ${SheetName}
        ${candidateEmail}=    ExcelReading    ${ExcelPath}    2    ${i}    ${SheetName}
        ${candidateMobile}=    ExcelReading    ${ExcelPath}    3    ${i}    ${SheetName}
        ${CandidateResume}=    ExcelReading    ${ExcelPath}    4    ${i}    ${SheetName}
        ${candidateName}    Add Candidate From Top Menu    ${candidateName}    ${candidateEmail}    ${candidateMobile}    ${CandidateResume}
        Validate Existence For Candidate    ${candidateName}
        WriteToExcel.write_value_to_cell        ${ExcelPath}    ${SheetName}    ${i}    0    Used
    END
    Logout