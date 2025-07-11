/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine_pantheon
	t0 = /datum/action/cooldown/spell/healing

/datum/patron/divine/can_pray(mob/living/follower)
	//you can pray anywhere inside a church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE

	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(!cross.obj_broken)
			return TRUE

	to_chat(follower, span_danger("I need a nearby Pantheon Cross for my prayers to be heard..."))
	return FALSE

/* ----------------- */

/datum/patron/divine/astrata
	name = "Astrata"
	domain = "Goddess of Order, the Sun Queen"
	desc = "Crafted from the head of Psydon, twin of Noc. She gifted mankind the Sun, protecting Psydonia from all forces which may seek it harm: from both outside and within."
	flaws = "Tyrannical, Ill-Tempered, Uncompromising"
	worshippers = "Nobles, Zealots, Commoners"
	sins = "Betrayal, Sloth, Witchcraft"
	boons = "Your stamina regeneration delay is lowered during daytime."
	added_traits = list(TRAIT_APRICITY)
	t1 = /datum/action/cooldown/spell/sacred_flame
	t2 = /datum/action/cooldown/spell/healing/greater
	t3 = /datum/action/cooldown/spell/revive
	confess_lines = list(
		"ASTRATA BENİM IŞIĞIMDIR!",
		"ASTRATA YASAYI GETİRİR!",
		"GÜNEŞİN GÖRKEMİNE İTAAT EDERİM!",
	)
	storyteller = /datum/storyteller/astrata

/datum/patron/divine/noc
	name = "Noc"
	domain = "God of Knowledge, the Moon Prince"
	desc = "Crafted from the helmet of Psydon, twin of Astrata. He gifted mankind divine wisdom."
	flaws = "Cynical, Isolationist, Unfiltered Honesty"
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Suppressing Truth, Burning Books, Censorship"
	boons = "You learn, dream, and teach apprentices slightly better. Access to roles with magic."
	added_traits = list(TRAIT_TUTELAGE)
	t1 = /datum/action/cooldown/spell/status/invisibility
	t2 = /datum/action/cooldown/spell/blindness/miracle
	t3 = /datum/action/cooldown/spell/projectile/moonlit_dagger
	confess_lines = list(
		"NOC GECEDİR!",
		"NOC GERÇEĞİ GÖSTERENDİR!",
		"AY'IN GİZEMLERİNİ ARARIM!",
	)
	storyteller = /datum/storyteller/noc

/datum/patron/divine/dendor
	name = "Dendor"
	domain = "God of Nature and Beasts"
	desc = "Crafted from the bones of Psydon as the embodiment of the natural world. Driven mad with time."
	flaws = "Madness, Rebelliousness, Disorderliness"
	worshippers = "Druids, Beasts, Madmen"
	sins = "Deforestation, Overhunting, Disrespecting Nature"
	boons = "You are immune to kneestingers."
	added_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t1 = /datum/action/cooldown/spell/undirected/bless_crops
	t2 = /datum/action/cooldown/spell/undirected/beast_sense
	t3 =/datum/action/cooldown/spell/beast_tame
	confess_lines = list(
		"DENDOR SAĞLAR!",
		"AĞAÇBABAMIZ YOL GÖSTERİR!",
		"DOĞANIN ÇAĞRISINA CEVAP VERECEĞİM!",
	)
	storyteller = /datum/storyteller/dendor

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "God of Seas and Storms"
	desc = "Crafted from the blood of Psydon as sovereign of the waters. Enraged by ignorance of Him from followers of The Ten."
	flaws= "Reckless, Stubborn, Destructive"
	worshippers = "Sailors of the Sea and Sky, Horrid Sea-Creachers, Fog Islanders"
	sins = "Fear, Hubris, Forgetfulness"
	boons = "Leeches will drain very little of your blood."
	added_traits = list(TRAIT_LEECHIMMUNE)
	t1 = /datum/action/cooldown/spell/projectile/swordfish
	t2 = /datum/action/cooldown/spell/undirected/conjure_item/summon_trident
	t3 = /datum/action/cooldown/spell/ocean_embrace
	confess_lines = list(
		"ABYSSOR DALGALARA HÜKMEDR!",
		"OKYANUSUN ÖFKESİ ABYSSOR'UN KENDİSİDİR!",
		"KENDİMİ OKYANUSUN AKINTISINA BIRAKTIM!",
	)
	storyteller = /datum/storyteller/abyssor

/datum/patron/divine/necra
	name = "Necra"
	domain = "Mother Goddess of Death and Time"
	desc = "The Veiled Lady, once close partner to Psydon. She created the Nine others from his corpse, guiding them from the Underworld."
	flaws = "Unchanging, Apathetic, Easy to Bore"
	worshippers = "Orderlies, Gravetenders, Mourners"
	sins = "Heretical Magic, Untimely Death, Disturbance of Rest"
	boons = "You may see the presence of a soul in a body."
	added_traits = list(TRAIT_SOUL_EXAMINE)
	t1 = /datum/action/cooldown/spell/burial_rites
	t2 = /datum/action/cooldown/spell/undirected/soul_speak
	t3 = /datum/action/cooldown/spell/aoe/churn_undead
	confess_lines = list(
		"HER RUH'UN YOLU NECRA'DA BİTER!",
		"HUZUR BULACAĞIMIZ TEK YER YERALTININ-KIZI'NIN YANI!",
		"ÖLÜMDEN KORKMAM, ÇÜNKÜ LEYDİMİZ BİZİ KUCAKLAYACAKDIR!",
	)
	storyteller = /datum/storyteller/necra

/datum/patron/divine/ravox
	name = "Ravox"
	domain = "God of Warfare, Justice, and Bravery"
	desc = "Crafted from the the blade of Psydon, a champion of all who seek righteousness for themselves and others."
	flaws = "Carelessness, Aggression, Pride"
	worshippers = "Warriors, Sellswords, Guardsmen"
	sins = "Cowardice, Cruelty, Stagnation"
	boons = "Your used weapons dull slower."
	added_traits = list(TRAIT_SHARPER_BLADES)
	t1 = /datum/action/cooldown/spell/undirected/call_to_arms
	t2 = /datum/action/cooldown/spell/undirected/divine_strike
	t3 = /datum/action/cooldown/spell/persistence
	confess_lines = list(
		"RAVOX ADALETLİDİR!",
		"MÜCADELE VE ZARAFET!",
		"SAVAŞIN DAVULLARI GÖĞSÜMDE ÇALIYOR!",
	)
	storyteller = /datum/storyteller/ravox

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "Diety of Trickery, Freedom, and Inspiration"
	desc = "Crafted from the silver tongue of Psydon. Xylix is a force of change and deceit, yet allows little known of their gender let alone presence."
	flaws = "Petulance, Deception, Gambling-Prone"
	worshippers = "Cheats, Performers, The Hopeless"
	sins = "Boredom, Predictability, Routine"
	boons = "You can rig different forms of gambling in your favor."
	added_traits = list(TRAIT_BLACKLEG)
	t1 = /datum/action/cooldown/spell/undirected/list_target/vicious_mimicry
	t2 = /datum/action/cooldown/spell/status/wheel
	confess_lines = list(
		"ASTRATA BENİM IŞIĞIMDIR!",
		"NOC GECEDİR!",
		"DENDOR SAĞLAR!",
		"ABYSSOR DALGALARA HÜKMEDR!",
		"RAVOX ADALETLİDİR!",
		"HER RUH'UN YOLU NECRA'DA BİTER!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!", //the only xylix-related confession
		"PESTRA BÜTÜN HASTALIKLARDAN KURTARIR!",
		"MALUM BENİM OCAĞIMDIR!",
		"EORA BİZİ BİR ARAYA GETİRİR!",
	)
	storyteller = /datum/storyteller/xylix

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Goddess of Disease, Alchemy, and Medicine"
	desc = "A mistake; Psydon's intestines left behind. She slithered out, bringing forth the cycle of life and decay."
	flaws = "Drunkenness, Crudeness, Irresponsibility"
	worshippers = "The Ill and Infirm, Alchemists, Physicians"
	sins = "´Curing´ Abnormalities, Refusing to Help Unfortunates, Groveling"
	boons = "You may consume rotten food without being sick."
	added_traits = list(TRAIT_ROT_EATER)
	t0 = /datum/action/cooldown/spell/diagnose/holy
	t1 = /datum/action/cooldown/spell/healing
	t2 = /datum/action/cooldown/spell/attach_bodypart
	t3 = /datum/action/cooldown/spell/cure_rot
	confess_lines = list(
		"PESTRA BÜTÜN HASTALIKLARDAN KURTARIR!",
		"ÇÜRÜMEK HAYATIN DÖNGÜSÜNÜN BİR PARÇASIDIR!",
		"ACILARIM BENİM VASİYETİMDİR!",
	)
	storyteller = /datum/storyteller/pestra

/datum/patron/divine/malum
	name = "Malum"
	domain = "God of Toil, Innovation, and Creation"
	desc = "Crafted from the hands of Psydon. He would later use his own to construct wonderous inventions."
	flaws = "Obsessive, Exacting, Overbearing"
	worshippers = "Smiths, Miners, Sculptors"
	sins = "Cheating, Shoddy Work, Suicide"
	boons = "You recover more energy when sleeping."
	added_traits = list(TRAIT_BETTER_SLEEP)
	t1 = /datum/action/cooldown/spell/status/vigorous_craft
	t2 = /datum/action/cooldown/spell/hammer_fall
	t3 = /datum/action/cooldown/spell/heat_metal
	confess_lines = list(
		"MALUM BENİM OCAĞIMDIR!",
		"GERÇEK DEĞER EMEKTEN GELİR!",
		"BEN YARADILIŞIN ENSTRÜMANIYIM!",
	)
	storyteller = /datum/storyteller/malum

/datum/patron/divine/eora
	name = "Eora"
	domain = "Goddess of Love, Family, and Art"
	desc = "Crafted from the heart of Psydon, a spreader of love and beauty, and strengthener of bonds."
	flaws= "Naivete, Impulsiveness, Bigotry"
	worshippers = "Mothers, Artists, Married Couples"
	sins = "Sadism, Abandonment, Ruining Beauty"
	boons = "You can understand others' needs better."
	added_traits = list(TRAIT_EXTEROCEPTION)
	t1 = /datum/action/cooldown/spell/instill_perfection
	t2 = /datum/action/cooldown/spell/projectile/eora_curse
	t3 = /datum/action/cooldown/spell/eoran_bloom
	confess_lines = list(
		"EORA BİZİ BİR ARAYA GETİRİR!",
		"BU İŞKENCEDE BİLE ONUN SEVGİSİ VAR!",
		"BANA KARŞI İŞKENCE ETSEN BİLE, SENİ SEVİYORUM!",
	)
	storyteller = /datum/storyteller/eora
