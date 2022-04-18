class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user.id == comment.owner_id ? true : false
  end   

  def update?
    user.id == comment.owner_id ? true : false
  end

end