*** Settings ***
Library    MyScopedLib
Resource       machines.robot
Resource       moduleA/common.robot
Variables       machines.yaml

Resource      moduleA_setup.robot
Test Setup     moduleA_setup
Resource      moduleA_teardown.robot
Test Teardown  moduleA_teardown


*** Test Cases ***
My TestKKK
	[Tags]     Level-BVT   USER-XXX
	bump_global_count
    log To Console  ${Environment1.PC0}
	LOG  ${User}
	LOG  222:111:333:22
	${ret_id} =  get_global_count
	LOG   ${ret_id}