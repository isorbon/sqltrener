class Test < ApplicationRecord
  has_many :tpublics, :dependent => :destroy
end
