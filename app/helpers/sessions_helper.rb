module SessionsHelper
	def log_in(user)
       session[:user_id]=user.id
	end
	def current_user
		if session[:user_id]
			@current_user ||=User.find_by(id: session[:user_id])
	    end
	end
	def loggedin?
		!!current_user
    end
    def log_out
       session[:user_id]=nil
    end
    def current_user?(user)
       user==current_user
    end
    def store_location
       session[:forwarding_url]= request.original_url if request.get?
    end
    def redirect_back_to(default)
       redirect_to(session[:forwarding_url]||default)
       session.delete(:forwarding_url) 
    end
end
