class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user.owner_of_(comment)
  end   

  def update?
    user.owner_of_(comment)
  end
end