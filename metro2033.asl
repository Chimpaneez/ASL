/** 
 * Metro2033.asl - An ASL script for LiveSplit for the game Metro 2033 (Steam version, not Redux)
 * @author  Ekelbatzen
 * @version 1 on June 3rd 2016
 */
  
// Declare variables to watch via pointers and addresses in RAM
state("metro2033") {
    int stateIsLoading : 0x616960; // 3 means ingame, other values means something else like in menu
	int stateLevel :     0x641814; // Maybe a level id code?
	int bossState :      0x614F78, 0x8, 0x24; // 1 if boss is alive, 2 if dead
}

startup {
    vars.levelcodeMenu = 0;
    vars.levelcodeBoss = 32;
	vars.bossStateDead = 2;
	vars.isIngameCode = 3;
}

// Returns True when split should be done
split {
	bool isNotStarting = old.stateLevel != vars.levelcodeMenu;
	bool isNormalSplit = isNotStarting && current.stateLevel != old.stateLevel;
	
	bool isLastLevel = current.stateLevel == vars.levelcodeBoss;
	bool isBossDead = current.bossState == vars.bossStateDead;
	bool isBossSplit = isNotStarting && isLastLevel && isBossDead;
	
	return isNormalSplit || isBossSplit;
}

// Returns True while game timer should be paused, False to continue
isLoading {
	// stateLevel 0 is main menu, stateIsLoading 3 means being ingame
    return current.stateIsLoading != vars.isIngameCode || current.stateLevel == vars.levelcodeMenu;
}
