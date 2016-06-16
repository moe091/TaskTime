module HomeHelper
	def task_percentage(task)
		return ((task.completed.to_f / task.goal) * 100).to_i

	end


	def format_minutes(minutes)
		hours = minutes / 60
		mins = minutes % 60

		return format("%02d:%02d", hours, mins)
	end

end
