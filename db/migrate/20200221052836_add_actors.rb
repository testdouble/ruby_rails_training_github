class AddActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :facebook_likes
    end
  end
end
