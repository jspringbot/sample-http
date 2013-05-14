*** Settings ***
Library     JSpringBotGlobal

*** Keywords ***
Create and Invoke Request
    [Arguments]     ${path}
    Create HTTP Get Request  http://api.wunderground.com/api/78aa96563b9ec435/conditions/q${path}
    Invoke HTTP Request
    Response Status Code Should Be OK

Response Status Code Should Be OK
    [Documentation]     Verifies that the response status code is 200
    HTTP Response Status Code Should Be Equal To     200

Response Header Content Type Should Be Json
    ${contentType}=     Get HTTP Response Header    Content-Type
    Should Be Equal     application/json; charset=UTF-8     ${contentType}

Response Header Content Type Should Be XML
    ${contentType}=     Get HTTP Response Header    Content-Type
    Should Be Equal     text/xml; charset=UTF-8     ${contentType}
