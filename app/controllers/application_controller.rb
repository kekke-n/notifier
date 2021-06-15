class ApplicationController < ActionController::API
  require 'net/http'

  before_action :valid_api_token?

  def valid_api_token?
    unless params[:token] == ENV['API_TOKEN']
      render status: :unauthorized
    end
  end

  def format_params
    tmp_params = params.clone
    JSON.pretty_generate(tmp_params.permit!.to_h)
  end
end
