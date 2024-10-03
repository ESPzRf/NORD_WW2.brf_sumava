[] execVM "onPlayerRespawn.sqf";

_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};
[] spawn _EndSplashScreen;
//////////////////////////////////////////////////////

// Add EH
waitUntil{!(isNull player)};
waitUntil{local player};

if(!hasInterface) exitWith {}; // If headless then exit

[] execVM "intro\introtext.sqf";
[] execVM "sherpa_scripts\ini_zeus.sqf";
[] execVM "onPlayerConnected.sqf";
[] execVM "sherpa_scripts\ini_safeZone.sqf";
[] execVM "scripts\teleport.sqf";
0 spawn {[] execVM "sherpa_scripts\ini_arsenalRestrict.sqf"};
