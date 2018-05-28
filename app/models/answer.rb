class Answer < ApplicationRecord
	has_many :questions
	has_many :clients, through: :questions
end
