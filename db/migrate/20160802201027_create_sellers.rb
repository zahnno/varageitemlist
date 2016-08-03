class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
    end
  end
end
