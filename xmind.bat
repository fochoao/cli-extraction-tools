@REM chcp 65001  

echo %0 %1 %2

if [%1]==[] (
    echo "empty arg1" 
	exit /b -1
)
if [%2]==[] (
    echo "empty arg2" 
	exit /b -1
)

:: %0: bat, %1: full_input_path, %2: output_dir
.\7z.exe -y e %1 "Thumbnails\thumbnail.png" -o"%2"

if not exist "%2\thumbnail.png" (
	exit /b -1
)

:: find folder_name
for /f "delims==" %%F in ("%2") do set folder_name=%%~nF
echo %folder_name%

:: rename
ren "%2\thumbnail.png" "%folder_name%.png"

:: move 
move "%2\%folder_name%.png" "%2\..\%folder_name%.png"

:: rm folder
RMDIR /S /Q "%2"

exit /b 0