REM robotframe work prove of concept 
SET PYTHON_HOME=D:\Python\Python37
SET PATH=%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%PATH%
REM robot searches resource or variable files in the python path
SET PYTHONPATH=.\robotfirst;.\common_keywords;.\testenv
del *.html 
del *.xml
python robotfirst/ExampleRemoteLibrary.py