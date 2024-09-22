{
	if (_x != ((group player) getVariable "regArs")) then {[_x, false] call ace_arsenal_fnc_removeBox; _x lockInventory true;};
} forEach [ss_nederland_ars,msbr200_ars,volki_ars,vdd98_ars,obrspn346_ars,espanyola_ars,pyatnashka_ars,odshbr11_ars,odshbr80_ars,kraken_ars,artan_ars,opsn3_ars,ombr67_ars,psu_ars,oshb5_ars,obrspn3_ars,bars13_ars,ombr56_ars];