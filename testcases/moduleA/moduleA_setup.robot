*** Settings ***
Resource  module_shared_env.robot

*** Keywords ***
moduleA_setup
    LOG  "This is Setup of module A"
	LOG  ${ENV1}
	