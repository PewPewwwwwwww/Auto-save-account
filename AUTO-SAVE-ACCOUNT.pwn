# Auto-save-account
Pawn
//AUTOSAVE SYSTEM\\
pogi Peww

#define AUTO_MESSAGE_TIME 5 // Minutes


//search mo forward SetScriptSkin(playerid, skinid);

new AutoMessages[][] =
{
	"[SYSTEM]: "WHITE"Your account has been automatically saved in the database.",
	"[SYSTEM]: "WHITE"Your account has been automatically saved in the database."
};

forward AutoMessage();
public AutoMessage() {

	new string[203];
	format(string, sizeof(string), "%s", AutoMessages[random(sizeof(AutoMessages))]);
	foreach(Player, i)
	{
	    if(PlayerInfo[i][pLevel] < 100)
	    {
			SendClientMessage(i, COLOR_YELLOW, string);
		}
	}
	return 1;
}

forward AutoSave();
public AutoSave()
{
    foreach(new i : Player)
	SavePlayerVariables(i);
	new rand = random(sizeof(AutoMessages));
    SendClientMessageToAll(SERVER_COLOR, AutoMessages[rand]);
    print("[SYSTEM] Database sucessfully saved");
	return 1;
}

//search mo public OnGameModeInit()

SetTimer("AutoSave",60*1000*AUTO_SAVE_TIME,1);
SetTimer("AutoMessage",60*1000*AUTO_MESSAGE_TIME,1);
