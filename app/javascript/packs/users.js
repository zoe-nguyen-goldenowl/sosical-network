$(function() {
  $('#input_avatar').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();

    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('#review_avatar').html(img);
    }  
    
    reader.readAsDataURL(image); 
  });
});