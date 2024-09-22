if (isServer) then {
	[] execVM "scripts\ehKillCrew.sqf";
	[] spawn {
		execVM "sherpa_scripts\ini_markerFPS.sqf"
	};
	[] execVM "sherpa_scripts\ini_zeus.sqf";
	};