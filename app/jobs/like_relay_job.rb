class LikeRelayJob < ApplicationJob
  queue_as :default

  def perform(likes)
    html = ApplicationController.render partial: "likes/#{like.notifiable_type.underscore.pluralize}/#{like.action}", locals: {like: like}, formats: [:html]
    ActionCable.server.broadcast "likes:#{likes.recipient_id}", html: html
  end
end
