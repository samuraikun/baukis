class Staff::SessionsController < Staff::Base
  def new
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: 'new'
    end
  end

  def create
    # NOTE Rails5では、Strong Parametersが必須っぽい
    @form = Staff::LoginForm.new(user_params)
    staff_member = StaffMember.find_by(email_for_index: @form.email.downcase) if @form.email.present?

    if staff_member
      session[:staff_member_id] = staff_member.id
      redirect_to :staff_root
    else
      render action: 'new'
    end
  end

  def destroy
    session.delete(:staff_member_id)
    redirect_to :staff_root
  end

  private

  def user_params
    params.require(:staff_login_form).permit(:email, :password)
  end
end
