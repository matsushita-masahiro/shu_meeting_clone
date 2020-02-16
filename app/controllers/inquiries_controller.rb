class InquiriesController < ApplicationController
before_action :authenticate_user!, :only => [:index]
    
  def new
    @inquiry = Inquiry.new
    @inquiry.user_id = current_user.id
    # render :action => 'index'
  end 
  
  def index
    @inquiries = Inquiry.all.order(created_at: :desc)
  end
  
  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'new'
    end
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
     respond_to do |format|
       if @inquiry.save
          ContactMailer.send_when_create(@inquiry).deliver
          ContactMailer.send_when_create_admin(@inquiry).deliver
          format.html { redirect_to root_path, notice: '問い合わせメッセージを送りました。'}
          format.json { render "home/top", status: :created, location: @inquiry}
       else
          flash[:notice] = "メッセージが送れませんでした。"
          format.html { render :new}
          format.json { render json: @inquiry.errors, status: :unprocessable_entity }
       end
     end
  end
  
  
  
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :content, :user_id).merge(:user_id => current_user.id)
  end
end
