class RenameColumToFriend < ActiveRecord::Migration[6.1]
  def change
    rename_column :friends, :users_id, :user_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
