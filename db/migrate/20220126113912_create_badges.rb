class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image_url, null: false
      t.integer :badge_type, null: false, index: true
      t.string :addition

      t.timestamps
    end
  end
end
