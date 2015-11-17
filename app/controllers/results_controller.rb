class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :create]
  before_action :admin!, only: [:index, :show, :edit, :update, :destroy] 
  expose(:test)
  expose(:results)
  expose(:result)

  def admin!
  unless current_user.admin?
    redirect_to tests_path,
      flash: { error: 'Nie masz uprawnień do przeglądanie tej strony' }
  end
  end

  def index
    @results = Result.where(test_id: params[:test_id])
  end

  def raport
    @test = Test.find(params[:test_id])
    @results = Result.where(test_id: params[:test_id])
    
    render layout: false 

  end

  def raportpdf
    @test = Test.find(params[:test_id])
    @results = Result.where(test_id: params[:test_id])
    render pdf:		'wyniki_testu',
    disposition:        'attachment' 
  end

  def pdfdetails
    @student=params[:student]
    @answers=Answer.where(student_id: params[:student], test_id: params[:test_id])
    @results = Result.where(test_id: params[:test_id]) 
    render pdf:		'wyniki_testu',
    disposition:        'attachment'
 
  end

  def show
    @student=params[:student]
    @answers=Answer.where(student_id: params[:student], test_id: params[:test_id]); 
  end

  def new
    @result = Result.new
  end

  def edit
  end

  def create
   
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to test_results_path(:id =>test.id), notice: 'Wynik został pomyślnie aktualizowany' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to test_results_path(:id =>test.id), notice: 'Wynik został pomyślnie usunięty' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:student_id, :test_id, :points, :mark)
    end
end
