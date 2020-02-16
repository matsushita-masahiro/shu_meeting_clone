class AnswersController < ApplicationController
  
  def new
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @answer = Answer.new
  end
  
  def create
    @answer = Answer.new(answer_params)
    
     respond_to do |format|
       if @answer.save
          ContactMailer.send_when_answer(@answer).deliver
          ContactMailer.send_when_answer_admin(@answer).deliver
          format.html { redirect_to root_path, notice: '回答を送りました。'}
          format.json { render "home/top", status: :created, location: @answer}
       else
          flash[:notice] = "回答が送れませんでした。"
          format.html { render :new}
          format.json { render json: @answer.errors, status: :unprocessable_entity }
       end
     end
  end
  
  
  private
    def answer_params
      params.require(:answer).permit(:answer, :inquiry_id)
    end
end
