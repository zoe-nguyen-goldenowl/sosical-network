class ChangeNameCollumnToFriend < ActiveRecord::Migration[6.1]
  def change
    rename_column :friends, :self_user_id, :friend_id
  end
end
