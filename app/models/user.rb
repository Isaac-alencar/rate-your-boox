# frozen_string_literal: true

# User
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, as: :commentable
  has_many :rating

  validates :username, presence: true,
                       uniqueness: true,
                       length: { minimum: 3, maximum: 15 }
end
