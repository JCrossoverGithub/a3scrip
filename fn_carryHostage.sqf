player switchMove "AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon";
hostageai switchMove "AinjPfalMstpSnonWnonDnon_carried_Up";
hostageai attachTo [player, [-0.56,0.26,-0.12], ""];
removeAllActions hostageai;

player addAction
[
    "Drop Hostage",
    {
        call JM_fnc_DropHostage;
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
