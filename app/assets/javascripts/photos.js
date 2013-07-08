$(function() {
    $(window).scroll(function(){
	url = $('.pagination .next a').attr('href');
	if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 80) {
	    $('.pagination').text('사진을 가져오는 중입니다....');
	    $.getScript(url);
	}
    });
});
