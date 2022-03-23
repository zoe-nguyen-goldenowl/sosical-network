class LikeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "like"
  end

  def unsubscribed
    stop_all_streams
  end
end
