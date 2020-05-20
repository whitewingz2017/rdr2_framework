var Interactions = {};

function Generate() {
	
}

window.addEventListener("message", function(event) {
	var data = event.data;

	$("#main").css("display", data.hidden ? "none" : "initial");

	if (data.interactions != null) {
		Interactions = data.interactions;
	}

	Generate();
});
