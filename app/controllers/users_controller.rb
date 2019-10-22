class UsersController < ApplicationController
  def show
  end
  
  def zipedit
  params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end
end
