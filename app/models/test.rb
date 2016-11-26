class Test < ApplicationRecord
  has_many :tpublics, :dependent => :destroy
  has_many :stud_ts, :dependent => :destroy
end
