class SqlboxController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :admin!, only: [:index] 

  def admin!
    unless current_user.admin?
      redirect_to tests_path,
      flash: { error: 'Nie masz uprawnień do przeglądanie tej strony' }
    end
  end

  def index
    @button = params[:button]
    if params[:sql]
      @sql = params[:sql]
      @database = params[:database]
      Sqlbox.prepare_connection(@database)
      begin
        @zmienna2=Sqlbox.connection.exec_query (@sql)
      rescue ActiveRecord::StatementInvalid => exception
        @err = exception.message
      end
    end
  end
end
