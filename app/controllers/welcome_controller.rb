class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Swagger::Docs::ImpotentMethods
  swagger_controller :welcome, "Users"

  swagger_api :index do
    summary "Fetches all users"
    response :unauthorized
    response :not_acceptable
  end

  swagger_api :create do
    summary "Fetches all users"
    response :unauthorized
    response :not_acceptable
  end

  def index
    render :json =>  { 'error' => {'message' => 'gfjftjfjfg', 'code' => 500 } }
  end

  def create
    render :json =>  { 'error' => {'message' => 'gfjftjfjfg', 'code' => 500 } }
  end
end
