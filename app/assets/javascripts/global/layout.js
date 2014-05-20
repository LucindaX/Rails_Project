

	$(function(){
		// Calling Login Form

		$("#modal_trigger").leanModal({ closeButton: ".modal_close" });

		$("#login_form").click(function(){
			//$(".social_login").hide();
			$(".user_login").show();
			return false;
		});

		// Calling Register Form
		$("#register_form").click(function(){
			$(".user_login").hide();
			$(".user_register").show();
			$(".header_title").text('Register');
			return false;
		});

		// Going back to Social Forms
		$(".back_btn").click(function(){
			$(".user_login").show();
			$(".user_register").hide();
			//$(".social_login").show();
			$(".header_title").text('Login');
			return false;
		});

	});
