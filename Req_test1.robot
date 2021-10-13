*** Settings ***
Library     RequestsLibrary

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com/posts

*** Test Cases ***
Test Case For Requesting from Web
    ${response}=    GET  ${base_url}
#    Should Be Equal As Strings    1  ${response.json()}[id]
    log to console      ${response.status_code}
    log to console      ${response.json()}[1][title]