class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  expose(:test)
  expose(:questions)
  expose(:question)


  def index
  end


  def show
  end


  def new
  end


  def edit
  end


  def create

    self.question = Question.new(question_params)
    if question.save
      test.questions << question
      redirect_to test_question_url(test, question), notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
end
  
 

  def update

 if user_signed_in?	
    @question = Question.find(params[:id])
    if @question.update(question_params)
    redirect_to test_path(params[:test_id]), notice: "Question updated."
    else
     render action: 'edit'
    end  
 else
redirect_to new_user_session_url
end
  end


  def destroy
    if user_signed_in?
    question.destroy
   redirect_to test_path(params[:test_id]), notice: 'Question was successfully destroyed.'

else
redirect_to new_user_session_url

end

  end


  private


    def set_question
      question = Question.find(params[:id])
    end


    def question_params
      params.require(:question).permit(:test_id, :content, :answer_a, :answer_b, :answer_c, :answer_d, :a_is_correct, :b_is_correct, :c_is_correct, :d_is_correct)
    end
end
