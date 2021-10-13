*** Settings ***
Library    RPA.Excel.Files
Library  Collections

*** Variables ***
${EXCEL_FILE}   Documents/chand1.xlsx
@{heading}   Row No   Amount
@{rows}      ${heading}


#Creating a new Excel file with a dictionary
*** Tasks ***
Creating new Excel
    Create Workbook  ${EXCEL_FILE}
    FOR    ${index}    IN RANGE   1  13
        @{row}=         Create List   ${index}   ${index * 25}
        Append To List  ${rows}  ${row}
        log to console  ${rows}
    END
    Append Rows to Worksheet  ${rows}
    Save Workbook


*** Keywords ***
Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}