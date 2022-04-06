class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :gender, :integer
  end
end
