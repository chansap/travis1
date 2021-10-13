*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
First Run
    Open Browser    https://mypage.rediff.com/login/dologin     Chrome
    sleep   3
    Close Browser