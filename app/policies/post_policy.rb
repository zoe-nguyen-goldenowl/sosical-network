class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def destroy?
    user.owner_of_(post)
  end   

  def update?
    user.owner_of_(post)
  end
  
end