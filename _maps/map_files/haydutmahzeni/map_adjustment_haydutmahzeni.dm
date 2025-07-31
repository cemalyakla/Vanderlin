/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/

/datum/map_adjustment/haydutmahzeni
	map_file_name = "haydutmahzeni.dmm"
	blacklist = list(
		/datum/job/shophand,
		/datum/job/gatemaster,
		/datum/job/steward,
		/datum/job/minor_noble,
		/datum/job/archivist,
		/datum/job/butler,
		/datum/job/veteran,
		/datum/job/undertaker,
		/datum/job/royalknight,
		/datum/job/courtphys,
		/datum/job/butcher,
		/datum/job/jester,
		/datum/job/innkeep,
		/datum/job/tailor,
		/datum/job/apothecary,
		/datum/job/merchant,
		/datum/job/grabber,
		/datum/job/vagrant,
		/datum/job/forestguard,
		/datum/job/forestwarden,
		/datum/job/dungeoneer,
		/datum/job/jailor,
		/datum/job/weaponsmith,
		/datum/job/armorsmith,
		/datum/job/gaffer_assistant,
		/datum/job/feldsher,
		/datum/job/adventurer,
		/datum/job/mercenary,
		/datum/job/artificer,
		/datum/job/adept,
		/datum/job/carpenter,
		/datum/job/hunter,
		/datum/job/bard,
		/datum/job/bapprentice,
		/datum/job/miner,
		/datum/job/fisher,
		/datum/job/farmer,
		/datum/job/orphan,
		/datum/job/men_at_arms,
		/datum/job/tapster,
		/datum/job/lord,
		/datum/job/prince,
		/datum/job/hand,
		/datum/job/consort,
		/datum/job/bandit,
		/datum/job/innkeep_son,
		/datum/job/churchling,
		/datum/job/matron,
		/datum/job/town_elder,
		/datum/job/soilchild,
		/datum/job/magician,
		/datum/job/mageapprentice,
		/datum/job/servant,
		/datum/job/squire,
		/datum/job/gaffer,
		/datum/job/inquisitor,
		/datum/job/templar,
		/datum/job/priest
	)
	// Limited positions to ensure core roles are filled.
	slot_adjust = list(
		/datum/job/cook = 1,
		/datum/job/monk = 1,
		/datum/job/prisoner = 12,
		/datum/job/guardsman = 6,
		/datum/job/captain = 1
	)
