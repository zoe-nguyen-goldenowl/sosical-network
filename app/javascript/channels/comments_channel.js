import { ajax, ajaxSetup } from "jquery";
import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    console.log("comment channel connected")  
  },

  disconnected() {
    console.log("comment channel disconnected")  
  },

  received(data) {

    $(`#count-comment_${data['post_id']}`).html(data["count_comment"]);
    $(`#post-comment_${data['post_id']}`).html(data["count_comment"]);
    
    var url = window.location.href
    $.ajax({
      type: "GET",
      url: url,
      dataType: "script",
      success: function(data) {
        $(form).fadeOut(800, function(){
            form.html(data).fadeIn().delay(2000);
        });
    }
    });
  }
  
});
