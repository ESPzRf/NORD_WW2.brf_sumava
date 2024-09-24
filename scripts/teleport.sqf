wer addAction ["<t color='#601ECC'>Запросить перемещение на Базу Люфтваффе</t>",{titleCut ["Перемещение...","BLACK IN",5]; player setposatl [getpos pilotwer2 select 0, getpos pilotwer2 select 1, getposatl pilotwer2 select 2]},"",1,false,true,"","_this distance _target < 4"];
wer2 addAction ["<t color='#601ECC'>Запросить перемещение на Базу Вермахта</t>",{titleCut ["Перемещение...","BLACK IN",5]; player setposatl [getpos pilotwer select 0, getpos pilotwer select 1, getposatl pilotwer select 2]},"",1,false,true,"","_this distance _target < 4"];
sov addAction ["<t color='#601ECC'>Запросить перемещение на Базу ВВС РККА</t>",{titleCut ["Перемещение...","BLACK IN",5]; player setposatl [getpos pilotsov2 select 0, getpos pilotsov2 select 1, getposatl pilotsov2 select 2]},"",1,false,true,"","_this distance _target < 4"];
sov2 addAction ["<t color='#601ECC'>Запросить перемещение на Базу РККА</t>",{titleCut ["Перемещение...","BLACK IN",5]; player setposatl [getpos pilotsov select 0, getpos pilotsov select 1, getposatl pilotsov select 2]},"",1,false,true,"","_this distance _target < 4"];

if ((group player !=shtab) && (group player !=luftka)) then {wer hideObjectGlobal true;};
if ((group player !=shtab) && (group player !=luftka)) then {wer2 hideObjectGlobal true;};
if ((group player !=shtabnumbatwo) && (group player !=vvssovkov)) then {sov hideObjectGlobal true;};
if ((group player !=shtabnumbatwo) && (group player !=vvssovkov)) then {sov2 hideObjectGlobal true;};