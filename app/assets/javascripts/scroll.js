$(function() {
  console.log("ok")
  $('.shop-index__wrapper__fix--right--contents').jscroll({
    
    contentSelector: '.shop-index__wrapper__fix--right--contents', 

    nextSelector: 'a.next',

    loadingHtml: '読み込み中'
  });
});