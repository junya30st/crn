$(function() {
  const dom = $('.left-contents--image--main--box');
  const width = dom.width()
  $('.left-contents--image--small').on("click", function() {
    $('.left-contents--image--main').animate({"marginLeft": `-${width}`}, 550);
  });
});