class AddSuccessfullyToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :successfully, :boolean, default: false
  end
end
