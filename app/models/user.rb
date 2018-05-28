class User < ApplicationRecord
	has_secure_password
	before_create :generate_access_token_with_expiry
	before_save :downcase_email

	private

	def generate_access_token_with_expiry
		begin
			self.access_token = SecureRandom.hex
		end while self.class.find_by(access_token: access_token)
	end

	def downcase_email
		email = email.try(:downcase)
	end
end
