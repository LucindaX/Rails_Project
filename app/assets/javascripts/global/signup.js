$(document).ready(function(){
		$( "#switch1" ).click(function() {
		 $("#signin").toggle();
 		 $("#signup_").toggle("slow");
		});

		$( "#switch2" ).click(function() {
		 $("#signup_").toggle();
 		 $("#signin").toggle("slow");
		});
	})
