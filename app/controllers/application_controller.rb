class ApplicationController < ActionController::Base
	  # Ignore CSRF token requirements on POST/PATCH/PUT
	  skip_before_action :verify_authenticity_token
end
