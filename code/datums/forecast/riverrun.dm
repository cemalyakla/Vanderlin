/datum/forecast/riverrun
	day_weather = list(/datum/particle_weather/rain/rain_gentle = 20, /datum/particle_weather/fog = 5)
	dawn_weather = list(/datum/particle_weather/rain/rain_gentle = 30, /datum/particle_weather/rain/rain_storm = 40)
	dusk_weather = list(/datum/particle_weather/rain/rain_gentle = 40, /datum/particle_weather/rain/rain_storm = 50, /datum/particle_weather/fog = 15)
	night_weather = list(/datum/particle_weather/rain/rain_gentle = 30, /datum/particle_weather/rain/rain_storm = 60, /datum/particle_weather/fog = 15)

	temp_ranges = list(
		"dawn" = list(4, 8),      // Cold morning
		"day" = list(10, 15),       // Warmer day
		"dusk" = list(8, 13),      // Colder evening
		"night" = list(1, 3),      // Cold night
	)

