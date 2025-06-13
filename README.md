# Install

- This automatic seeding scipt only works for Windows and the steam application of Hell Let Loose currently.
- Delete all Intro Movies from your game folders. The movies are in  "*YourSteamInstallPath*\\steamapps\common\Hell Let Loose\HLL\Content\Movies"
- You must have one of the following monitor resolutions for the seeding script to work:
  - 1920 x 1080
  - 2560 x 1440
  - 3840 x 2160
  - 2560 x 1080
  - 3440 x 1440
  - 5120 x 2160
- If you do not have one of these resolutions you will have this error box appear.
  
![first](https://github.com/waterjugs/SYN-AUTO-SEEDING-SCRIPT/blob/screenshots/Game%20Resolution%20Error.png)
 

- Download the latest release from the [releases](https://github.com/waterjugs/SYN-AUTO-SEEDING-SCRIPT/releases) page.
- Extract the zip file
- Double click on `enable.bat` to run
- Click the `More info` button on defender pop up
> Why are you seeing this pop up? Because I am not paying microsoft for a certificate to run this script. If you have concerns about the code you can check all of the exe files in notepad++. The exe files have the instructions they execute at the bottom of the file. 
  
![second](https://github.com/waterjugs/SYN-AUTO-SEEDING-SCRIPT/blob/screenshots/Windows%20Security%2001.png)

- Click `Run anyway`

![third](https://github.com/waterjugs/SYN-AUTO-SEEDING-SCRIPT/blob/screenshots/Windows%20Security%2002.png)

- Go to "C:\users\\*youruserprofile*\hll-seq-seed"
- Repeat these same steps for `script.bat`
- At this point you should be able to open up your Windows Task Scheduler and see the newly created task `SYN seed`
- You can find your Windows Task Scheduler by hitting the windows key and typing "Task" then clicking on the "Task Schduler"
![task](https://github.com/waterjugs/SYN-AUTO-SEEDING-SCRIPT/blob/screenshots/Syn%20Task.png)
  
- Even if you start late you will still be helping out! The task skips over already seeded servers so dont be afraid to start it manualy whenever you can if thats what you want to do.
- You can manually launch the bot by going to the instal directory "C:\users\\*youruserprofile*\hll-seq-seed" and launching script.bat

IF YOU WANT YOUR COMPUTER TO GO TO SLEEP AFTER SEEDING!

- Go to the install directory should be "C:\users\\*youruserprofile*\hll-seq-seed"
- Find the script.bat file.
- Right Click the file and select "edit in Notepad"
- Go to the end of the file
- Delete the letters "REM" and the space.

It should now read like 


> echo Putting the PC to sleep... <br>
> powercfg -h off <br>
> rundll32.exe powrprof.dll,SetSuspendState 0,1,0 <br>
> powercfg -h on <br>


- It should put your computer to sleep after seeding now.

IF YOU WANT YOUR COMPUTER TO WAKE UP FROM SLEEP <br>

-The task is already setup to wake up your computer from sleep, but you must be logged into your computer with your user account running the bot when you put it to sleep. <br>
-There is unfortunately no way to make the task login after a restart. This is a security decision made by Microsoft.<br>
-If you computer is not waking from sleep after you are logged in and put it to sleep make sure the Windows settings below are set. <br>
-You need to go to "Control Panel" then "Hardware and Sound" then "Power Options" then "Edit Power Plan". <br>
-On the power plan page click "Change advanced power settings". <br>
-Make sure that the circled setting is set to "Enable" on all plans from the drop down shown as "Balanced [Active]" in the screenshot. 
![Power Plan](https://github.com/waterjugs/SYN-AUTO-SEEDING-SCRIPT/blob/screenshots/Power%20Plan%20Settings.png) <br>
<br>
-Next Open "Settings" <br>
-Go to "Accounts" on the left window. <br>
-In the main right window go to "Sign-In options" with the key icon <br>
-Scroll to "Additional Settings" Make sure "If you've been away, when should Windows require you to sign in again?" Is set to "Never" as below. 
![Account Settings](https://github.com/waterjugs/SYN-AUTO-SEEDING-SCRIPT/blob/screenshots/Account%20Setting.png)
