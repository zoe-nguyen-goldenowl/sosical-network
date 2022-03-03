class RenameColumnToLike < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :users_id, :user_id
    rename_column :likes, :posts_id, :post_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
