class ApplicationController < ActionController::API
  require 'net/http'

  def format_params
    tmp_params = params.clone
    JSON.pretty_generate(tmp_params.permit!.to_h)
  end
end
