class Admin::Authenticator
  def initialize(admin)
    @admin = admin
  end

  def authenticate(raw_password)
    # FIX_ME これはひどいw
    @admin &&
      !@admin.suspended? &&
      @admin.hashed_password &&
      BCrypt::Password.new(@admin.hashed_password) == raw_password
  end
end
