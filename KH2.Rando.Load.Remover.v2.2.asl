state("DUMMY", "NOVERSIONFOUND"){}

state("PCSX2", "EMULATOR")
{
	byte black : "pcsx2.exe", 0x0123E4E4, 0x3B3;
	byte load : "pcsx2.exe", 0x0123E4F4, 0x708;
	uint start : "pcsx2.exe", 0x011E4D78, 0x610;
	uint startup_menus : "pcsx2.exe", 0x0123E53C, 0x3CC;
	byte keyholetransition : "pcsx2.exe", 0x123E4EC, 0x220;
	byte world : "pcsx2.exe", 0x0123E46C, 0xAE0;
	byte room : "pcsx2.exe", 0x0123E46C, 0xAE1;
	byte prevWorld : "pcsx2.exe", 0x0123E46C, 0xB10;
	byte prevRoom : "pcsx2.exe", 0x0123E46C, 0xB11; 
	byte btlend : "pcsx2.exe", 0x01244CE4, 0xC0;
}

state("KINGDOM HEARTS II FINAL MIX", "GLOBAL")
{
	byte black : "KINGDOM HEARTS II FINAL MIX.exe", 0xAB8BC7;
	byte loadscreen: "KINGDOM HEARTS II FINAL MIX.exe", 0x741320;
	bool load : "KINGDOM HEARTS II FINAL MIX.exe", 0x8E9DA3;
	uint start : "KINGDOM HEARTS II FINAL MIX.exe", 0x00BEBD90, 0x1AC;
	uint roomTransition : "KINGDOM HEARTS II FINAL MIX.exe", 0x715568;
	byte world : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DB8;
	byte room : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DB9;
	byte prevWorld : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DE8;
	byte prevRoom : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DE9;
	byte btlend : "KINGDOM HEARTS II FINAL MIX.exe", 0x2A0D3E0;
}

state("KINGDOM HEARTS II FINAL MIX", "RE-FINED")
{
	byte black : "KINGDOM HEARTS II FINAL MIX.exe", 0xAB8BC7;
	byte loadscreen: "KINGDOM HEARTS II FINAL MIX.exe", 0x741320;
	bool load : "KINGDOM HEARTS II FINAL MIX.exe", 0x8E9DA3;
	uint start : "KINGDOM HEARTS II FINAL MIX.exe", 0x00BEBD90, 0x1AC;
	uint roomTransition : "KINGDOM HEARTS II FINAL MIX.exe", 0x715568;
	byte world : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DB8;
	byte room : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DB9;
	byte prevWorld : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DE8;
	byte prevRoom : "KINGDOM HEARTS II FINAL MIX.exe", 0x714DE9;
	byte btlend : "KINGDOM HEARTS II FINAL MIX.exe", 0x2A0D3E0;
}

state("PCSX2", "EMULATOR-EX")
{
	byte black : "pcsx2.exe", 0x0127F8A4, 0x3B3;
	byte load : "pcsx2.exe", 0x127F8B4, 0x708;
	uint start : "pcsx2.exe", 0x01266D78, 0x660;
	uint startup_menus : "pcsx2.exe", 0x127F8FC, 0x3CC;
	byte keyholetransition : "pcsx2.exe", 0x127F8AC, 0x220;
	byte world : "pcsx2.exe", 0x0127F82C, 0xAE0;
	byte room : "pcsx2.exe", 0x0127F82C, 0xAE1;
	byte prevWorld : "pcsx2.exe", 0x0127F82C, 0xB10;
	byte prevRoom : "pcsx2.exe", 0x0127F82C, 0xB11;
	byte btlend : "pcsx2.exe", 0x012860A4, 0xC0;
}

init
{
	vars.infinalfights = 0;
	if(modules.First().ModuleMemorySize == 46305280 || modules.First().ModuleMemorySize == 58462208){
		version = "GLOBAL";
		refreshRate = 60;
	}
	else if(modules.First().ModuleMemorySize == 47538176){
		version = "EMULATOR";
		refreshRate = 60;
	}
	else if(modules.First().ModuleMemorySize == 47816704) {
		version = "EMULATOR-EX";
		refreshRate = 60;
	}
	else if(game.MainWindowTitle.Contains("Re:Fined")) {
		version = "RE-FINED";
		refreshRate = 60;
	}
	else {
		version = "NOVERSIONFOUND";
	}
}

start 
{
	if (version=="EMULATOR") {
		if (current.startup_menus == 0 && old.startup_menus == 2) {
			if (current.start == 2844832) {
				return true;
			}
		}
	}
	else if (version=="GLOBAL" || version=="RE-FINED") {
		if (current.start == 0 && old.start == 132) {
			return true;
		}
	}
	else if (version=="EMULATOR-EX") {
		if (current.startup_menus == 0) {
			if (current.start == 2844832) {
				return true;
			}
		}
	}
}

isLoading
{
	if (version=="EMULATOR" || version=="EMULATOR-EX") {
		if(current.prevWorld==4 && current.prevRoom==26){
			if(current.black==128){
				return true;
			}
			if(current.black==0 && current.load !=0){
				return true;
			}
		}
		if(current.prevWorld!=4 && current.prevRoom!=26) {
			return ((current.black == 128 || current.load != 0) && current.keyholetransition==0);
		}
		return false;
	}
	else if (version=="GLOBAL" || version=="RE-FINED") {
		return (current.black == 128 || current.load && current.loadscreen != 3);
	}
}

split
{
	if (version=="EMULATOR" || version=="EMULATOR-EX") {
		if(vars.infinalfights==0) {
			if(current.world==18 && current.room==25) {
				vars.infinalfights=1;
			}
		}
		if(vars.infinalfights==1) {
			if(old.btlend!=4 && current.world==18 && current.room==20 && current.btlend==4) {
				return (true);
			}
		}
	}
	else if (version=="GLOBAL" || version=="RE-FINED") {
		if(vars.infinalfights==0) {
			if(current.world==18 && current.room==25) {
				vars.infinalfights=1;
			}
		}
		if(vars.infinalfights==1) {
			if(old.btlend!=4 && current.world==18 && current.room==20 && current.btlend==4) {
				return (true);
			}
		}
	}
}

exit
{
	timer.IsGameTimePaused = true;
}
