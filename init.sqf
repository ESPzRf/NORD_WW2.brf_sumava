[] call compile preProcessFilelineNumbers "scripts\chat\config.sqf";
[] call compile preProcessFilelineNumbers "scripts\chat\commands.sqf";
[] execVM "scripts\zeus\opened_eh.sqf";
[] execVM "scripts\arsenals.sqf";
//[] execVM "ROS_hitreaction\scripts\ROS_HitReaction.sqf";

pvpfw_chatIntercept_executeCommand = compile preProcessFilelineNumbers "scripts\chat\executeCommand.sqf";

// Reset and old EH IDs and scripthandles
if (!isNil "pvpfw_chatIntercept_handle")then{
	terminate pvpfw_chatIntercept_handle
};
if (!isNil "pvpfw_chatIntercept_EHID")then{
	(findDisplay 24) displayRemoveEventHandler ["KeyDown",pvpfw_chatIntercept_EHID];
	pvpfw_chatIntercept_EHID = nil;
};

pvpfw_chatIntercept_handle = [] spawn {
	private["_equal","_chatArr"];
	
	while{true}do{
		pvpfw_chatString = "";
		
		waitUntil{sleep 0.22;!isNull (finddisplay 24 displayctrl 101)};
		
		pvpfw_chatIntercept_EHID = (findDisplay 24) displayAddEventHandler["KeyDown",{
			if ((_this select 1) != 28) exitWith{false};
			
			_equal = false;
			
			_chatArr = toArray pvpfw_chatString;
			//_chatArr resize 1;
			if ((_chatArr select 0) isEqualTo ((toArray pvpfw_chatIntercept_commandMarker) select 0))then{
				if (pvpfw_chatIntercept_debug)then{
					systemChat format["Intercepted: %1",pvpfw_chatString];
				};
				_equal = true;
				closeDialog 0;
				(findDisplay 24) closeDisplay 1;
				
				[_chatArr] call pvpfw_chatIntercept_executeCommand;
			};
			
			_equal
		}];
		
		waitUntil{
			if (isNull (finddisplay 24 displayctrl 101))exitWith{
				if (!isNil "pvpfw_chatIntercept_EHID")then{
					(findDisplay 24) displayRemoveEventHandler ["KeyDown",pvpfw_chatIntercept_EHID];
				};
				pvpfw_chatIntercept_EHID = nil;
				true
			};
			pvpfw_chatString = (ctrlText (finddisplay 24 displayctrl 101));
			false
		};
	};
};

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	class = missionNamespace getVariable ([(getDescription _unit) select 0, 0]);
	if (class > 0) then {
		missionNamespace setVariable [(getDescription _unit) select 0, class - 1];
	};
}];

addMissionEventHandler ["HandleDisconnect", { false }];

waitUntil {!isNull (findDisplay 46)};
downKeyEH =(findDisplay 46) displayAddEventHandler ["KeyDown", {
    _key = _this select 1;
 
    ["nightVision"] findIf {_key in (actionKeys _x)} >= 0
}]; 

1 enableChannel [false, true];
2 enableChannel [false, false];
4 enableChannel [false, false];
6 enableChannel [false, true];
3 enableChannel [false, false];

CHBN_adjustBrightness = 1;
CHBN_adjustColor = [0.5,0.7,1];
