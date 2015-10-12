class TeacherController < ApplicationController
  before_action :set_user, only: [:promote, :downgrade]
  before_action :authenticate_user!, only: [:index]
  before_action :admin!, only: [:index]

  # Sprawdzenie czy użytkownik jest administratorem
  def admin!
    unless current_user.admin? && current_user.super_admin == true
      redirect_to tests_path, notice: 'Nie masz uprawnień do przeglądania tej strony!' 
    end
  end

  def index
    @teaches = User.where(admin: true, super_admin: false)
    @others = User.where(admin: false, super_admin: false)
  end

  def promote
    @user.update_attribute :admin, true
    redirect_to teacher_index_path, notice: 'Uprawnienia zostały dodane'
  end

  def downgrade
    @user.update_attribute :admin, false
    redirect_to teacher_index_path, notice: 'Uprawnienia zostały odebrane'
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
