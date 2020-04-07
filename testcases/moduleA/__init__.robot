*** Settings ***
Resource  moduleA_setup.robot
Resource  moduleA_teardown.robot
Suite Setup  moduleA_setup
Suite Teardown  moduleA_teardown