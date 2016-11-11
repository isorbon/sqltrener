class User < ApplicationRecord
  #attr_accessor :fname,:lname,:login,:password,:img,:typ
  #  before_save :encrypt_password
  validates :fname,:lname,:login,:password,:img,:typ, presence: true
  #validates :login, format: { with:  /^[a-zA-Z0-9]*$/ }
  validates :fname,:lname, length: { minimum: 2 }
  validates :login, length: { in: 5..15 },uniqueness: true
  validates :typ, length: { in: 0..1 }
end
