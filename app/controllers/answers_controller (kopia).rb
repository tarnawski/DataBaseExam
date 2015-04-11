class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  expose(:student)
  expose(:answers)
  expose(:answer)


  def index
   
    @points = 0
    @user_answer = Answer.where(student_id: current_user.id).all
    @user_answer.each do |answer|
    @good_answer = Question.find(answer.question_id)
    if(answer.answer_a == @good_answer.a_is_correct && answer.answer_b == @good_answer.b_is_correct && answer.answer_c ==          @good_answer.c_is_correct && answer.answer_d == @good_answer.d_is_correct)
    @points = @points + 1
    end
    end
    @mark = Answer.mark(@good_answer.test_id,@points)

    @results = Result.new
    @results.student_id = current_user.id
    @results.test_id = @good_answer.test_id
    @results.points = @points
    @results.mark = @mark

    if @results.save
    @tu_destroy= Answer.where(student_id: current_user.id).all
    @tu_destroy.each do |tu_destroy|
    tu_destroy.destroy
    end
    end
  end


  def edit

  end



  def show
  
  end


  def new
    @answer = Answer.new
    @tab = session[:tab]
    if(@tab.count==0)
    redirect_to answers_path
    elsif
    @quest = Question.find(@tab[0])
    end
end


  def create
    @tab = session[:tab]
    @quest = Question.find(@tab[0])

    @answer = Answer.new(answer_params)
    @answer.question_id = @quest.id
    @answer.student_id = current_user.id
    @answer.save

    @tab = @tab[1, @tab.length]
    session[:tab] = @tab
    redirect_to new_answer_path
  end

  def update
  @answer.update(answer_params)
   render action: 'edit'
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:student_id, :question_id, :answer_a, :answer_b, :answer_c, :answer_d)
    end
end
