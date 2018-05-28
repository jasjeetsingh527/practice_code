class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :answer_text
  has_many :questions
  has_many :clients, through: :questions
end
