/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_getVehicles.sqf
	Author: Florian "Fank" Kinder

	Description:
	Sends a request to query the database information and returns vehicles
	for the players side.
*/
private ["_player","_vehicleType","_playerFaction","_vehicles"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicleType = [_this,1,0,[0]] call BIS_fnc_param;

if (_player == objNull) exitWith {};

_playerFaction = faction _player;
if (!(_playerFaction in ["BLU_F","OPF_F","IND_F"])) exitWith {};

_vehicles = [_playerFaction,_vehicleType] call Database_fnc_queryVehicles;
[[_vehicles], "BGD_fnc_showVehicles", (owner _player)] spawn BIS_fnc_MP;