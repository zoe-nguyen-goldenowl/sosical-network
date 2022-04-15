
$(document).ready(function () {
  if (document.querySelector("#footer") == null) 
    $(".infinity-scroll-target ").unbind("scroll");
  else{
    $(".infinity-scroll-target ").scroll(function () {
      if (document.querySelector("#footer") != null){
        if ($('#footer').position().top < 601){    
          $('#footer').remove() 
          var next_page = document.querySelector("a[rel='next']")
    
          if (next_page == null) { return }
          url = next_page.href
        
          $.ajax({
            type: "GET",
            url: url,
            dataType: "script",
          })
        }
      }
        
    });
  }
  
});

