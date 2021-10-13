*** Settings ***
Library     SeleniumLibrary

*** Variables ***
@{abc}  Row No  Amount

*** Test Cases ***
Testing Doubts
    FOR     ${index}    IN  @{abc}
       log to console  ${index}
    END
