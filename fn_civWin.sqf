systemchat str "CIVS HELD THE HOSTAGE AND WON!!!";
["The cops failed to rescue the hostage!"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
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
