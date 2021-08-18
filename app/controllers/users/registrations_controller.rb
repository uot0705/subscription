class Users::RegistrationsController < Devise::RegistrationsController


  # newアクションは変更しません。
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # createアクションはコメントアウトを外し、superの上に下記を追加
  # POST /resource
def destroy
  @user = User.find(params[:format]) 
      @user.destroy
      flash[:notice] = 'ユーザーを削除しました。'
      redirect_to :root
end

  def create
    @user = User.new(sign_up_params)
    render :new and return if params[:back]
    super
  end

  def update_without_current_password(params)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    update(params)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  # 新規追加
  def confirm
    @user = User.new(sign_up_params)  

  end

  # 新規追加
  def complete
  end

  # アカウント登録後
  def after_sign_up_path_for(resource)
    users_sign_up_complete_path(resource)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :check)
  end

end