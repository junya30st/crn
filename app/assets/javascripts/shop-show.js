$(function(){
  $(".left-contents--image--small--box").first().addClass("active");
  $('.shop-show-img-sml').click(function () {
    console.log("ok")
    image_url = $(this).attr("src");
    $(".shop-show-img").attr("src", image_url).hide().fadeIn();
    $(".left-contents--image--small--box.active").removeClass("active");
    $(this).parent().addClass("active");
  });
});