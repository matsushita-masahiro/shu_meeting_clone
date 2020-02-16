class Board < ApplicationRecord
  mount_uploaders :images, ImgUploader
  serialize :images, JSON
  
  belongs_to :user
  has_many :board_messages
  has_many :favorites, dependent: :destroy
  has_many :liked_users, through: :favorites, source: :user
  
 def self.search(search)
  return Board.all unless search
    Board.where(['author LIKE ?', "%#{search}%"])
    .or(Board.where(['isbn_num LIKE ?', "%#{search}%"]))
    .or(Board.where(['book_name LIKE ?', "%#{search}%"]))
 end

end

# https://qiita.com/motty93/items/455515ede653371a5887