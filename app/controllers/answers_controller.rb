class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update]

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
    @tab = Answer.where(student_id: current_user.id).order("id")
    @answer = Answer.find(params[:id])

    @not_checked = Answer.where(answer_a: false, answer_b: false, answer_c: false, answer_d: false).count
    
  end


  def prepare
    @tab = session[:tab]
    @tab.each do |tab|
    @answer = Answer.new()
    @quest = Question.find(tab)
    @answer.question_id = @quest.id
    @answer.student_id = current_user.id
    @answer.answer_a = false
    @answer.answer_b = false
    @answer.answer_c = false
    @answer.answer_d = false
    @answer.save
    end
    
  end


def new
prepare
redirect_to answer_path(Answer.where(student_id: current_user.id).first.id)
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
        
   redirect_to answer_path
  end



  private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:student_id, :question_id, :answer_a, :answer_b, :answer_c, :answer_d)
    end
end
