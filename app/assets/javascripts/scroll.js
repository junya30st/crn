$(function() {
  console.log("ok")
  $('.shop-index__wrapper__fix--right--contents').jscroll({
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.shop-index__wrapper__fix--right--contents', 
    // 次のページにいくためのリンクの場所は？ ＞aタグの指定
    nextSelector: 'a.next',

    loadingHtml: '読み込み中'
  });
});