*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside Test Suite Setup    
Suite Teardown    Log    I am inside Teardown Suite Setup    
Test Setup    Log    I am inside Test setup    
Test Teardown    Log    I am inside Test Teardown Setup    

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
    Log    My first Test    
    
MySecondTest
    [Tags]    Regression
    Log    My second Test
    
MyThirdTest
    Log    My third Test
    
MyFourthTest
    Log    My fourth Test
    
# FistSeleniumTest
    # Open Browser    https:google.com    chrome
    # Set Browser Implicit Wait    5
    # Input Text    name=q    Automation Step by Step   
    # Press Keys    name=q    ENTER 
     
    # # Click Button    name=btnK    
    # Sleep    5  
    # Close Browser
    # Log    Test Completed    
    
SampleLoginTest
    [Documentation]    This is a sample Login Test..
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    # Input Text    id=txtUsername    Admin
    # Input Password    id=txtPassword    admin123
    # Input Text    id=txtUsername    @{CREDENTIAL}[0]
    # Input Password    id=txtPassword    &{LOGINDATA}[Password]
    LoginKW
    # Click Button    id=btnLogin 
    Click Element    id=welcome    
    Click Element    link=Logout   
    Close Browser
    Log    Test Completed          
    Log    This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}         https://opensource-demo.orangehrmlive.com/
@{CREDENTIAL}    Admin    admin123
&{LOGINDATA}    Username=Admin    Password=admin123

*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{CREDENTIAL}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[Password]
    Click Button    id=btnLogin 