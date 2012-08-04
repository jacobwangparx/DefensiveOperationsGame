@echo off

:: PARAMETERS YOU CAN SET

:: Enter the module's title here
SET title="Robotlegs Test"

:: These values are used in imsmanifest.xml
SET orgId="ROBOT_LEGS_ORG_ID"
SET itemId="ROBOT_LEGS_ITEM_ID"
SET itemRef="ROBOT_LEGS_ITEM_REF"

:: END OF PARAMETERS

:: Copying files into the bin folder
COPY index.html ..\bin
COPY imsmetadata.xml ..\bin
COPY adlcp_rootv1p2.xsd ..\bin
COPY ims_xml.xsd ..\bin
COPY imscp_rootv1p1p2.xsd ..\bin
COPY imsmd_rootv1p2p1.xsd ..\bin
COPY imsmanifestTop.txt ..\bin
COPY imsmanifestBottom.txt ..\bin
COPY BatchSubstitute.bat ..\bin

:: Copying js folder into bin
CD..
CD bin
MD js
CD..
CD scormBatch

XCOPY /Y js ..\bin\js

:: Inserting title into index.html and imsmetadata.xml
CALL BatchSubstitute.bat "[TITLE]" %title% index.html > ..\bin\index.html
CALL BatchSubstitute.bat "[TITLE]" %title% imsmetadata.xml > ..\bin\imsmetadata.xml

CD..
CD bin

DEL BatchSubstitute.bat

:: Now to put the imsmanifest file together

:: Inserting title
for /f "tokens=1,* delims=]" %%A in ('"type imsmanifestTop.txt|find /n /v """') do (
    set "line=%%B"
    if defined line (
        call set "line=echo.%%line:[TITLE]=%title%%%"
        for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X >> temp0.txt
    ) ELSE echo. >> temp0.txt
) 

:: Inserting orgId
for /f "tokens=1,* delims=]" %%A in ('"type temp0.txt|find /n /v """') do (
    set "line=%%B"
    if defined line (
        call set "line=echo.%%line:[ORG_ID]=%orgId%%%"
        for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X >> temp1.txt
    ) ELSE echo. >> temp1.txt
) 

:: Inserting itemId
for /f "tokens=1,* delims=]" %%A in ('"type temp1.txt|find /n /v """') do (
    set "line=%%B"
    if defined line (
        call set "line=echo.%%line:[ITEM_ID]=%itemId%%%"
        for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X >> temp2.txt
    ) ELSE echo. >> temp2.txt
) 

:: Inserting itemRef
for /f "tokens=1,* delims=]" %%A in ('"type temp2.txt|find /n /v """') do (
    set "line=%%B"
    if defined line (
        call set "line=echo.%%line:[ITEM_REF]=%itemRef%%%"
        for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X >> temp3.txt
    ) ELSE echo. >> temp3.txt
) 

:: Removing quotation marks from the ids

for /f "tokens=1,* delims=]" %%A in ('"type temp3.txt|find /n /v """') do (
    
	set "line=%%B"
	
	if defined line (
		call set "line=echo.%%line:"=%%"
		for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X >> topHalf.txt
	) ELSE echo. >> topHalf.txt

) 

DEL temp0.txt
DEL temp1.txt
DEL temp2.txt
DEL temp3.txt

:: Next, we're putting together a list of all the file names in the bin folder
SETLOCAL ENABLEDELAYEDEXPANSION

FOR %%i IN (*.*) DO (
	if NOT %%i==scorm.bat (
		if NOT %%i==imsmanifestBottom.txt (
			if NOT %%i==imsmanifestTop.txt (
				if NOT %%i==topHalf.txt (
					if NOT %%i==BatchSubstitute.bat (
						echo "		<file href='%%i'/>" >> fileNamesWithQuotes.txt
					)
				)
			)
		)
	)
)

for /f "tokens=1,* delims=]" %%A in ('"type fileNamesWithQuotes.txt|find /n /v """') do (
    
	set "line=%%B"
	
	if defined line (
		call set "line=echo.%%line:"=%%"
		for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X >> fileNames.txt
	) ELSE echo. >> fileNames.txt

) 

DEL fileNamesWithQuotes.txt

:: We also need to get a list of files in subfolders
FOR /d %%i IN (*.*) DO (

	SET dirName=%%i
	
	if NOT %%i==bin (

		echo. dirFileNamesWithQuotes.txt
		
		cd %%i
		FOR %%j IN (*.*) DO echo "		<file href='%%i/%%j'/>" >> dirFileNamesWithQuotes.txt
		
		echo. dirFileNames.txt
		for /f "tokens=1,* delims=]" %%A in ('"type dirFileNamesWithQuotes.txt|find /n /v """') do (
			set "line=%%B"
			if defined line (
				call set "line=echo.%%line:"=%%"t
				for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X >> dirFileNames.txt
			) ELSE echo. >> dirFileNames.txt
		) 
		
		move dirFileNames.txt ..\
		DEL dirFileNamesWithQuotes.txt
		
		cd..
		
		COPY /b fileNames.txt+dirFileNames.txt fileNames.txt
		
		DEL dirFileNames.txt
		
	)
	
)

:: Last, we'll put the information we've gathered to generate imsmanifest.xml
echo. > imsmanifest.xml
COPY /b topHalf.txt+fileNames.txt+imsmanifestBottom.txt imsmanifest.xml

DEL fileNames.txt
DEL topHalf.txt
DEL imsmanifestBottom.txt
DEL imsmanifestTop.txt

CD..
CD scormBatch

:EOF
