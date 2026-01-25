/obj/item/tooth
	name = "tooth"
	desc = "A tooth."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "tooth1"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0

	var/static/list/tooth_states = list("teeth1", "teeth2")

/obj/item/tooth/Initialize()
	. = ..()
	icon_state = pick(tooth_states)
