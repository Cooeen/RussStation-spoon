//this pleases armoks beard
/datum/species/dwarf
	name = "\improper Dwarf"
	plural_form = "Dwarfs"
	id = SPECIES_DWARF
	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS)
	inherent_traits = list(
		TRAIT_NOBREATH,
		TRAIT_CAN_STRIP,
		TRAIT_VIRUSIMMUNE, // lavaland has miasma
		TRAIT_LITERATE,
	)
	mutant_bodyparts = list("wings" = "None")
	species_cookie = /obj/item/reagent_containers/food/drinks/bottle/ale
	use_skintones = TRUE
	speedmod = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	brutemod = 0.9
	coldmod = 0.85
	punchdamagehigh = 11 //fist fighting with dorfs is very dangerous
	mutanteyes = /obj/item/organ/internal/eyes/night_vision
	species_language_holder = /datum/language_holder/dwarf

/datum/species/dwarf/on_species_gain(mob/living/carbon/human/C, datum/species/old_species, pref_load)
	. = ..()
	C.dna.add_mutation(/datum/mutation/human/dwarfism)
	for(var/datum/mutation/human/dwarfism/dwarf_mutation in C.dna.mutations)
		dwarf_mutation.mutadone_proof = TRUE
	C.bubble_file = 'russstation/icons/mob/talk.dmi'
	C.bubble_icon = "dwarf"
	var/dwarf_hair = pick("Beard (Dwarf)", "Beard (Very Long)", "Beard (Full)")
	C.facial_hairstyle = dwarf_hair
	C.update_hair()
	// dwarves can see ghosts! and no putting them to rest with slabs, that would be too much
	C.AddComponent(/datum/component/spookable)

/datum/species/dwarf/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	C.dna.remove_mutation(/datum/mutation/human/dwarfism)
	C.bubble_file = 'icons/mob/talk.dmi'
	C.bubble_icon = initial(C.bubble_icon)
	qdel(C.GetComponent(/datum/component/spookable))
	. = ..()

/datum/species/dwarf/random_name(gender, unique, lastname)
	return dwarf_name()
