function stopTimer(task) {
	task_id = task;
	timing = false;
	endTime = new Date();
	$.ajax({
		type: "POST",
		url: "/tasks/stop_timer",
		datatype: "json",
		data: {duration: seconds, start: Number(startTime) / 1000, end: Number(endTime) / 1000, task_id: task}
	})
	endTime = new Date();
}