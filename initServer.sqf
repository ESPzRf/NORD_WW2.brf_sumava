if (isServer) then {
	[] execVM "scripts\ehKillCrew.sqf";
	[] spawn {
		execVM "sherpa_scripts\ini_markerFPS.sqf"
	};
	[] execVM "sherpa_scripts\ini_zeus.sqf";
	};
	
[{[false, 10] call grad_persistence_fnc_saveMission}, 600, []] call CBA_fnc_addPerFrameHandler;
