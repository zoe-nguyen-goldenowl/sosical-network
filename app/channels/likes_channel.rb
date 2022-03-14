class LikesChannel < ApplicationCable::Channel
  def subscribed
    
    stream_from "posts:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
