*** Settings ***
Library     RPA.Excel.Files
Library     Collections
Library     RequestsLibrary

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com/posts
${EXCEL_FILE}   d/sandeep.xlsx
@{heading}   userID   id  title   body
@{rows}      ${heading}

*** Test Cases ***
Taking data from web to excel
    ${response}=    Get     ${base_url}
#    log to console      ${response.json()}[5]
    Create Workbook     ${EXCEL_FILE}
    FOR    ${index}    IN RANGE   0  100
        @{row}=     Create List   ${response.json()}[${index}][userId]   ${response.json()}[${index}][id]   ${response.json()}[${index}][title]   ${response.json()}[${index}][body]
        Append To List  ${rows}  ${row}
    END
    Append Rows to Worksheet  ${rows}
    Save Workbook


