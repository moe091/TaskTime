var seconds = 0;
var timing = false;

function showTimer() {
	
}

function startTimer() {
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

function stopTimer() {
	timing = false;

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
