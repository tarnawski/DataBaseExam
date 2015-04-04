class TestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy, :create]
  before_action :admin!, only: [:show, :new, :edit, :update, :destroy, :create]
  before_action :set_test, only: [:show, :edit, :update, :destroy]
   
    expose(:tests)
    expose(:test)
    expose(:question) { Question.new }
    expose(:result) { Result.new }

  def admin!
  unless current_user.admin?
    redirect_to tests_path,
      flash: { error: 'You are not allowed to edit this product.' }
  end
  end



    def prepare_test
    @students_test = Test.find(params[:selected_test]);
    if @students_test.number_of_questions == 0
    @students_questions = @students_test.questions
    
    elsif @students_test.number_of_questions != 0
    @students_questions = @students_test.questions.first(@students_test.number_of_questions)
    end
   
    @tab = []


    @students_questions.each do |question| 
    @tab << question.id
    end


    if @students_test.random == true
    #This function shuffles (randomizes the order of the elements in) an array
    @tab.shuffle!
    end

    session[:tab] = @tab
 
    redirect_to  new_answer_path
  end


  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show

  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    @test.user_id = current_user.id

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :available, :user_id, :number_of_questions, :random, :time, :single_test, :standard_score, :bdb, :bd, :dost)
    end
end
