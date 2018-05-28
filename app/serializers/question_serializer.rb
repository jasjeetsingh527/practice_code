class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :client_id, :UserType, :answer_id
  belongs_to :user
  belongs_to :answer
end
