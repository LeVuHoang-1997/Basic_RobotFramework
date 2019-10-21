*** Settings ***
Library           SeleniumLibrary
Library           String
Library           DataDriver

*** Variables ***
${url}            https://192.168.71.41
@{path_url}       Configuration    Groups    MAC Group
${i}              0

*** Keywords ***

    
                
Login
    [Arguments]    ${name}    ${password}    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Input Text    id:username    ${name}
    Input Text    id:password    ${password}
    Click Button    id:signInButton
    Wait Until Element Is Visible    //*[@id="ov-branding-canvas"]    20s
   
  

Logout
    Click Element    //span[@class="fa fa-sign-out"]
Navigate2
     [Arguments]    ${path}
    @{paths}=    Split String    ${path}    separator=>
    ${count}=    Get Length    ${paths}
    : FOR    ${INDEX}    IN RANGE    ${count}
    \    Run Keyword If    ${INDEX}==0    Click Element    //a[@class='ng-binding' and contains(text(),'@{paths}[0]')]
    \    Run Keyword If    ${INDEX}==1    Click Element    //a[contains(@id,'main-menu') and contains(text(),'@{paths}[1]')]
    \    Run Keyword If    ${INDEX}>=2    Click Element    //div[@class='col-xs-10 ' and contains(.,'@{paths}[${INDEX}]')]
    \    Sleep    2s

Navigate
    [Arguments]    @{path}
    ${count}=    Get Length    ${path}
    : FOR    ${INDEX}    IN RANGE    ${count}
    \    Run Keyword If    ${INDEX}==0    Click Element    //a[@class='ng-binding' and contains(text(),'@{path}[0]')]
    \    Run Keyword If    ${INDEX}==1    Click Element    //a[contains(@id,'main-menu') and contains(text(),'@{path}[1]')]
    \    Run Keyword If    ${INDEX}>=2    Click Element    //div[@class='col-xs-10 ' and contains(.,'@{path}[${INDEX}]')]
    \    Sleep    1s

CreateMacGroup
    [Arguments]    ${string}
    @{action}=    Split String    ${string}    separator=/
    Run Keyword If    @{action}[0]=='Create'    Click Element    //button[@class="btn btn-default" and contains(@title,'Create')]
    Input Text    //label[contains(.,'Name')]/following-sibling::*//input    hoang
    Input Text    //label[contains(.,'Name')]/following-sibling::*//input    ffffffffffff
    Sleep    1s
    Click Element    //a[@title="Add"]
    Click Element    //button[contains(text(),'Create')]
    Run Keyword If    @{action}[0]=='Createe'    Log    hoang    
    
Refesh
    Refesh

Create
    [Arguments]    ${string}
    @{action}=    Split String    ${string}    separator=/
    @{contents}=    Split String    @{action}[1]    separator=;
    Run Keyword If    '@{action}[0]'=='Create'
    ...    CreateGroup    @{contents}
    Run Keyword If    '@{action}[0]'=='Edit'
    ...    Edit    @{contents}   
CreateGroup
    [Arguments]    @{contents}
    Click Element    //button[@class="btn btn-default" and contains(@title,'Create')]
     : FOR    ${content}    IN    @{contents}
     \    @{x}=    Split String    ${content}    separator==
     \    Input Text    //label[contains(.,'@{x}[0]')]/following-sibling::*//input    @{x}[1]
     Click Element    //a[@title="Add"]
     Click Element    //button[contains(text(),'Create')]    