class UsersController < ApplicationController
 before_action :authenticate_user!, only: [:show]
 
  def index
    @users = User.all.page(params[:page])
  end
 
  def show
    @user = User.find(params[:id])
    @room = Room.new
    @entry = Entry.new
    # @board = @user.boards.order('created_at desc')
    @boards = Board.where(user_id: @user.id)
  end
  
  
  def confirm 
     @user = User.find(confirm_params)
  end
  
  def likes
    @user = User.find(params[:id])
    @favboards = @user.favboards.page(params[:page])
    counts(@user)
  end
  
  
  def zipedit
    params.require(:user).permit(:postcode, :prefecture_code, :prefecture_name, :address_city, :address_street, :address_building)
  end
  
  private
  def confirm_params
      params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :postcode, :prefecture_code, :prefecture_name, :address_city, :address_street, :address_building, :college, :major, :email, :password, :password_confirmation)
  end
  
  def icon_params
      params.require(:user).permit(:icon)
  end
end
