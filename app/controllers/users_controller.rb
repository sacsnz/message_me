class UsersController < ApplicationController
   before_action :set_user, only: [:edit, :update, :show]
   before_action :require_same_user, only: [:edit, :update, :destroy]
   before_action :require_admin, only: [:index, :destroy]
   
   def index
      @users = User.paginate(page: params[:page], per_page: 5)
   end
   
   def new
      @user = User.new 
   end
   
   def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id]= @user.id
         flash[:success] = "Welcome to MessageMe #{@user.username}"
         redirect_to root_path
      else
         render 'new'
      end
   end
   
   def edit
      
   end 
   
   def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:success] = "Your account was updated successfully"
         redirect_to users_path
      else
         render 'new'
      end
   end
   
   def show
      
   end
   
   def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:error] = "The user and messages have been deleted"
      redirect_to users_path
   end
   
   private
   def user_params
      params.require(:user).permit(:username, :name, :age, :email, :password)
   end
   
   def set_user
      @user = User.find(params[:id])
   end
   
   def require_same_user
      if current_user!= @user and !current_user.admin?
         flash[:error] = "You can only edit you own account"
         redirect_to root_path
      end
   end
   
   def require_admin
      if logged_in? and !current_user.admin?
         flash[:error] = "Only admin can perform that action"
         redirect_to root_path
      end
   end
   
end