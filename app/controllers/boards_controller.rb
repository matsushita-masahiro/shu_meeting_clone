class BoardsController < ApplicationController
before_action :authenticate_user!, :only => [:new, :create]
# before_action :board_params, :only => [:create]

    def new
     @board = Board.new
    end

    def index
      if params[:search].present? 
        logger.debug("================- asdfasdfadf = #{params[:search]}")
      end
    @boards = Board.search(params[:search])
    end
    
    def create
      @board = Board.new(board_params)
      @board.user_id=current_user.id
      if @board.save
          flash[:notice] = "掲示板に新規投稿されました"
          redirect_to boards_path
      else 
          flash[:notice] = "掲示板に新規投稿できませんでした"
          render :new
      end
    end
    
    def show
      @board = Board.find(params[:id])
      @user = User.find(@board.user_id)
      @room = Room.new
      @entry = Entry.new
      @board_message = BoardMessage.new(board_id: @board.id)
      @board_messages = BoardMessage.where(board_id: @board.id)
      @favorite = Favorite.new
    end
  
    def edit
    @board = Board.find(params[:id])
    @user = User.find(@board.user_id)
    if @board.user_id == current_user.id
    else
      redirect_to "/boards"
      flash[:alert] = "無効なユーザー"
    end
    end
    
    def update
    @board = Board.find(params[:id])
    @user = User.find(@board.user_id)
    if @board.user_id == current_user.id
    @board.update(params.require(:board).permit(:title, :book_name, :author, :isbn_num, :category, :condition, :decide_price, :available_period, :remarks, {images: []}))
    end
    end
    
    # def destroy
    # @board = Board.find(params[:id])
    # @user = User.find(@board.user_id)
    # if @board.user_id == current_user.id
    #   @board.destroy
    # else
    #   redirect_to "/boards"
    #   flash[:alert] = "無効なユーザー"
    # end
    # end
    
    private 
    
    def board_params
      params.require(:board).permit(:title, :book_name, :author, :isbn_num, :category, :condition, :decide_price, :available_period, :remarks, {images: []}, :user_id).merge(:user_id => current_user.id)
    end

end