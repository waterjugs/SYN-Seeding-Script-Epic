@echo off
for /f "delims=" %%x in (confige.txt) do (set "%%x")
echo Checking to see if HLL is running...
set "APPLICATION=HLLEpicGamesStore-Win64-Shipping.exe"
echo Launching Seed...
echo.
echo Checking Player counts ..

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count_by_team.allied"`) do set alliedcountSYN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count_by_team.axis"`) do set axiscountSYN=%%i

IF NOT DEFINED axiscountSYN goto ServerDownSYN
IF DEFINED axiscountSYN goto ServerUpSYN
:ServerDownSYN
echo Server is Down. Skipping to next Server
goto CTRLSEED
:ServerUpSYN
echo.Allied Faction has %alliedcountSYN% players
echo.Axis Faction has %axiscountSYN% players
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count"`) do set countSYN=%%i
echo.Player Count %countSYN%
If %countSYN% gtr %SEEDED_THRESHOLD% (
goto CTRLSEED
)

if %alliedcountSYN% leq %axiscountSYN% (
echo Launching as Allies. Time to Launch 4.5 Minutes.
SpawnSLe.exe Allied "Syndicate | US East"
timeout /t 10 >nul
goto SYNloop
) else (
echo Launching as Axis. Time to Launch 4.5 Minutes.
SpawnSLe.exe Axis "Syndicate | US East"
timeout /t 10 >nul

goto SYNloop
)



:SYNloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count"`) do set countSYN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.time_remaining"`) do set timeSYN=%%i
for /f "tokens=1,2 delims=." %%a  in ("%timeSYN%") do (set timeSYN=%%a)
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count_by_team.allied"`) do set alliedcountSYN=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLSYN% ^| %JQ_PATH% -r ".result.player_count_by_team.axis"`) do set axiscountSYN=%%i

if %countSYN% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countSYN%. Waiting 30 seconds...
	echo Timeleft: %timeSYN%
	if %timeSYN% geq 5280 (
	echo New Map.
		if %alliedcountSYN% leq %axiscountSYN% (
		echo Spawning
		ReSpawnSLe.exe Allied
		) else (
		echo Spawning
		ReSpawnSLe.exe Axis
		)
	timeout /t 120 >nul
	goto SYNloop
	) else (
    timeout /t 30 >nul
    goto SYNloop
)
)

:endloop
altf4e.exe
echo Waiting for HLL to Close.
timeout /t 60 >nul
:CTRLSEED
echo Server is seeded. Onto CTRL
echo Launching Seed...
echo.
echo Checking Player counts ..

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count_by_team.allied"`) do set alliedcountCTRL=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count_by_team.axis"`) do set axiscountCTRL=%%i

IF NOT DEFINED axiscountCTRL goto ServerDownCTRL
IF DEFINED axiscountCTRL goto ServerUpCTRL
:ServerDownCTRL
echo Server is Down. Skipping to end.
goto endloop
:ServerUpCTRL
echo.Allied Faction has %alliedcountCTRL% players
echo.Axis Faction has %axiscountCTRL% players
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count"`) do set countCTRL=%%i
echo.Player Count %countCTRL%
If %countCTRL% gtr %SEEDED_THRESHOLD% (
goto endloop
)

if %alliedcountCTRL% leq %axiscountCTRL% (
echo Launching as Allies. Time to Launch 4.5 Minutes.
SpawnSLe.exe Allied "Ctrl Alt Defeat[Hellfire"
timeout /t 10 >nul
goto CTRLloop
) else (
echo Launching as Axis. Time to Launch 4.5 Minutes.
SpawnSLe.exe Axis "Ctrl Alt Defeat[Hellfire"
timeout /t 10 >nul

goto CTRLloop
)



:CTRLloop

for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count"`) do set countCTRL=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.time_remaining"`) do set timeCTRL=%%i
for /f "tokens=1,2 delims=." %%a  in ("%timeCTRL%") do (set timeCTRL=%%a)
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count_by_team.allied"`) do set alliedcountCTRL=%%i
for /f "usebackq delims=," %%i in (`curl -s -X GET %RCON_URLCTRL% ^| %JQ_PATH% -r ".result.player_count_by_team.axis"`) do set axiscountCTRL=%%i

if %countCTRL% gtr %SEEDED_THRESHOLD% (
    echo Player count is greater than %SEEDED_THRESHOLD%.
    goto endloop
) else (
    echo Player count is %countCTRL%. Waiting 30 seconds...
	echo Timeleft: %timeCTRL%
	if %timeCTRL% geq 5280 (
	echo New Map.
		if %alliedcountCTRL% leq %axiscountCTRL% (
		echo Spawning
		ReSpawnSLe.exe Allied
		) else (
		echo Spawning
		ReSpawnSLe.exe Axis
		)
	timeout /t 120 >nul
	goto CTRLloop
	) else (
    timeout /t 30 >nul
    goto CTRLloop
)
)

:endloop

altf4e.exe
echo Waiting for HLL to Close.
timeout /t 60 >nul

echo Putting the PC to sleep...
REM powercfg -h off
REM rundll32.exe powrprof.dll,SetSuspendState 0,1,0
REM powercfg -h on

echo PC is now asleep.
