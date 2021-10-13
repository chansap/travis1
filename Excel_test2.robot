*** Settings ***
Library    RPA.Excel.Files

*** Variables ***
${EXCEL_FILE}   Documents/testfile.xlsx


#Creating a new Excel file with a dictionary
*** Tasks ***
Creating new Excel
    Create Workbook  Documents/my_new_excel1.xlsx
    FOR    ${index}    IN RANGE    20
        &{row}=       Create Dictionary
        ...           Row No   ${index}
        ...           Amount   ${index * 25}
        Append Rows to Worksheet  ${row}  header=${TRUE}
    END
    Save Workbook


*** Keywords ***
Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}