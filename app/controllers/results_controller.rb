class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_action :admin!, only: [:index, :show, :edit, :update, :destroy] 
  expose(:test)
  expose(:results)
  expose(:result)

  def admin!
  unless current_user.admin?
    redirect_to tests_path,
      flash: { error: 'You are not allowed to edit this question.' }
  end
  end

  # GET /results
  # GET /results.json
  def index
    @results = Result.where(test_id: params[:test_id])
  end

  # GET /results/1
  # GET /results/1.json
  def show
  @student=params[:student]
  @answers=Answer.where(student_id: @student); 
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end


  def create
   
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to test_results_path(:id =>test.id), notice: 'Result was successfully updated.' }
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
      format.html { redirect_to test_results_path(:id =>test.id), notice: 'Result was successfully destroyed.' }
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
