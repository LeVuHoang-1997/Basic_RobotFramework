*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL1}     http://montrealgazette.com/
${URL2}     https://www.usatoday.com/
${URL3}     http://www.foxnews.com/
${URL4}     http://www.cnn.com/
${URL5}     https://ca.reuters.com/

*** Test Cases ***
Validate Availability
    [Tags]    abc
    [Template]    Open URL
    ${URL1}
    Close
    
   
Hoang
    [Tags]    ab1
    [Template]    Open URL
     ${URL1}

*** Keywords ***
Open URL
    [Arguments]  ${URL}
    Open Browser    ${URL}     Chrome
Close 
    SeleniumLibrary.Close Browser