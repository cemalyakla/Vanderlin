/obj/item/organ/lungs
	var/failed = FALSE
	var/operated = FALSE	//whether we can still have our damages fixed through surgery
	var/next_blood_cough = 0
	name = "lungs"
	icon_state = "lungs"
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_LUNGS
	gender = PLURAL
	w_class = WEIGHT_CLASS_SMALL

	healing_factor = STANDARD_ORGAN_HEALING
	decay_factor = STANDARD_ORGAN_DECAY

	high_threshold_passed = "<span class='warning'>I feel some sort of constriction around my chest as my breathing becomes shallow and rapid.</span>"
	now_fixed = "<span class='warning'>My lungs seem to once again be able to hold air.</span>"
	high_threshold_cleared = "<span class='info'>The constriction around my chest loosens as my breathing calms down.</span>"

	food_type = /obj/item/reagent_containers/food/snacks/organ/lungs

/obj/item/organ/lungs/on_life()
	..()
	if(damage > 0 && owner && world.time >= next_blood_cough)
		var/mob/living/carbon/C = owner
		if(istype(C) && !(NOBLOOD in C.dna?.species?.species_traits) && !HAS_TRAIT(C, TRAIT_BLOODLOSS_IMMUNE) && C.blood_volume > 0)
			next_blood_cough = world.time + 20 SECONDS
			var/muffled = C.silent || !C.can_speak_vocal()
			if(muffled)
				C.visible_message("<span class='danger'>[C] coughs up blood, the sound muffled.</span>", "<span class='danger'>I cough up blood, the sound muffled.</span>")
			else
				C.visible_message("<span class='danger'>[C] coughs up blood!</span>", "<span class='danger'>I cough up blood!</span>")
			var/static/list/cough_sounds_male = list(
				'sound/vo/male/gen/cough (1).ogg',
				'sound/vo/male/gen/cough (2).ogg'
			)
			var/static/list/cough_sounds_female = list(
				'sound/vo/female/gen/cough (1).ogg',
				'sound/vo/female/gen/cough (2).ogg'
			)
			var/list/cough_sounds = cough_sounds_male
			if(C.gender == FEMALE)
				cough_sounds = cough_sounds_female
			else if(C.gender != MALE)
				cough_sounds = cough_sounds_male + cough_sounds_female
			playsound(C, pick(cough_sounds), 100, FALSE)
			C.bleed(2)
	if((!failed) && ((organ_flags & ORGAN_FAILING)))
		if(owner.stat == CONSCIOUS)
			owner.visible_message("<span class='danger'>[owner] grabs [owner.p_their()] throat, struggling for breath!</span>", \
								"<span class='danger'>I suddenly feel like you can't breathe!</span>")
		// Failing lungs rapidly deprive the body of oxygen.
		if(isliving(owner))
			var/mob/living/carbon/C = owner
			C.adjustOxyLoss(5)
			//oxyloss damages every other organ
			C.adjustOrganLoss(ORGAN_SLOT_HEART, 5)
			C.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
			C.adjustOrganLoss(ORGAN_SLOT_LIVER, 5)
			if(prob(50))
				C.emote("breathgasp")
		failed = TRUE
	else if(!(organ_flags & ORGAN_FAILING))
		failed = FALSE
	return

/obj/item/organ/lungs/prepare_eat()
	var/obj/S = ..()
	return S

/obj/item/organ/lungs/plasmaman
	name = "plasma filter"
	desc = ""
	icon_state = "lungs-plasma"


/obj/item/organ/lungs/slime
	name = "vacuole"
	desc = ""
