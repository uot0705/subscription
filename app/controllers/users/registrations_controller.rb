class Users::RegistrationsController < Devise::RegistrationsController


  # newアクションは変更しません。
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # createアクションはコメントアウトを外し、superの上に下記を追加
  # POST /resource
  def create
    @user = User.new(sign_up_params)
    render :new and return if params[:back]
    super
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

end