	
	$(function() {
		$(".innersort").click(function() {
			$(".sort-dropwrap").toggle();
		});
	});

	function reccity_all() {
		$(".recdes_asia").show();
		$(".recdes_america").show();
		$(".recdes_europe").show();
		$(".recdes_oceania").show();
		$(".recdes_africa").show();

	}

	function reccity_asia() {

		$(".recdes_asia").show();
		$(".recdes_america").hide();
		$(".recdes_europe").hide();
		$(".recdes_oceania").hide();
		$(".recdes_africa").hide();

	}

	function reccity_america() {

		$(".recdes_america").show();
		$(".recdes_asia").hide();
		$(".recdes_europe").hide();
		$(".recdes_oceania").hide();
		$(".recdes_africa").hide();

	}

	function reccity_oceania() {

		$(".recdes_oceania").show();
		$(".recdes_america").hide();
		$(".recdes_asia").hide();
		$(".recdes_europe").hide();
		$(".recdes_africa").hide();
	}
	function reccity_europe() {

		$(".recdes_europe").show();
		$(".recdes_oceania").hide();
		$(".recdes_america").hide();
		$(".recdes_asia").hide();
		$(".recdes_africa").hide();
	}

	function reccity_africa() {

		$(".recdes_africa").show();
		$(".recdes_europe").hide();
		$(".recdes_oceania").hide();
		$(".recdes_america").hide();
		$(".recdes_asia").hide();

	}
	






