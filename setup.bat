@echo off
title Qiskit Ready Setup

echo Creating virtual environment...
python -m venv .venv
if errorlevel 1 goto failed

echo Installing requirements...
.venv\Scripts\python.exe -m pip install --upgrade pip
if errorlevel 1 goto failed

.venv\Scripts\python.exe -m pip install -r requirements.txt
if errorlevel 1 goto failed

echo Registering Jupyter kernel...
.venv\Scripts\python.exe -m ipykernel install --user --name qiskit-ready --display-name "Python (Qiskit Ready)"
if errorlevel 1 goto failed

echo.
echo Qiskit setup completed successfully!
pause
exit /b 0

:failed
echo.
echo Setup failed. Check the error messages.
pause
exit /b 1