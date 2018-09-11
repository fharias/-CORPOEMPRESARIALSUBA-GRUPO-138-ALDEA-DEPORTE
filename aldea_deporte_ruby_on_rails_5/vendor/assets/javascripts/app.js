$(document).ready(function () {
    var myDate = new Date();
    var myYear = myDate.getFullYear();
    
    $('.div__scroll').on('click', function (e) {
		var target = $(this.hash);
		target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
		if (target.length) {
			$('html, body').animate({
				scrollTop: (target.offset().top)
			}, 1000, "easeInOutExpo");
			return false;
		}
	});

	window.onscroll = function () {
		scrollFunction();
	};
    
});

function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		document.getElementById("scroll").style.display = "block";
	} else {
		document.getElementById("scroll").style.display = "none";
	}
}

function topFunction() {
	$('html, body').animate({
		scrollTop: 0
	}, 1000, "easeInOutExpo");
}