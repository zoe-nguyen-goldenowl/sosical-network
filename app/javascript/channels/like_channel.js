import consumer from "./consumer"

consumer.subscriptions.create("LikeChannel", {
  connected() {
    console.log("like channel connected")
  },

  disconnected() {
    console.log("like channel disconnected");
  },

  received(data) {
    console.log(data)
    $(`#post_${data['post_id']}`).html(data['count_like'])
  }
});
