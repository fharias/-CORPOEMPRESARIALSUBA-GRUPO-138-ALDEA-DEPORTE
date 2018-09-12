$(document).ready(function () {
    
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
    
});

function topFunction() {
	$('html, body').animate({
		scrollTop: 0
	}, 1000, "easeInOutExpo");
}