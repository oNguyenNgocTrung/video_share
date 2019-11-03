class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_many :videos, dependent: :destroy
end
