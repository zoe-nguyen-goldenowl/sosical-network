class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def destroy?
    user.id == post.user_id ? true : false
  end   

  def update?
    user.id == post.user_id ? true : false
  end
  
end