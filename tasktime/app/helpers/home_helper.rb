module HomeHelper
	def task_percentage(task)
		return ((task.completed.to_f / task.goal) * 100).to_i

	end

	def time_left(task)
		hours = (((task.end_date - task.start_date) / 1.hour).round)
		days = ((task.end_date - task.start_date) / 1.day).round

		if hours < 24
			return hours.to_s + " Hours"
		else
			return days.to_s + " Days"
		end
	end



	def format_minutes(minutes)
		hours = minutes / 60
		mins = minutes % 60

		return format("%02d:%02d", hours, mins)
	end

end
