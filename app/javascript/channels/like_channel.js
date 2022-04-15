import consumer from "./consumer"

consumer.subscriptions.create("LikeChannel", {
  connected() {
    console.log("like channel connected")
  },

  disconnected() {
    console.log("like channel disconnected");
  },

  received(data) {
    $(`#like_icon_${data['post_id']} a`).remove();
    $(`#like_icon_${data['post_id']}`).append(data['icon_like'])
    $(`#like_icon_${data['post_id']} a`).attr("href", data['href'])

    $(`#post_${data['post_id']}`).html(data['count_like'])
    
  }
});
