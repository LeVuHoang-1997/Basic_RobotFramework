*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Util.robot
*** Test Cases ***
Num1
    Login    automation    Omnivista@123    https://automation.ov.dev.ovcirrus.com
    Navigate2    Network>Inventory>Device Catalog
    Sleep    2s
    Click Element    //button[@title="Import"]
    Sleep    5s    
    Choose File    //input[@id="device-catalog-import-file"]        D:\\WORKINGSPACE\\ECLIPSE2018\\Project1\\DataDriver.csv
    Click Element    //button[text()='Import']    
        
Num2
    Open Browser    http://www.convertcsv.com/csv-to-pdf.htm    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    //a[@class="nav-link" and contains(.,'Choose File')]
    Sleep    3s     
    Choose File    id:f1    D:\\WORKINGSPACE\\ECLIPSE2018\\Project1\\DataDriver.csv
