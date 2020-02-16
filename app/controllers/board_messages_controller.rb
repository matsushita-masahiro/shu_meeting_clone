class BoardMessagesController < ApplicationController
    
    def create
        @board_message = BoardMessage.new(board_message_params)
        @board = Board.find_by(id: @board_message.board_id)
        @board_messages = BoardMessage.where(board_id: @board.id)
        @user = User.find_by(id: @board.user_id)
        if @board_message.save
            logger.debug("==========================board_id =  #{@board_message.board_id}")
            flash[:notice] = "メッセージ送信されました"
            redirect_to "/boards/#{@board_message.board_id}"
        else
            render "boards/show"
        end
    end
    
    def edit
     @board_message = BoardMessage.find_by(id: params[:id])
    end

    def update
     @board_message = BoardMessage.find_by(id: params[:id])
     @board_message.update(content: params[:content])
        redirect_to("/")
    end
    
    def destroy
        @board_message = BoardMessage.find_by(id: params[:id])
        @board_message.destroy
        flash[:notice]="メッセージを削除しました"
        redirect_back(fallback_location: root_path)
    end
    
    private
      def board_message_params
        params.require(:board_message).permit(:board_id, :user_id, :content).merge(:user_id => current_user.id)
      end
end
