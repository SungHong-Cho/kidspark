jQuery(function(){
  $(window).scroll(function(){
    url = $('.pagination .next a').attr('href');
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 80
      $('.pagination').text('사진을 가져오는 중입니다....');
      console.log("111111");
      data = $.getScript(url);
      $(data).each(function(index, value){
        console.log("1!");
        $("#photo_area").append("<a href='/photos/detail/" + value.id + "'>" +
                                        "<div class='box'>" +
                                        "<div class='photo_box'>" +
                                        "<img src='" + url_t(value) + "'/>" +
                                        "</div>" +
                                        "<div class='meta_box'>" + value.created_at + "</div>" +
                                        "</div>" +
                                        "</a>");
	});
      console.log("22222");
	});
});
