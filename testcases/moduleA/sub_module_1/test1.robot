*** Settings ***
Library    MyLibrary     10.0.0.1    8080
Library    MyScopedLib
Resource       machines.robot
Resource       moduleA/common.robot
Variables       machines.yaml
Suite Setup     my_suit_setup
Suite Teardown  my_suit_teardown
Test Setup     my_setup
Test Teardown  my_teardown

*** Variables ***
${User}  eth1

*** Test Cases ***
My Test
	bump_global_count
    send message  Hey John
    ${dict} =  get_a_dict
    Should Be Equal  ${dict["a"]}  1
    Should Be Equal  ${dict["b"].port}  ${8080}
    ${item} =  get conn
    Should Be Equal  ${item.host}  10.0.0.1
	${ret_id}=  get_global_count
	LOG   ${ret_id}

My Test2
    [Setup]     my_lib_setup 
    [Teardown]  my_lib_teardown
	bump_global_count
    ${dict} =  get_a_dict
    Should Be Equal  ${dict["c"]}  50000
	${ret_id}=  get_global_count
	LOG   ${ret_id}

My Test3
    [Teardown]  my_teardown_new
    ${dict} =  get_a_dict
    Should Be Equal  ${dict["a"]}  1

My Test4
    send message  Hey John
    my checker2  1  ${8080}
    ${item} =  get conn
    Should Be Equal  ${item.host}  10.0.0.1
    my checker2   1   ${8080}

My Test5
	[Setup]  
    send message  Hey John
    check server config  地址=10.0.0.1  端口=${8080}
    ${item} =  get conn
    Should Be Equal  ${item.host}  10.0.0.1
    check server config   端口=${8080}   地址=10.0.0.1
	check server config  地址=10.0.0.1  端口=${8080}  OTHERINFO=${Hello} #@ 在machines.robot里


My Test6
    LOG  ${Environment1.PC0}
	LOG  ${User}
	
My Test7
    : FOR  ${INDEX}  IN RANGE  1  3  
	\    Log  ${INDEX}
	
My Test8
    ${ITEMS}    CREATE List  Star Trek  Star Wars  Perry Rhodan
    : FOR    ${ELEMENT}  IN  @{ITEMS}
	\    Log    ${ELEMENT}
	\    Run Keyword If  '${ELEMENT}' == 'Star Trek'  my checker2  1  ${8080}
	

*** Keywords ***
my_setup
    LOG  "STARTING TEST...."

my_tear_down
    LOG  "CLEANING TEST...."
	
my_suit_setup
    LOG  "STARTING TEST Suit...."

my_suit_teardown
    LOG  "CLEANING TEST Suit...."

my checker2
    [arguments]  ${a}  ${b}
    ${dict} =  get_a_dict
    Should Be Equal  ${dict["a"]}  ${a}
    Should Be Equal  ${dict["b"].port}  ${b}
