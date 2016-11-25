class Task < ApplicationRecord
  has_many :tpublics
  belongs_to :user
  belongs_to :cat
end
