class Api::V1::RegisterController < ApplicationController
  layout nil
  skip_before_action :verify_authenticity_token
  # respond_to :json
  include Swagger::Docs::ImpotentMethods
  swagger_controller :register, "Users"

  swagger_api :index do
    summary "Fetches all users"
    response :unauthorized
    response :not_acceptable
  end

   swagger_api :get_user do
    param :query, :page, :integer, :optional, "Page number"
    summary "Fetches all users"
    response :unauthorized
    response :not_acceptable
  end

  def index
    render json: Client.all
  end

  def create
    # json_response( User.create!(create_params) )
    render json: Client.create(create_params)
  end

  def show

    # byebug
    begin
    @client = Client.all
    # render json: @client, :include => {:questions => {:only => :question}}
    render json: @client.to_json(include: {questions: {include: {answer: {only: :answer_text}}} })
      
    rescue Exception => e
      render json: e.message
    end
    # key = "UserShortSerializer-#@client.id}-#{@client.updated_at.to_i}"
    # Rails.cache.fetch(key, expires_in: 3.hours) do
    #   render json: @client, serializer: nil#.questions
    # end


    # render json: Time.zone.now
  end

  def get_user


    # authenticate!
    # render json: @current_user

    render :json =>  { 'error' => {'message' => 'gfjftjfjfg', 'code' => 500 } }

  end

  private
  def create_params
    params.require(:username)
    params.require(:password)
    params.permit(:username, :password)
  end
end
