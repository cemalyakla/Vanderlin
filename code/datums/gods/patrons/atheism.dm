/datum/patron/godless
	name = "Godless"
	domain = "Abandonment of the Gods"
	desc = "Worship of the gods is foolish! Gods exist but you refuse to worship them due to your own hubris."
	flaws = "Stubborn, Unrelenting, Misguided"
	worshippers = "Egomaniacs, Heretics, the Ignorant"
	sins = "Idolatry, Worship, Blind Faith"
	boons = "None, you godless heathen."
	associated_faith = /datum/faith/godless

	profane_words = list()
	confess_lines = list(
		"TANRISIZ, EFENDİSİZ BİR DÜNYA'DA YAŞAMAK İSTİYORUM!",
		"İNSAN SEÇER, KÖLE İTAAT EDER - ÖZGÜR YAŞAMAK İSTİYORUM!",
		"ESKİ YOLLAR ÇÖKECEK! TANRILARDAN KURTULACAĞIM!"
	)

/datum/patron/godless/can_pray(mob/living/follower)
	// Redefined this entire proc just to tell you:
	// Yes, the godless can pray. This is intentional.
	// Maybe they pray to themselves?
	return TRUE

/datum/patron/godless/hear_prayer(mob/living/follower, message)
	return FALSE
