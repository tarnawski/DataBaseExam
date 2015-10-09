class DatabasesController < ApplicationController
  before_action :set_database, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy, :create]
  before_action :admin!, only: [:index, :show, :new, :edit, :update, :destroy, :create]

  # Sprawdzenie czy użytkownik jest administratorem
  def admin!
  unless current_user.admin?
    redirect_to tests_path, notice: 'Nie masz uprawnień do przeglądania tej strony!' 
  end
  end

  # GET /databases
  def index
    @databases = Database.all
  end

  # GET /databases/1
  def show
  end

  # GET /databases/new
  def new
    @database = Database.new
  end

  # GET /databases/1/edit
  def edit
  end

  # POST /databases

  def create
    @database = Database.create(database_params)
    redirect_to databases_url, notice: 'Dane połączenia zastały zapisane.' 
  end

  # PATCH/PUT /databases/1
  def update
    if @database.update(database_params)
      redirect_to @database, notice: 'Dane połączenia zastały aktualizowane.' 
    else
      render :edit 
    end
  end

  # DELETE /databases/1
  def destroy
    @database.destroy
    redirect_to databases_url, notice: 'Dane połączenia zastały usunięte.' 

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_database
      @database = Database.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def database_params
      params.require(:database).permit(:name, :comment, :adapter, :encoding, :host, :pool, :username, :password, :database, :image)
    end
end
