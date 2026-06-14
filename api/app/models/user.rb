class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
        :registerable,
        :rememberable,
        :recoverable,
        :validatable,
        :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
end
