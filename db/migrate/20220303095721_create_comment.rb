class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :commentable, polymorphic: true, null: false
      t.references :owner, polymorphic: true, null: false
      t.timestamps
    end
  end
end
