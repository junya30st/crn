
// $(function(){
//   $('#image-post').change(function(){
//       $('img').remove();
//       const file = $(this).prop('files')[0];
//       if(!file.type.match('image.*')){
//           return;
//       }
//       const fileReader = new FileReader();
//       fileReader.onloadend = function() {
//           $('#result').html('<img src="' + fileReader.result + '"/>');
//       }
//       fileReader.readAsDataURL(file);
//   });
// });