class SetGuessDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :guesses, :completed, :boolean, default: false
    
  end
end
