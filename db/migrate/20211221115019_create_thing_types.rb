class CreateThingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :thing_types do |t|
      t.string :name
      t.string :url
      t.references :thing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
