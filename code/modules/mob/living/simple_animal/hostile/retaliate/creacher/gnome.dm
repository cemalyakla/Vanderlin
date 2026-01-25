// ===============================
// HERE LAY GNOMES
// love goblins, hate all else
// ===============================

/mob/living/simple_animal/hostile/retaliate/gnome
	name = "gnome"
	desc = "A small, bearded creature with a pointy hat. They are known to be mischievous and territorial, but seem to get along well with goblins."
	icon = 'icons/mob/gnomes/gnome_base.dmi'
	icon_state = "gnome"
	icon_living = "gnome"
	icon_dead = "gnome"
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = TRUE
	speak_chance = 5
	move_to_delay = 3
	base_constitution = 6
	base_strength = 8
	base_speed = 12
	maxHealth = 80
	health = 80
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 15
	vision_range = 6
	aggro_vision_range = 6
	retreat_distance = 0
	minimum_distance = 1
	base_intents = list(/datum/intent/simple/claw)
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/combat/hits/bladed/smallslash (1).ogg'
	canparry = TRUE
	d_intent = INTENT_DODGE
	speak_emote = list("mutters", "grumbles", "chatters")
	speak = list("Oi! Get off me land!", "Blasted outsiders!", "Hehehehe!", "Shiny things...", "Mine! All mine!")
	emote_hear = list("giggles mischievously", "mutters something about treasure")
	emote_see = list("scratches its beard", "adjusts its cap", "sniffs the air suspiciously", "rummages through its pockets")
	faction = list(FACTION_ORCS)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	del_on_death = FALSE
	flip_on_death = TRUE
	aggressive = TRUE
	ai_controller = /datum/ai_controller/orc 
	head_butcher = /obj/item/natural/head/gnome
	guaranteed_butcher_results = list()
	butcher_results = null // Custom butcher behavior - just takes head

	var/has_beard = TRUE
	var/helm_state = null
	var/has_robe = FALSE
	var/robe_color = null 
	var/is_skeleton = FALSE
	var/is_decapitated = FALSE

/mob/living/simple_animal/hostile/retaliate/gnome/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)
	// Randomize appearance
	randomize_appearance()
	update_gnome_icon()

/mob/living/simple_animal/hostile/retaliate/gnome/proc/randomize_appearance()
	has_beard = TRUE
	helm_state = pick("spike_helm", "gnome_helm")
	has_robe = TRUE
	robe_color = pick("#8B4513", "#556B2F", "#6B4423", "#4A5D23", "#8B0000", "#2F4F4F", "#654321", "#3D5C3D", "#4B3621", "#5C4033")

/mob/living/simple_animal/hostile/retaliate/gnome/proc/update_gnome_icon()
	cut_overlays()
	if(is_skeleton)
		if(is_decapitated)
			icon_state = "gnome_skel_decap"
		else
			icon_state = "gnome_skel"
	else
		if(is_decapitated)
			icon_state = "gnome_decap"
		else
			icon_state = "gnome"

	if(stat == DEAD || is_skeleton)
		return

	var/list/overlays_to_add = list()

	overlays_to_add += mutable_appearance(icon, "gnome_eyes")

	if(has_robe)
		var/mutable_appearance/robe = mutable_appearance(icon, "gnome_robe")
		if(robe_color)
			robe.color = robe_color
		overlays_to_add += robe

	if(has_beard)
		overlays_to_add += mutable_appearance(icon, "gnome_beard")

	// Helmet (on top of everything)
	if(helm_state)
		overlays_to_add += mutable_appearance(icon, helm_state)

	add_overlay(overlays_to_add)

/mob/living/simple_animal/hostile/retaliate/gnome/death(gibbed)
	. = ..()
	// Adjust pixel offset for flip_on_death so gnome lands on ground
	pixel_y = -8

// Custom butcher - only takes the head, leaves decapitated body
/mob/living/simple_animal/hostile/retaliate/gnome/butcher(mob/living/user)
	if(is_decapitated)
		to_chat(user, span_warning("This gnome has already been decapitated!"))
		return

	visible_message(span_warning("[user] hacks the head off [src]!"))
	playsound(src, 'sound/foley/gross.ogg', 100, FALSE)

	if(head_butcher)
		var/obj/item/natural/head/gnome/head = new head_butcher(get_turf(src))
		head.set_hat(helm_state)
		head.add_mob_blood(src)
		var/turf/throw_target = get_step(src, pick(GLOB.alldirs))
		if(throw_target)
			head.throw_at(throw_target, 1, 2)

	is_decapitated = TRUE
	cut_overlays()
	icon_state = "gnome_decap"
	if(has_robe && robe_color)
		var/mutable_appearance/robe = mutable_appearance(icon, "gnome_robe")
		robe.color = robe_color
		add_overlay(robe)

	if(user.mind)
		user.mind.add_sleep_experience(/datum/skill/labor/butchering, user.STAINT * 0.5)

/mob/living/simple_animal/hostile/retaliate/gnome/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/gob/aggro (1).ogg', 'sound/vo/mobs/gob/aggro (2).ogg', 'sound/vo/mobs/gob/aggro (3).ogg', 'sound/vo/mobs/gob/aggro (4).ogg')
		if("pain")
			return pick('sound/vo/mobs/gob/pain (1).ogg', 'sound/vo/mobs/gob/pain (2).ogg', 'sound/vo/mobs/gob/pain (3).ogg')
		if("death")
			return pick('sound/vo/mobs/gob/death (1).ogg', 'sound/vo/mobs/gob/death (2).ogg')
		if("idle")
			return pick('sound/vo/mobs/gob/idle (1).ogg', 'sound/vo/mobs/gob/idle (2).ogg', 'sound/vo/mobs/gob/idle (3).ogg')

/mob/living/simple_animal/hostile/retaliate/gnome/Life()
	. = ..()
	handle_automated_speech()
	if(!target)
		if(prob(2))
			emote(pick("idle"), TRUE)

/mob/living/simple_animal/hostile/retaliate/gnome/taunted(mob/user)
	emote("aggro")

/mob/living/simple_animal/hostile/retaliate/gnome/simple_limb_hit(zone)
	return base_quadruped_limb_hit(zone) || ..()

// ===============================
// GNOME HEAD ITEM
// ===============================

/obj/item/natural/head/gnome
	name = "gnome head"
	desc = "The severed head of a gnome. Its beady eyes still seem to glare at you with contempt."
	icon = 'icons/mob/gnomes/gnome_base.dmi'
	icon_state = "gnome_head"
	headpricemin = 5
	headpricemax = 15
	sellprice = 30
	meat_to_give = /obj/item/reagent_containers/food/snacks/meat/mince/beef
	grid_height = 32
	grid_width = 32
	w_class = WEIGHT_CLASS_SMALL

/obj/item/natural/head/gnome/Initialize()
	. = ..()

/obj/item/natural/head/gnome/proc/set_hat(hat_state)
	if(hat_state)
		add_overlay(mutable_appearance(icon, hat_state))
