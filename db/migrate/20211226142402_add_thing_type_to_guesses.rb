class AddThingTypeToGuesses < ActiveRecord::Migration[6.0]
  def change
    add_reference :guesses, :thing_type, null: false, foreign_key: true
  end
end
