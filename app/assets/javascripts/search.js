$(function(){
  function addShop(shop) {
    let html = `
      <a href="/shops/${shop.id} class="shop_search-list">
        <div>${shop.name} - ${shop.location}</div>
      </a>
      `;
      $("#shop_search--result").append(html);
  };
  function addNoShop(){
    let html =`ショップがありません`
    $("#shop_search--result").append(html);
  };


  $("#shop_search").on("keyup", function(){
    let input = $("#shop_search").val();
    $.ajax({
      type: 'GET',
      url: '/shops/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(shops){
      $("#shop_search--result").empty();

      if (shops.length !== 0) {
        shops.forEach(function(shop){
          console.log(shop)
          addShop(shop);
        });
      } 
      else if (input.length == 0){
        return false;
      } else {
        addNoShop();
      }
    })
    .fail(function(){
      console.log("失敗です")
    });
  });
});