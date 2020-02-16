# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update, :confirm]
  # before_action :create, only: [:create]

  # def create
    # super do 
    #   resource.update(confirmed_at: Time .now.utc) #Welcomeメールを送信した上で、skip_confirmation!と同一処理を行う
    # end 
  # end
  
  
  
  
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end
  # def edit
  #   current_user.assign_attributes(account_update_params)
  # end
  
  # def confirm
  #   @user = User.new(account_update_params)
  #   if @user.valid?
  #     render :action => 'confirm'
  #   else
  #   render :action => 'new'
  #   end
  #   # logger.debug("========================== params = #{@user.last_name}")
  #   # logger.debug("========================== params = #{@user.postcode}")
  #   # @params = params[:user]
  # end
  
  def confirm 
    @user = User.new(account_update_params)
    if @user.valid?
    flash[:notice]="会員登録が完了されました！内容を確認してください！"
    render :action => 'confirm'
    else
    render :action => 'new'
    end
  end
  
  def complete
  end
  
  def delete
  end
  
  
  protected
  

  def configure_sign_up_params
    flash[:notice]="仮登録完了です！"
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:icon, :last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :postcode, :prefecture_name, :address_city, :address_street, :address_building, :college, :major, :email, :password, :password_confirmation])
  end
  
  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
  
  def after_update_path_for(resource)
    complete_path
  end
  #  
  # edit_user_registration_path
  # end
  # user_path(id: current_user.id)
  # def after_update_path_for(resource)
  #   user_registration_path(id: current_user.id)
  # end
  
  # def after_confirm_path_for(resource)
  #   user_registration_path(id: current_user.id)
  # end
  
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
   # def configure_save_params
  #     devise_parameter_sanitizer.permit(:complete, keys[ :last_name, :first_name, :last_name_kana, :first_name_kana,:gender, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :college, :major])
  # end
  # 追記する
  

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
  


end


