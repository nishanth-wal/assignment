class ApplicationController < ActionController::API
	# before_action :authenticate_users!

	def authenticate_users!
   if request.headers['X-API-TOKEN'].present?
     @current_user = User.find_by(api_token: request.headers['X-API-TOKEN'])
     render(json: { error: 'invalid_api_token' }, status: 403) && return if @current_user.nil?
   else
     render(json: { error: 'invalid_api_token' }, status: 403)
   end
 end
end
