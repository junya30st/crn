window.onload = function(){
  console.log("ok")
  var form = $("#card_register");
  Payjp.setPublicKey("pk_test_6d89c8792c4bb812515e783f"); //(自身の公開鍵)

  $("#card_register").on("click", ".card-submit", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($(".input-card-number").val()),
        cvc: parseInt($(".input-card-cvc").val()),
        exp_month: parseInt($(".select-card-month").val()),
        exp_year: parseInt($(".select-card-year").val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status == 200) { //トークン生成に成功した場合
        $(".input-card-number").removeAttr("name");
        $(".input-card-cvc").removeAttr("name");
        $(".select-card-month").removeAttr("name");
        $(".select-card-year").removeAttr("name");

        var token = response.id;
        $("#card_register").append($('<input type="hidden" name="payjp-token" class="payjp-token" />').val(token));
        $("#card_register")[0].submit();

      }
      else {
        alert("error")
        form.find('button').prop('disabled', false);
      }
    });
  });
};