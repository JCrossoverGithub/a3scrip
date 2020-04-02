private "_timer";
_timer = 600000;
removeAllActions takehostage;
["Someone has taken a hostage! Cops go rescue them!"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];

hostagemissionrunning = true;


"B_RangeMaster_F" createUnit [
getMarkerPos "hostageai_spawn",
group player,
"hostageai = this;",
0,
""
];

hostageai addEventHandler ['killed', {[(_this select 0)] spawn JM_fnc_HostageDead}];


hostageai addAction
[
    "Carry Hostage",
    {
        call JM_fnc_carryHostage;
    },
    [],
    6,
    false,
    true,
    "",
    "side player == CIVILIAN",
    2,
    false,
    "",
    ""
];

while{hostagemissionrunning} do
{
  _timer = _timer - 1;
  hint format ["%1 Seconds Left!", _timer / 10000];
  _spawnpos = markerPos "hostageai_spawn";

  if (hostageai distance _spawnpos > 100) exitWith
    {

      hostagemissionrunning = false;
      ["Cops have rescued the hostage!!"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
      hostageai removeEventHandler ["killed", 0];
      hostageai setDamage 1;
      player switchMove "";
      detach hostageai;
      removeAllActions player;
      hint "";
      sleep 5;
      deleteVehicle hostageai;
      sleep 10;


      takehostage addAction
      [
          "Start Hostage Mission",
          {
              call JM_fnc_hostagestart;
          },
          [],
          6,
          false,
          true,
          "",
          "side player == civilian",
          2,
          false,
          "",
          ""
      ];


    };

    if(_timer == 0) exitWith
    {
      hostagemissionrunning = false;
      call JM_fnc_CivWin;
      hint "";
    };

};
