@echo off
setlocal
REM AUDIT: no del, erase, or rmdir commands are used.
set "LOG_FILE=data\log-he-thong.log"
set "REPORT_FILE=backup\bao-cao-su-co.txt"
if not exist "%LOG_FILE%" (
  echo [ERROR] Khong tim thay "%LOG_FILE%".
  exit /b 1
)
if not exist "backup" mkdir "backup"
echo ==================================================>> "%REPORT_FILE%"
echo GREENTECH - BAO CAO SU CO>> "%REPORT_FILE%"
echo Thoi diem: %DATE% %TIME%>> "%REPORT_FILE%"
echo Nguon: %LOG_FILE%>> "%REPORT_FILE%"
echo Bo loc: CRITICAL, ERROR va TIMEOUT>> "%REPORT_FILE%"
echo -------------------------------------------------->> "%REPORT_FILE%"
REM Streaming pipeline; do not load the entire log into a script variable.
type "%LOG_FILE%" | findstr /I /C:"CRITICAL" /C:"ERROR" /C:"TIMEOUT" >> "%REPORT_FILE%"
if errorlevel 1 echo Khong tim thay dong CRITICAL/ERROR/TIMEOUT hoac co loi khi loc.>> "%REPORT_FILE%"
echo.>> "%REPORT_FILE%"
echo [DONE] Da noi ket qua vao "%REPORT_FILE%".
endlocal
