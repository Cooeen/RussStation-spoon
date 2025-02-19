/datum/quirk/multilingual
	name = "Multilingual"
	desc = "You speak another language, useful for when you're speaking to foreign exchange interns!"
	icon = "language"
	value = 4
	gain_text = "<span class='notice'>You've developed fluency in another language."
	lose_text = "<span class='notice'>Some words being spoken around you don't make any sense anymore."
	medical_record_text = "Patient spent time learning another language, what a nerd."
	var/multilingual

/datum/quirk/multilingual/add()
	var/mob/living/carbon/human/human_holder = quirk_holder
	// Check if we can add the quirk if not just skip checking all together
	if(!ishumanbasic(human_holder))
		return
	// Get the mutilingual stored or in preferences
	multilingual = multilingual || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/multilingual)
	switch(multilingual) // honk -- there's probably a better way for this but I couldnt figure it out without breaking everything. credit to the nearsighted perk giving me the precedent to make these if statements :)
		if ("uncommon")
			multilingual = /datum/language/uncommon
		if ("draconic")
			multilingual = /datum/language/draconic
		if ("moffic")
			multilingual = /datum/language/moffic
		if ("nekomimetic")
			multilingual = /datum/language/nekomimetic
		if ("queekish")
			multilingual = /datum/language/queekish
		if("kitsumimetic")
			multilingual = /datum/language/kitsumimetic
	human_holder.grant_language(multilingual)

/datum/quirk/multilingual/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	if(ishumanbasic(human_holder))
		human_holder.remove_language(multilingual)
