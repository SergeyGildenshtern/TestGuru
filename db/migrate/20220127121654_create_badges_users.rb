class CreateBadgesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :badge, index: true

      t.timestamps
    end
  end
end
