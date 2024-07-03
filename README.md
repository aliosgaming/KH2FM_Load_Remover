# KH2FM Load Remover for PCSX2 v1.6, PCSX2-EX, and PC

*Created by: AliosGaming and ZakTheRobot*

***DISCLAIMER: This Load Remover is only intended for use during KH2FM Randomizer Races and Practice***

What you need:
 - [Livesplit](https://livesplit.org/) <- Your timer
 - KH2FM Load Remover (PC and EMU) v2.3.asl <- The script you downloaded from this github
 
## How to install:
 
1. Right click your Livesplit window and select "Edit Layout".

2. In the layout editor window press the big "+" button in the top left corner, then hover over "Control" and then click on "Scriptable Auto Splitter" option.

3. "Scriptable Auto Splitter" should now be added to your list in the layout editor. Double click the new "Scriptable Auto Splitter" line to open up its layout settings.

	**NOTE FOR STEP 4: If the script file is moved or deleted after being selected then the load remover will stop working. It's recommended to extract it somewhere safe that you will never have to move it from (like in your KH2 Rando folder) before moving on to Step 5.**
	
4. Click "Browse" on the right side of this window and navigate to your "KH2FM Load Remover.asl" file and select it.
	- If you want the timer to automatically start when you begin a seed (pressing "YES" at the "Begin with these settings" screen in game) then make sure the "Start" option is checkmarked, otherwise you may disable it if you want to manually start your timers.
	
5. You will want two timers in your Livesplit layout in order for the script to work. You can add more timers to your layout by clicking the big "+" button again in the Layout Editor screen and selecting "Timer". Set the "Timing Method" in one timer to "Real Time" and set the other one to "Game Time". "Real Time" will run like normal and will never pause, while "Game Time" will pause during loads and room transitions.

![alt text](https://i.imgur.com/G9Pb7Wh.png)

**NOTE: Be sure to save your layout after setting everything up. If you dont then you will have to go through the process all over again every time you close and re-open livesplit**

6. That is it! Once LiveSplit and your game are both open the script will auto attach to your game. The script will work for Emulator or PC automatically and you don't need to change anything if you swap between the two. If you would like to verify that the script has attached to your game then you can check by opening up the "Scriptable Auto Splitter" settings again and looking to the right of the "Options:" section. You should see a message saying "Game Version:" followed by either "EMULATOR", "EMULATOR-EX", or "GLOBAL" depending on if you are using PCSX2, PCSX2-EX, or PC from the Epic Games Store respectively. 

**TLDR:**
- Add "Scriptable Auto Splitter" to Livesplit
- Choose Script
- Add Timers for "Game Time" and "Real Time" to Livesplit
- Play KH2

