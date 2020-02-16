class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :board_messages, dependent: :destroy
  has_many :boards, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favboards, through: :favorites, source: :board

        
  def prefecture_name
     JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end   
  
  def prefecture_name=(prefecture_name)
     self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end 

   
  
  mount_uploader :icon, ImgUploader
  
  def update_without_current_password(params, *options)
  params.delete(:current_password)
  
      if params[:password].blank? && params[:password_confirmation].blank?
        params.delete(:password)
        params.delete(:password_confirmation)
      end
  
      result = update_attributes(params, *options)
      clean_up_passwords
      result
  end
    

  #お気にり登録判定
  def already_liked?(board)
    self.favorites.exists?(board_id: board.id)
  end 
    

end
