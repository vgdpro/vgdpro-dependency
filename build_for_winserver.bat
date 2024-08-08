xcopy /E premake\* . /Y
rd build /S /Q
rd bin /S /Q
premake5 vs2022
pause