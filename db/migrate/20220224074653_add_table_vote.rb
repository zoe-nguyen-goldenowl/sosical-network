class AddTableVote < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :users
      t.references :posts
    end
  end
end
