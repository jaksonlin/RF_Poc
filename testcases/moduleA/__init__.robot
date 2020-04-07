# 这个init文件会在robot testcases/moduleA的时候被自动执行
# 要注意，测试套有两种模式
# 1. 一个目录是一个测试套，用__init__.robot文件定义该测试套的前后置
# 2. 每一个robot文件，只要有Test Cases区域，都是一个测试套，该测试套与其所在目录的“目录测试套”无关。
# 3. 目录的测试套的作用：设置整个目录开始被执行时的"测试套"-前置以及后置。该前置与后置不影响每一个robot文件内的套/用例前后置
*** Settings ***
Resource  moduleA_setup.robot
Resource  moduleA_teardown.robot
Suite Setup  moduleA_setup
Suite Teardown  moduleA_teardown