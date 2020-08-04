$(function() {
  console.log("ok")
  $('.shop-index__wrapper__fix--right--contents').jscroll({
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.shop-index__wrapper__fix--right--contents', 

    nextSelector: 'a.next',

    loadingHtml: '読み込み中'
  });
});