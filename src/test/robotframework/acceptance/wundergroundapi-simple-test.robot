*** Settings ***
Library     JSpringBotGlobal
Library     String
Library     BuiltIn

*** Test Cases ***
Wunderground API XML Simple Test
    [Tags]    simple-test   wundergroundapi-simple-xml-test
    New HTTP Session
    Create HTTP Get Request         http://api.wunderground.com/api/78aa96563b9ec435/conditions/q/CA/San_Francisco.xml
    Invoke HTTP Request
    HTTP Response Status Code Should Be Equal To    200
    HTTP Response Should Be XML
    ${content_header}=              Get HTTP Response Header               Content-Type
    Should Be Equal As Strings      text/xml; charset=UTF-8                ${content_header}

Wunderground API JSON Simple Test
    [Tags]    simple-test   wundergroundapi-simple-json-test
    New HTTP Session
    Create HTTP Get Request         http://api.wunderground.com/api/78aa96563b9ec435/conditions/q/CA/San_Francisco.json
    Invoke HTTP Request
    HTTP Response Status Code Should Be Equal To    200
    HTTP Response Should Be JSON
    ${content_header}=              Get HTTP Response Header               Content-Type
    Should Be Equal As Strings      application/json; charset=UTF-8        ${content_header}