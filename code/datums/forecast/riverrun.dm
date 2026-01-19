/datum/forecast/riverrun
	day_weather = list(/datum/particle_weather/rain/rain_gentle = 10, /datum/particle_weather/fog = 5)
	dawn_weather = list(/datum/particle_weather/rain/rain_gentle = 10, /datum/particle_weather/rain/rain_storm = 20)
	dusk_weather = list(/datum/particle_weather/rain/rain_gentle = 10, /datum/particle_weather/rain/rain_storm = 20, /datum/particle_weather/fog = 5)
	night_weather = list(/datum/particle_weather/rain/rain_gentle = 10, /datum/particle_weather/rain/rain_storm = 25, /datum/particle_weather/fog = 5)

	temp_ranges = list(
		"dawn" = list(4, 8),      // Cold morning
		"day" = list(10, 20),       // Warmer day
		"dusk" = list(12, 15),      // Colder evening
		"night" = list(2, 5),      // Cold night
	)

