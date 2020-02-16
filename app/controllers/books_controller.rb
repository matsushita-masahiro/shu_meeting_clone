class BooksController < ApplicationController
  
  def index
      @books = Book.all
    # @books = Book.all.order(created_at: :desc)
  end

  def show
      @book = Book.find_by(id: params[:id])
      @book.id = params[:id]
  end
end
