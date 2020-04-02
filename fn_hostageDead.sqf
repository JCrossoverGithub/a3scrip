hostagemissionrunning = false;
["The hostage has been killed!!"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
sleep 5;
deleteVehicle hostageai;
sleep 60;

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
