*** Settings ***

Resource       machines.robot
Resource       moduleA/common.robot
Variables       machines.yaml

*** Test Cases ***
My TestKKK
    LOG  ${Environment1.PC0}
	LOG  ${User}