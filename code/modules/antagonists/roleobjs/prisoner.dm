
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
		var/event = TRUE
		var/crime = pick("Murderer", "Thief", "Brute", "Bandit")
		if(event == TRUE)
			switch(crime)
				if("Murderer")
					owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
					owner.current.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
					owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
					owner.current.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
					owner.special_role = "KATIL"
				if("Thief")
					owner.current.change_stat(STATKEY_INT, pick(1,3))
					owner.current.change_stat(STATKEY_PER, 2)
					owner.current.change_stat(STATKEY_SPD, pick(1, 3))
					owner.current.adjust_skillrank(/datum/skill/combat/knives, pick(2,3), TRUE)
					owner.current.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
					owner.current.adjust_skillrank(/datum/skill/misc/lockpicking, pick(2,3), TRUE)
					owner.current.adjust_skillrank(/datum/skill/misc/sneaking, pick(1,3), TRUE)
					owner.special_role = "HIRSIZ"
				if("Brute")
					to_chat(owner.current,"<span class='big'>Suçun Vahşilik yapman. Aptal ve güçlüsün.</span>")
					owner.current.change_stat(STATKEY_CON, pick(2,3))
					owner.current.change_stat(STATKEY_STR, pick(3,4))
					owner.current.change_stat(STATKEY_END, pick(2,3))
					owner.current.change_stat(STATKEY_INT, -6)
					owner.current.change_stat(STATKEY_SPD, pick(-2, -1))
					owner.current.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
					owner.current.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
					owner.current.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
					owner.special_role = "VAHSI"
				if("Bandit")
					to_chat(owner.current,"<span class='big'>Suçun haydutluk yapmak.</span>")
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
					owner.current.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
					owner.special_role = "HAYDUT"
		escape_objective.owner = owner
		objectives += escape_objective
		return
//	ADD_TRAIT(owner.current, TRAIT_ANTAG, TRAIT_GENERIC)
	return ..()

/datum/antagonist/prisoner/on_removal()
	return ..()


/datum/antagonist/prisoner/greet()
	owner.announce_objectives()
	if(owner.special_role == "KATIL")
		to_chat(owner.current,"<span class='big'>Suçun cinayet işlemek.</span>")
	if(owner.special_role == "THIEF")
		to_chat(owner.current,"<span class='big'>Suçun hırsızlık yapmak.</span>")
	if(owner.special_role == "VAHSI")
		to_chat(owner.current,"<span class='big'>Suçun vahşi olman.</span>")
	if(owner.special_role == "HAYDUT")
		to_chat(owner.current,"<span class='big'>Suçun haydutluk yapman.</span>")
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

