comment "data for weapons";
weaponData=[
["weapon_rim116Launcher","magazine_Missile_rim116_x21",[[-1,21,2]]],
["missiles_Jian","4Rnd_LG_Jian",[[-1,4,1]]],
["conmis_arc","ConMisarc_mag",[[-1,8,2]]],
["SmokeLauncher","SmokeLauncherMag",[[-1,2,20]]],
["CMFlareLauncher","300Rnd_CMFlare_Chaff_Magazine",[[-1,300,10]]],
["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,400,10]]],
["Laserdesignator_pilotCamera","Laserbatteries",[[-1,1,1]]]
];



comment "For each weapon";
for [{_i=0}, {_i<(count weaponData)}, {_i=_i+1}] do
{
itemList=weaponData select _i;
itemWeapon=itemList select 0;
itemMagType=itemList select 1;
itemSeats=itemList select 2;


comment "for each seat";
for [{_j=0}, {_j<(count itemSeats)}, {_j=_j+1}] do
{

seatData=itemSeats select _j;
seatIndex=seatData select 0;
seatAmmoPerMag=seatData select 1;
seatMags=seatData select 2;

_this  addWeaponTurret[itemWeapon, [seatIndex]];
comment "adds mags";
for [{_k=0}, {_k<(seatMags)}, {_k=_k+1}] do
{
_this  addMagazineTurret [itemMagType ,[seatIndex],seatAmmoPerMag];

};



};


};

comment "gets health";
_this   addAction ["<t color='#00FF00'>Damage Report</t>",
{


hint parseText format["<t color='#0099FF'> Damage status is :%1</t>",((1-(damage (_this  select 0)))*100)];

},[1],0,false,true,""," driver  _target == _this "];




comment "Increment Throttle";
_this  addAction ["<t color='#0000FF'>Increment Throttle--------U16</t>",
{
(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))+.01);

},[1],0,false,true,"User16","driver  _target == _this"];

comment "Decrement Throttle";
_this  addAction ["<t color='#FF0000'>Decrement Throttle--------U17</t>",
{
(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))-0.01);	

},[1],0,false,true,"User17","driver  _target == _this"];
