class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update]
  before_action :acces!, only: [:index, :new, :show, :edit, :update]



  expose(:student)
  expose(:answers)
  expose(:answer)

  def acces!
  @acces = session[:tab]
  @acces = Question.find(@acces[0])
  unless (current_user.admin?) || (!current_user.admin?) && (Test.find(@acces.test_id).available)
    redirect_to tests_path,
      flash: { error: 'You are not allowed to edit this question.' }
  end
  end


  def index


  end


  def edit
 
  end



  def show
    @tab = Answer.where(student_id: current_user.id).order("id")
    @answer = Answer.find(params[:id])

    @not_checked = Answer.where(answer:'',student_id: current_user.id).count
 

@sql = Answer.find(params[:id]).answer

if @sql.include?("create") || @sql.include?("insert") || @sql.include?("update") || @sql.include?("delete")

  begin
    @zmienna=Answer.answer_sql(@sql)
  rescue 
    @err = "In Your's query is something wrong, so can't execute"
  end

elsif

 begin
    
    @zmienna=ActiveRecord::Base.connection.exec_query (@sql)
  rescue 
    @err = "In Your's query is something wrong, so can't execute"
  end

end
  
   
  end


  def prepare

    @to_destroy= Answer.where(student_id: current_user.id).all
    @to_destroy.each do |to_destroy|
    to_destroy.destroy
    end


    @tab = session[:tab]
    @tab.each do |tab|
    @answer = Answer.new()
    @quest = Question.find(tab)
    @answer.question_id = @quest.id
    @answer.student_id = current_user.id
    @answer.answer = ''
    @answer.save
    end
    
  end


def new
prepare
redirect_to answer_path(Answer.where(student_id: current_user.id).first.id)
end


  def create
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
      params.require(:answer).permit(:student_id, :question_id, :answer)
    end
end
