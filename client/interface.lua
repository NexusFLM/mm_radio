if Shared.Core == 'qb' then
	QBCore = exports['qb-core']:GetCoreObject()
elseif Shared.Core == 'esx' then
	ESX = exports['es_extended']:getSharedObject()
end

Radio = {
	playerServerID = GetPlayerServerId(PlayerId()),
	PlayerJob = 'civilian',
	PlayerGang = 'none',
	PlayerDuty = false,
	hasRadio = false,
	onRadio = false,
	usingRadio = false,
	PlayerItems = {},
	RadioChannel = 0,
	radioProp = 0,
	Volume = 30,
	favourite = {},
	recomended = {},
	street = "Unknown",
	talkingList = {},
	locale = lib.getLocales(),
	userData = json.decode(GetResourceKvpString('radioSettings')) or {
		favourite = {},
		playerlist = {
			show = false,
			coords = {
				x = 15.0,
				y = 40.0
			}
		}
	}
}

if not Radio.userData.favourite then
	DeleteResourceKvp('radioSettings')
	Radio.userData = {
		favourite = {},
		playerlist = {
			show = false,
			coords = {
				x = 15.0,
				y = 40.0
			}
		}
	}
end

if not Shared.Ready then
	return error('UI has not been built, refer to the readme or download a release build.\n	^3https://github.com/SOH69/mm_radio/releases/', 0)
end