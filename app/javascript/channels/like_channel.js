import consumer from "./consumer"

consumer.subscriptions.create("LikeChannel", {
  connected() {
    console.log("like conect")  

  },

  disconnected() {
    console.log("like disconect")  

  },

  received(data) {
    $(`#post_${data['post_id']}`).html(data['count_like'])
  }
});
