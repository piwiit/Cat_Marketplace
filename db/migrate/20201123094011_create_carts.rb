class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.boolean :Is_archived, default: false
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
