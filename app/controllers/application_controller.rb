class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

  include SessionsHelper

  def respond_as_json(model)
    
    respond_to do |format|
                format.json {render json: model}
    end 
  end 

end
