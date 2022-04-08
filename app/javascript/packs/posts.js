$(function() {
  $('#input_image').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();

    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('#img-review').html(img);
    }
    
    reader.readAsDataURL(image);
  });
});

$(function() {
  $('#post_image').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();

    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('#post-img-review').remove(img);
      $('#post-img-review').html(img);
    }
    
    reader.readAsDataURL(image);
  });
});
