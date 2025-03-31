class Member < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable
end
