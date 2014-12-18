$(document).ready(function() {

	function sendUrlToShorten(url) {
	
		$.ajax({
			url: "/shrink_urls",
			type: 'POST',
			dataType: "json",
			data: { shrink_url: { original_url: url }},
			error: function(){

			},
			success: function(response){
				console.log(response);
				$(".display-result").append("<li ><a href='/shrink_urls/"+response.id+"'>"+response.original_url+": /shrink_urls/"+response.short_url+"</a></li>");
			}

		});
	}

	$(".original-url-form").on("submit", function(event) {
		event.preventDefault();
		var originalUrl = $("#original-url").val();
  	console.log(originalUrl);
		$("#original-url").val("");
		sendUrlToShorten(originalUrl);
	});

});
