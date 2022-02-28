class RenameTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :votes, :like
  end
end
