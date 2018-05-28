class Client < ApplicationRecord
  has_secure_token :access_token
  attribute :password, :string, :default => 0

  has_many :questions, ->(client){where("questions.UserType=?", client.UserType)}#-> { where("questions.UserType = clients.UserType") }
  has_many :answers, through: :questions
end
