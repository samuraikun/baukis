class Admin::SessionsController < Admin::Base
  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(user_params)
    admin = Administrator.find_by(email_for_index: @form.email.downcase) if @form.email.present?

    # FIX_ME 別メソッドに分けたい人生だった...
    if Admin::Authenticator.new(admin).authenticate(@form.password)
      session[:admin_id] = admin.id
      flash.notice = 'ログイン成功'
      redirect_to :admin_root
    else
      admin.suspended ? flash.now.alert = 'アカウントが停止されています。' : flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:admin_id)
    redirect_to :admin_root
  end

  private

  def user_params
    params.require(:admin_login_form).permit(:email, :password)
  end
end
