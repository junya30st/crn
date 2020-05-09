$(function(){
  function addShop(shop) {
    let html = `
      <a href="/shops/${shop.id} class="shop_search-list">
        ${shop.name}：${shop.introduction}
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
    // console.log(input)
    $.ajax({
      type: 'GET',
      url: '/shops/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(shops){
      console.log(shops);
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
  // $(document).on("click", ".added-shop", function(e){
  //   e.preventDefault();
  //   let id = 
  // })
});

      // <div class = "shop_search-list" data-shop-id="${shop.id}">${shop.name}</div>