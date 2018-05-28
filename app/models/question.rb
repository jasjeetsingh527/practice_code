class Question < ApplicationRecord
	belongs_to :client
	belongs_to :answer
	scope :UserType, lambda { |user_type, client_id| where(:UserType => user_type, :client_id => client_id) }
end
