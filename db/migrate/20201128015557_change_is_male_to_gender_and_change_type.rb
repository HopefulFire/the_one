class ChangeIsMaleToGenderAndChangeType < ActiveRecord::Migration[6.0]
  def change
    change_table :profiles do |profiles|
      profiles.rename :is_male, :gender
      profiles.change :gender, :string
    end
  end
end
