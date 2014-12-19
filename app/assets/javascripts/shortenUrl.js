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
				$(".display-result").prepend("<li><a href='/shrink_urls/"+response.short_url+"'><span class='original'>Original Url: </span><span class='links'>"+response.original_url+"</span><br/><span class='short'>Short Url: </span><span class='links'>localhost:3000/shrink_urls/"+ response.short_url+"</span></a></li>");
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
