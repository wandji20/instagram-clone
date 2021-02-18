class User < ApplicationRecord
  validates :name, presence: true, length: { in: (5..16)}
  validates :password, presence: true, length: { in: (5..16)}
  validates :username, presence: true, uniqueness: true
end
