class AddTableFriend < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :status
      t.integer :self_user_id
      t.references :users
      t.timestamps
    end
    
  end
end
