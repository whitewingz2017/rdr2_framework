$(document).ready(function() {
	
});

$(".clipboard").click(function(data) {
	var element = document.getElementById("input-"+data.target.id);
	element.select();
	document.execCommand("Copy");
})

window.addEventListener("message", function(event) {
	var data = event.data;

	if (data.open === true) {
		$("#main").css("display", "initial")
	} else if (data.open === false) {
		$("#main").css("display", "none")
	}

	if (data.input !== null) {
		for	(i = 0; i < data.input.length; i++){
			var input = data.input[i];
			$("#input-"+input.id).val(input.value);
		}
	}
});

document.onkeydown = function(data) {
	if (data.which == 33) { // Page up
		$.post('http://debug/toggleMenu', JSON.stringify({}));
	} else if (data.which == 34) { // Page down
		$.post('http://debug/toggleCursor', JSON.stringify({}));
	}
};