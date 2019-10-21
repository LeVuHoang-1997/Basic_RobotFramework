*** Settings ***
Library    SeleniumLibrary
Resource    Resources/Util.robot
Suite Teardown    Close Browser


*** Variables ***
${url}    https://192.168.71.41
${username}    admin
${password}    switch    
@{path}           Configuration    Groups    VLAN Group
&{GlobalVariable}  url=https://192.168.71.41    username=admin    password=switch

*** Test Cases ***

SeleniumTest

    Login    name=${GlobalVariable}[username]    password=${GlobalVariable}[password]   url=${GlobalVariable}[url]
    Navigate    @{path}
    Create    Create/Name=22234;VLAN Range=1-20
    Logout
    

TestTag
    [Tags]    testtag
    Login    name=${GlobalVariable}[username]    password=${GlobalVariable}[password]   url=${GlobalVariable}[url]
 

    
    
    