$(function() {
    $('#input_image').on('change', function(event) {
      var files = event.target.files;
      var image = files[0]
      var reader = new FileReader();

      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;
        $('#img-review').html(img);
      }
      reader.readAsDataURL(image);
      console.log(files);
      
    });
  });