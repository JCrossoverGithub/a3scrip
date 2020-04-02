removeAllActions player; //Need to use a different method as this could remove other addactions not relevant to hostage
player switchMove "AcinPercMstpSrasWrflDnon";
hostageai switchMove "AinjPfalMstpSnonWnonDnon_carried_Down";
detach hostageai;
player switchMove "";
hostageai switchMove "";

hostageai addAction
[
    "Carry Hostage",
    {
        call JM_fnc_CarryHostage;
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
