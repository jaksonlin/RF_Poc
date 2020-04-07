*** Keywords ***
check server config
	[Arguments]  ${地址}  ${端口}  ${OTHERINFO}=Default Value
    LOG  "I'm imported checker 3"
    LOG  ${OTHERINFO}
    ${dict} =  get_a_dict
    Should Be Equal  ${dict["b"].host}  ${地址}
    Should Be Equal  ${dict["b"].port}  ${端口}
