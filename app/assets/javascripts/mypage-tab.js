$(function(){
  $('.tab-content[id != "tab1"]').hide();
  $("a").click(function(){
    $(".tab-content").hide();
    $($(this).attr("href")).show();
    $(".current").removeClass("current");
    $(this).addClass("current");
    return false;
  });
});