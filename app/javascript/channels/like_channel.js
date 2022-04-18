import consumer from "./consumer"

consumer.subscriptions.create("LikeChannel", {
  connected() {
    console.log("like channel connected")
  },

  disconnected() {
    console.log("like channel disconnected");
  },

  received(data) {
    $(`#like-icon_${data['post_id']} a`).remove();
    $(`#like-icon_${data['post_id']}`).append(data['like_icon'])
    $(`#like-icon_${data['post_id']} a`).attr("href", data['href'])

    $(`#post_${data['post_id']}`).html(data['count_like'])
    
  }
});
