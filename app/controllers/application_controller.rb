require "application_responder"

class ApplicationController < ActionController::Base
  
  include Response
  # prepend_around_action RailsClientTimezone::Filter
  self.responder = ApplicationResponder
  respond_to :json

  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing do |exception|
    render json: {exception.param => "is required"}, status: 422
  end

  # global handler for simple not found case
  rescue_from ActiveRecord::RecordNotFound do |e|
    error_response(message: e.message, status: 404)
  end


  # def authenticate!
  #   # unless current_user

  #   if current_user
  #     current_user
  #   else
  #     raise Exception.new({'message' => 'hjasfhas'})
  #   end
  # end

  # def authenticate!
  #   error('Unauthorized. Invalid or expired token.', 401) unless current_user
  # end

  # def current_user
  #   return @current_user if @current_user.present?
  #   user = User.find_by(access_token: params.delete(:token))
  #   if user.present?
  #     @current_user = user
  #   else
  #     false
  #   end
  # end

  def authenticate!
    authenticate_token || render_unauthorized
  end

  def authenticate_token
      @current_user = User.find_by(access_token: params.delete(:token))
  end

  def render_unauthorized(realm = "Application")
    json_response('fsgdfhdf')
    
  end
end
