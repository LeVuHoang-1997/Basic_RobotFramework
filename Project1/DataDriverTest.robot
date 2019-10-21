***Settings***
Library           SeleniumLibrary
Library           DataDriver    file=Resources/DataDriver.csv
Test Template     Invalid Login   

*** Test Case ***
Login with user ${username} and password ${password}    Default    Userdata   
    
***** *Keywords* *****
Invalid login
    [Arguments]    ${username}    ${password}
    Open Browser    https://192.168.71.41    chrome
    Input Text    id:username    ${username}    
    Input Password    id:password    ${password}
    Click Element    id:signInButton               
    Wait Until Element Is Visible    //div[@class="ng-binding" and contains(.,'Login failed')]    5s
    Close Browser
Valid Login
    [Arguments]    ${username}    ${password}
    Open Browser    https://192.168.71.41    chrome
    Input Text    id:username    ${username}    
    Input Password    id:password    ${password}
    Click Element    id:signInButton               
    Close Browser