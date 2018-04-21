class Note < ApplicationRecord
  belongs_to :Events
  belongs_to :Users
end
