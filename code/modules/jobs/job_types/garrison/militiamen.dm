/datum/job/militiamen
	title = "Militia-men"
	tutorial = "Hayatını kasabayı savunmaya adamış bir milissin. \
	Lord'unun ve Kaptan'ının emirlerine uymaktan gurur duyuyorsun. \
	Şu sözleri asla unutma; 'Muhafız ölür, ama asla pes etmez!'."
	department_flag = GARRISON
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_MILITIAMEN
	faction = FACTION_TOWN
	total_positions = 4
	spawn_positions = 4
	bypass_lastclass = TRUE

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	allowed_races = RACES_PLAYER_GUARD

	outfit = /datum/outfit/militiamen
	advclass_cat_rolls = list(CTAG_MILITIAMEN = 20)
	give_bank_account = 30
	cmode_music = 'sound/music/cmode/garrison/CombatGarrison.ogg'

	exp_type = list(EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)
	exp_requirements = list(
		EXP_TYPE_LIVING = 300
	)

/datum/job/militiamen/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	spawned.verbs |= /mob/proc/haltyell

/datum/outfit/militiamen
	name = "Militia-men Base"
	cloak = /obj/item/clothing/cloak/tabard/knight/guard
	pants = /obj/item/clothing/pants/trou/leather/splint
	wrists = /obj/item/clothing/wrists/bracers/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	belt = /obj/item/storage/belt/leather/militia
	gloves = /obj/item/clothing/gloves/leather

/datum/outfit/militiamen/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()
	cloak = /obj/item/clothing/cloak/tabard/knight/guard

/datum/outfit/militiamen/post_equip(mob/living/carbon/human/H, visuals_only = FALSE)
	. = ..()
	if(H.cloak && !findtext(H.cloak.name, "([H.real_name])"))
		H.cloak.name = "[H.cloak.name] ([H.real_name])"

/datum/job/advclass/militiamen
	exp_types_granted = list(EXP_TYPE_GARRISON, EXP_TYPE_COMBAT)

//
//
//
//FOOTMAN-CLASS
//
//
//
/datum/job/advclass/militiamen/footman
	title = "Milis Piyadesi"
	tutorial = "Ön saflarda yer alır, kalkanıyla düşmanları savurur. \
	Kalkanın yanında kılıç, balta veya gürz taşırsın."
	outfit = /datum/outfit/militiamen/footman
	category_tags = list(CTAG_MILITIAMEN)

	jobstats = list(
		STATKEY_STR = 1,
		STATKEY_END = 2,
		STATKEY_CON = 1
	)

	skills = list(
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/shields = 3,
		/datum/skill/combat/swords = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_KNOWBANDITS
	)

/datum/outfit/militiamen/footman
	name = "Militia-men Footman"
	head = /obj/item/clothing/head/helmet/kettle
	neck = /obj/item/clothing/neck/coif
	armor = /obj/item/clothing/armor/chainmail/hauberk/iron
	shirt = /obj/item/clothing/armor/gambeson/heavy
	backr = /obj/item/weapon/shield/heater
	backl = /obj/item/storage/backpack/satchel/cloth
	beltr = /obj/item/weapon/sword/short
	beltl = /obj/item/weapon/mace/cudgel
	scabbards = list(/obj/item/weapon/scabbard/sword)
	backpack_contents = list(
		/obj/item/rope/chain = 1
	)
//
//
//
//ARCHER-CLASS
//
//
//
/datum/job/advclass/militiamen/archer
	title = "Milis Okçusu"
	tutorial = "Yayın ve okunla cesur piyade kardeşlerine destek sağlarsın."
	outfit = /datum/outfit/militiamen/archer
	category_tags = list(CTAG_MILITIAMEN)

	jobstats = list(
		STATKEY_PER = 2,
		STATKEY_END = 1,
		STATKEY_SPD = 2
	)

	skills = list(
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/axesmaces = 3,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/swords = 1,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 1,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 4,
		/datum/skill/misc/athletics = 3,
		/datum/skill/misc/sneaking = 3,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_KNOWBANDITS
	)

/datum/outfit/militiamen/archer
	name = "Militia-men Archer"
	head = /obj/item/clothing/head/helmet/kettle
	neck = /obj/item/clothing/neck/chaincoif
	armor = /obj/item/clothing/armor/gambeson
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	backl = /obj/item/storage/backpack/satchel/cloth
	beltr = /obj/item/ammo_holder/quiver/arrows
	beltl = /obj/item/weapon/mace/cudgel
	backpack_contents = list(
		/obj/item/rope/chain = 1
	)

/datum/job/advclass/militiamen/pikeman
	title = "Milis Mızraklısı"
	tutorial = "Piyadelerin arka saflarında yer alır ve uzun mızrağınla onlara destek sağlarsın."
	outfit = /datum/outfit/militiamen/pikeman
	category_tags = list(CTAG_MILITIAMEN)

	jobstats = list(
		STATKEY_STR = 2,
		STATKEY_END = 2,
		STATKEY_CON = 2,
		STATKEY_SPD = -1
	)

	skills = list(
		/datum/skill/combat/polearms = 3,
		/datum/skill/combat/swords = 2,
		/datum/skill/combat/axesmaces = 2,
		/datum/skill/combat/knives = 2,
		/datum/skill/combat/wrestling = 2,
		/datum/skill/combat/unarmed = 3,
		/datum/skill/misc/swimming = 2,
		/datum/skill/misc/climbing = 3,
		/datum/skill/misc/athletics = 3,
		/datum/skill/craft/crafting = 1,
		/datum/skill/misc/reading = 1
	)

	traits = list(
		TRAIT_MEDIUMARMOR,
		TRAIT_KNOWBANDITS
	)

/datum/outfit/militiamen/pikeman
	name = "City Watch Pikeman"
	head = /obj/item/clothing/head/helmet/kettle
	neck = /obj/item/clothing/neck/coif
	armor = /obj/item/clothing/armor/chainmail/hauberk/iron
	shirt = /obj/item/clothing/armor/gambeson/heavy
	backl = /obj/item/storage/backpack/satchel/cloth
	backr = /obj/item/weapon/polearm/spear
	beltl = /obj/item/weapon/sword/short/iron
	beltr = /obj/item/weapon/mace/cudgel
	scabbards = list(/obj/item/weapon/scabbard/sword)
	backpack_contents = list(
		/obj/item/rope/chain = 1
	)
