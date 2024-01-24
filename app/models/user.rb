class User < ApplicationRecord
  has_many :tickets

  validates :time_zone, presence: true
end
