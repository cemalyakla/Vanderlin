
/datum/antagonist/prisoner
	name = "Prisoner"
	antagpanel_category = "Prisoner"
	roundend_category = "Prisoners"
	show_name_in_check_antagonists = TRUE
	increase_votepwr = FALSE
	isgoodguy = TRUE
	antag_flags = FLAG_FAKE_ANTAG


/datum/antagonist/prisoner/on_gain()
	if(!(locate(/datum/objective/escape) in objectives))
		var/datum/objective/escape/prisoner/escape_objective = new
		var/crime_weight = pick("Heavy", "Light") // decides the weight of our crime
		var/skill = pick("High", "Low") // how skilled we were as a criminal
		if(crime_weight == "Heavy")
			var/crime = pick("Murderer", "Thief", "Brute", "Bandit")
			if(crime)
				switch(crime)
					if("Murderer")
						if(skill == "High")
							owner.current.change_stat(STATKEY_STR, pick(1,2))
							owner.current.change_stat(STATKEY_SPD, pick(1, 2))
							owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/knives, pick(2,3), TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
						else
							owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
						INVOKE_ASYNC(owner, GLOBAL_PROC_REF(prisoner_murderer), owner)
						owner.special_role = "KATIL"
					if("Thief")
						if(skill == "High")
							owner.current.change_stat(STATKEY_INT, pick(2,3))
							owner.current.change_stat(STATKEY_PER, 2)
							owner.current.change_stat(STATKEY_SPD, pick(2, 3))
							owner.current.adjust_skillrank(/datum/skill/combat/knives, pick(2,3), TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/lockpicking, pick(2,3), TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/sneaking, pick(3,4), TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/climbing, pick(3,4), TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/reading, pick(2,3), TRUE)
							if(prob(20))//higher skill individuals would most likely work alone, considering trust isn't a big part of the business
								ADD_TRAIT(owner, TRAIT_THIEVESGUILD, TRAIT_GENERIC)
						else
							owner.current.change_stat(STATKEY_INT, 1)
							owner.current.change_stat(STATKEY_PER, 1)
							owner.current.change_stat(STATKEY_SPD, 1)
							owner.current.adjust_skillrank(/datum/skill/combat/knives, pick(1, 2), TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/climbing, pick(1,2), TRUE)
							ADD_TRAIT(owner, TRAIT_THIEVESGUILD, TRAIT_GENERIC)
						INVOKE_ASYNC(owner, GLOBAL_PROC_REF(prisoner_thief), owner)
						owner.special_role = "HIRSIZ"
					if("Brute")
						if(skill == "High")
							owner.current.change_stat(STATKEY_CON, pick(2,3))
							owner.current.change_stat(STATKEY_STR, pick(3,4))
							owner.current.change_stat(STATKEY_END, pick(2,3))
							owner.current.change_stat(STATKEY_INT, -6)
							owner.current.change_stat(STATKEY_SPD, pick(-2, -1))
							owner.current.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
						else
							owner.current.change_stat(STATKEY_CON, 1)
							owner.current.change_stat(STATKEY_STR, 2)
							owner.current.change_stat(STATKEY_END, 1)
							owner.current.change_stat(STATKEY_INT, -7)
							owner.current.change_stat(STATKEY_SPD, pick(-3, -2))
							owner.current.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
						owner.special_role = "VAHSI"
						INVOKE_ASYNC(owner, GLOBAL_PROC_REF(prisoner_brute), owner)
					if("Bandit")
						if(skill == "High")
							owner.current.change_stat(STATKEY_CON, 2)
							owner.current.change_stat(STATKEY_STR, 2)
							owner.current.change_stat(STATKEY_END, 2)
							owner.current.change_stat(STATKEY_INT, pick(-2, 2))
							owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/reading, pick(1,2), TRUE)
						else
							owner.current.change_stat(STATKEY_CON, 1)
							owner.current.change_stat(STATKEY_STR, 1)
							owner.current.change_stat(STATKEY_END, 1)
							owner.current.change_stat(STATKEY_INT, pick(-3, 0))
							owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
							owner.current.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
						INVOKE_ASYNC(owner, GLOBAL_PROC_REF(prisoner_bandit), owner)
						ADD_TRAIT(owner, TRAIT_BANDITCAMP, TRAIT_GENERIC)
						owner.special_role = "HAYDUT"
		else
			var/crimeLi = pick("Embezzlement", "Charlatan", "GraveRobber")//these crimes wont have the prisoner branded
			if(crimeLi)
				if(crimeLi == "Embezzlement")
					if(skill == "High")
						owner.current.adjust_skillrank(/datum/skill/misc/reading, pick(3,4), TRUE)
						owner.current.adjust_skillrank(/datum/skill/labor/mathematics, pick(4,5), TRUE)
					if(skill == "Low")
						owner.current.adjust_skillrank(/datum/skill/misc/reading, pick(2,3), TRUE)
						owner.current.adjust_skillrank(/datum/skill/labor/mathematics, pick(3,4), TRUE)
					owner.special_role = "SAHTEKAR"
					ADD_TRAIT(owner, TRAIT_SEEPRICES, TRAIT_GENERIC)
					INVOKE_ASYNC(owner, GLOBAL_PROC_REF(prisoner_embezzler), owner)
				if(crimeLi == "Charlatan")
					if(skill == "High")
						owner.current.adjust_skillrank(/datum/skill/misc/reading, pick(2,3), TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/medicine, pick(2,3), TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/sewing, pick(2,3), TRUE)
						owner.current.adjust_skillrank(/datum/skill/craft/alchemy, pick(3,4), TRUE)
						owner.current.adjust_skillrank(/datum/skill/labor/mathematics, pick(3,4), TRUE)
					if(skill == "Low")
						owner.current.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/medicine, pick(1,2), TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/sewing, pick(1,2), TRUE)
						owner.current.adjust_skillrank(/datum/skill/labor/mathematics, pick(2,3), TRUE)
						owner.current.adjust_skillrank(/datum/skill/craft/alchemy, 1, TRUE)
					owner.special_role = "ŞARLATAN"
					INVOKE_ASYNC(owner, GLOBAL_PROC_REF(prisoner_charlatan), owner)
				if(crimeLi == "GraveRobber")
					if(skill == "High")
						owner.current.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
						owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
						owner.current.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
						owner.current.change_stat(STATKEY_STR, 1)
						owner.current.change_stat(STATKEY_PER, 2)
						owner.current.change_stat(STATKEY_END, 1)
						owner.current.change_stat(STATKEY_SPD, 1)
						owner.current.change_stat(STATKEY_LCK, pick(-2, -1))
						ADD_TRAIT(owner, TRAIT_NOSTINK, TRAIT_GENERIC)
						ADD_TRAIT(owner, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
					else
						owner.current.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/craft/crafting, pick(0,1), TRUE)
						owner.current.adjust_skillrank(/datum/skill/craft/cooking, pick(0,1), TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
						owner.current.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
						owner.current.change_stat(STATKEY_PER, 1)
						owner.current.change_stat(STATKEY_SPD, 1)
						owner.current.change_stat(STATKEY_LCK, pick(-3, -2))//they must have been reaaally unlucky lol
						ADD_TRAIT(owner, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
					INVOKE_ASYNC(owner, GLOBAL_PROC_REF(prisoner_graverobber), owner)
					owner.special_role = "MEZAR SOYGUNCUSU"

		escape_objective.owner = owner
		objectives += escape_objective
		return
//	ADD_TRAIT(owner.current, TRAIT_ANTAG, TRAIT_GENERIC)
	return ..()

/datum/antagonist/prisoner/on_removal()
	return ..()

/datum/antagonist/prisoner/proc/crime_text()
	to_chat(owner.current, "<span class='alertsyndie'>Böyle kodun AMINAKOYAYIM!</span>")

/datum/antagonist/prisoner/greet()
	owner.announce_objectives()
	..()

/datum/antagonist/prisoner/roundend_report()
	var/traitorwin = TRUE

	var/count = 0
	if(objectives.len)//If the traitor had no objectives, don't need to process this.
		for(var/datum/objective/objective in objectives)
			objective.update_explanation_text()
			if(!objective.check_completion())
				traitorwin = FALSE
			count++

	if(!count)
		count = 1

	if(traitorwin)
		owner.adjust_triumphs(count)
		to_chat(owner.current, "<span class='greentext'>I've ESCAPED THAT AWFUL CELL! THE WORLD IS MINE!</span>")
		if(owner.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
	else
		if(considered_alive(owner))
			to_chat(owner.current, "<span class='redtext'>I'LL NEVER ESCAPE!!</span>")
		else
			to_chat(owner.current, "<span class='redtext'>I've escaped... in DEATH!</span>")
		if(owner.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)

/proc/prisoner_murderer(mob/living/target)
	to_chat(target, "<span class='alertsyndie'>Ben bir KATİLİM!</span>")

/proc/prisoner_thief(mob/living/target)
	to_chat(target, "<span class='alertsyndie'>Ben bir HIRSIZIM!</span>")

/proc/prisoner_brute(mob/living/target)
	to_chat(target, "<span class='alertsyndie'>Ben VAHŞİ biriyim!</span>")

/proc/prisoner_bandit(mob/living/target)
	to_chat(target, "<span class='alertsyndie'>Ben bir HAYDUTUM!</span>")

/proc/prisoner_embezzler(mob/living/target)
	to_chat(target, "<span class='alertsyndie'>Ben bir DOALNDIRICIYIM!</span>")

/proc/prisoner_charlatan(mob/living/target)
	to_chat(target, "<span class='alertsyndie'>Ben SAHTE bir DOKTORUM!</span>")

/proc/prisoner_graverobber(mob/living/target)
	to_chat(target, "<span class='alertsyndie'>Ben bir MEZAR SOYGUNCUSUYUM!</span>")
