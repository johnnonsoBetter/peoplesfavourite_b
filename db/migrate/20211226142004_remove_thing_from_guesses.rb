class RemoveThingFromGuesses < ActiveRecord::Migration[6.0]
  def change
    remove_column :guesses, :thing_id
  end
end
