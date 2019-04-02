class UsersController < ApplicationController
  before_action :loggedinuser,only: [:index,:edit,:update]
  before_action :correct_user, only: [:edit,:update]
  def index
    @users=User.paginate(page: params[:page])
  end
  def new
  	@user=User.new
  end
  def show
    @user=User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
    	flash[:success]="Welcome to our app"
    	redirect_to @user
    else
    	render 'new'
    end
  end
  def edit
     @user=User.find(params[:id])
  end
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def loggedinuser
    unless loggedin?
      store_location
      flash[:danger]="Please log-in"
      redirect_to login_path
    end
  end
  def correct_user
     @user=User.find(params[:id])
     redirect_to login_path unless current_user?(@user)
   end
  

  private
     def user_params
     	params.require(:user).permit(:name,:email,:password,:password_confirmation)
     end
end
