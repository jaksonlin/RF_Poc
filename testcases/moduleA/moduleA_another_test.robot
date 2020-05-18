*** Settings ***
Library    MyScopedLib
Resource       machines.robot
Resource       moduleA/common.robot
Variables       machines.yaml

*** Test Cases ***
My TestKKK
	bump_global_count
    LOG  ${Environment1.PC0}
	LOG  ${User}
	LOG  222:111:333:22
	${ret_id} =  get_global_count
	LOG   ${ret_id}