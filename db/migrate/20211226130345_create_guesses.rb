class CreateGuesses < ActiveRecord::Migration[6.0]
  def change
    create_table :guesses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :thing, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
