*** Settings ***
Library  Remote  http://${ADDRESS}:8270  WITH NAME  remote0
#Library  Remote  http://${ADDRESS}:8271  WITH NAME  remote1

*** Variables ***
${ADDRESS}  127.0.0.1
${test_device}  remote0

*** Test Cases ***
Count Items in Directory on both machines
	# when you need to use variable to design which server to go, you need to use "Run Keyword"
    ${items1} =  Run Keyword  ${test_device}.Count Items In Directory  ${CURDIR}
    ${items2} =  remote0.Count Items In Directory  ${TEMPDIR}
    Log  ${items1} items in '${CURDIR}' and ${items2} items in '${TEMPDIR}'

    ${items1} =  remote0.Count Items In Directory  ${CURDIR}
    ${items2} =  remote0.Count Items In Directory  ${TEMPDIR}
    Log  ${items1} items in '${CURDIR}' and ${items2} items in '${TEMPDIR}'

Failing Example
    remote0.Strings Should Be Equal  Hello  Hello
    
Check Folder Size
    ${size} =  remote0.Get Size Folder  /tmp
    log to console  ${\n}size : ${size}
    # let's check that we don't have more than 100Mo in our tmp folder
    Should be true  ${size} < 100000000