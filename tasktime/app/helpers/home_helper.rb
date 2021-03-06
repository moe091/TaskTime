module HomeHelper
	def task_percentage(task)
		return ((task.completed.to_f / task.goal) * 100).to_i

	end

	def ending(task)
		hours = (((task.end_date - DateTime.now) / 1.hour).round)
		days = ((task.end_date - DateTime.now) / 1.day).round


		if hours < 24
			return hours.to_s + " Hours"
		else
			return days.to_s + " Days, " + (hours % 24).to_s + " Hours"
		end
	end



	def format_minutes(minutes)
		hours = minutes / 60
		mins = minutes % 60

		return format("%02d:%02d", hours, mins)
	end

	def sort_percentage(tasks) 
		tasks.sort{|a, b| task_percentage(a) <=> task_percentage(b)}
	end

	def sort_hours_until_goal(tasks) 
		tasks.sort{|a, b| (a.goal - a.completed) <=> (b.goal - b.completed)}
	end

	def sort_timeleft(tasks)
		
	end

end




def sort_ending(tasks)
	tasks.sort{|a, b| a.end_date <=> b.end_date}
end

def sort_created(tasks)
	tasks.sort{|a, b| b.created_at <=> a.created_at}
end






