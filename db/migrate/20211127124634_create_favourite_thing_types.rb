class CreateFavouriteThingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :favourite_thing_types do |t|
      t.string :name
      t.references :favourite_thing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
