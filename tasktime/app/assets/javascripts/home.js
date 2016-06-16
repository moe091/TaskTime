var t;
var seconds = 0;
function changeName(button, task_id) {
	console.log($("#timer-" + task_id).show());
	$("#timer-" + task_id).show();
	timer();
}

function showTimer() {
	
}

function startTimer() {
	timer();
}

function timer() {
    t = setTimeout(add, 1000);
}

function add() {
	seconds++;
	$("#seconds").html(seconds);
	timer();
}