$(document).ready(function() {

	$(".original-url-form").on("submit", function(event) {
		event.preventDefault();
		var originalUrl = $("#original-url").val();
  	console.log(originalUrl)
		$("#original-url").val("");
	});

});
