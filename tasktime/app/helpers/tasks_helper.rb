module TasksHelper
	def hours_in_words(hours)
		distance_of_time_in_words(Time.at(0), Time.at(hours * 3600))
	end
end
