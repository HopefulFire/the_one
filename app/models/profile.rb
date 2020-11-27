class Profile < ApplicationRecord
  belongs_to :user

  def gender
    if is_male
      'Male'
    elsif is_male == false
      'Female'
    else
      'Non-Binary'
    end
  end
end
