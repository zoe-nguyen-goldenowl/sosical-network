class AddTableLike < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :users
      t.references :posts
    end
  end
end
