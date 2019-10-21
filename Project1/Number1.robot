*** Settings ***
Resource    Resources/Util.robot
Library    SeleniumLibrary

     
*** Variables ***
${text}    hoang
@{list}    admin    switch
&{Global}    url=https://192.168.71.41    user=admin
${URL1}    https://google.com
${URL2}    https://facebook.com

*** Keywords ***
ShowMesseage
    Log     ${text}
TestTemplateBrowser
    [Arguments]    ${path}
    Open Browser    ${path}    chrome
    
*** Test Cases ***
Hoang
     [Tags]    hoang1
     Open Browser    https://google.com    chrome    
Hoang2
    Close All Browsers 
    
    

