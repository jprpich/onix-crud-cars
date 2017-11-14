class Car < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :owner
  validates :brand, :model, :img_url, presence: true
end


