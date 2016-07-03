var seconds = 0;
var timing = false;
var startTime = null;
var endTime = null;
var task_id = 90;

function startTimer() {
	if (startTime == null)
		startTime = new Date();
	console.log(startTime);
	timing = true;
	timer();
}

function timer() {
    t = setTimeout(add, 1000);
}

function add() {
	if (timing) {
		seconds++;
		
		$(".session-duration-new").html(seconds_in_time(seconds));
		timer();
	}
}


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
	console.log("stopped");
	console.log(Number(startTime) / 1000);
}

function show_new_session() {
	$("#new-ses-btn").hide();
	$("#new-session").show(400);

}

//ON LOAD

  // Wait for the page to load first
        window.onload = function() {

          //Get a reference to the link on the page
          // with an id of "mylink"
          var save_new = document.getElementById("save_new");

          //Set code to run when the link is clicked
          // by assigning a function to "onclick"
          	if (save_new) {
	          save_new.onclick = function() {
	          	if (!timing) {
		          	$.ajax({
						type: "POST",
						url: "/tasks/create_session",
						datatype: "json",
						data: {duration: seconds, start: Number(startTime) / 1000, end: Number(endTime) / 1000, task_id: task_id}
					})
	          	}
	            
	            return false;
	          }
	       	}

        }

//HELPERS

function seconds_in_time(seconds) {
	var hours = 0, mins = 1, secs = 2;
	var time = [];

	time[hours] = Math.floor(seconds / 3600);
	time[mins] = Math.floor((seconds / 60)) % 60;
	time[secs] = seconds % 60;

	for(var i = 0; i <= 2; i++)
		if (time[i] < 10)
			time[i] = "0" + time[i];


	return time[hours] + ":" + time[mins] + ":" + time[secs];
}
