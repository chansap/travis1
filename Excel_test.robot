*** Settings ***
Library    RPA.Excel.Files

*** Variables ***
${EXCEL_FILE}   Documents/testfile.xlsx

*** Tasks ***
Rows in the sheet
    [Setup]      Open Workbook    ${EXCEL_FILE}
    @{sheets}=   List Worksheets
    FOR  ${sheet}  IN   @{sheets}
        ${count}=  Get row count in the sheet   ${sheet}
        Log   Worksheet '${sheet}' has ${count} rows
    END

*** Keywords ***
Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}