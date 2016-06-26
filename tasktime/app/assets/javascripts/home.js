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



function toggle_dropdown() {
	if (!$('.dropdown-menu').hasClass('open-dropdown')) {
		$('.dropdown-menu').addClass('open-dropdown')
	} else {
		$('.dropdown-menu').removeClass('open-dropdown')
	}

	//$('.dropdown-menu').css('display','block');
	//$('.sort-toggle').dropdown()

  return false;
}