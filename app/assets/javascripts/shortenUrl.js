$(document).ready(function() {

	function sendUrlToShorten(url) {
		// $.ajax({
		// 	url: "/shrink_urls",
		// 	type: 'POST',
		// 	dataType: "json",
		// 	data; { shrink_url: { original_url: url, short_url:  }}
		// 	error: function(){

		// 	},
		// 	success: function(response){

		// 	}

		// })
	};

	$(".original-url-form").on("submit", function(event) {
		event.preventDefault();
		var originalUrl = $("#original-url").val();
  	console.log(originalUrl)
		$("#original-url").val("");
	});

});