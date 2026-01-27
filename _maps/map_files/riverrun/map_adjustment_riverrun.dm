/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/


/datum/map_adjustment/riverrun
	map_file_name = "riverrun.dmm"

	blacklist = list(
		/datum/job/absolver,
		/datum/job/adept,
		/datum/job/orthodoxist,
		/datum/job/guardsman,
		/datum/job/lieutenant,
		/datum/job/shophand,
		/datum/job/steward,
		/datum/job/gatemaster,
		/datum/job/minor_noble,
		/datum/job/archivist,
		/datum/job/butler,
		/datum/job/veteran,
		/datum/job/undertaker,
		/datum/job/courtphys,
		/datum/job/butcher,
		/datum/job/jester,
		/datum/job/tailor,
		/datum/job/apothecary,
		/datum/job/grabber,
		/datum/job/forestguard,
		/datum/job/forestwarden,
		/datum/job/dungeoneer,
		/datum/job/jailor,
		/datum/job/weaponsmith,
		/datum/job/armorsmith,
		/datum/job/gaffer_assistant,
		/datum/job/feldsher,
		/datum/job/adventurer,
		/datum/job/artificer,
		/datum/job/hunter,
		/datum/job/fisher,
		/datum/job/orphan,
		/datum/job/men_at_arms,
		/datum/job/tapster,
		/datum/job/innkeep_son,
		/datum/job/churchling,
		/datum/job/matron,
		/datum/job/town_elder,
		/datum/job/soilchild,
		/datum/job/mageapprentice,
		/datum/job/squire,
		/datum/job/gaffer,
		/datum/job/templar,
		/datum/job/prisoner,
		/datum/job/clinicapprentice,
		/datum/job/cook
	)

	migrant_blacklist = list(
		/datum/migrant_wave/crusade,
		/datum/migrant_wave/grenzelhoft_visit,
	)

	slot_adjust = list(
		/datum/job/royalknight = 1,
		/datum/job/prince = 1,
		/datum/job/monk = 2,
		/datum/job/mercenary = 2,
		/datum/job/vagrant = 2,
		/datum/job/bapprentice = 1,
		/datum/job/farmer = 2,
		/datum/job/miner = 2,
		/datum/job/carpenter = 2,
		/datum/job/mason = 1,
		/datum/job/servant = 2,
		/datum/job/bard = 1
	)
