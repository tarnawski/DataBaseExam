class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy, :create]
  before_action :admin!, only: [:index, :show, :new, :edit, :update, :destroy, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  expose(:test)
  expose(:questions)
  expose(:question)

  def admin!
  unless current_user.admin?
    redirect_to tests_path,
      flash: { error: 'You are not allowed to edit this question.' }
  end
  end


  def index
  end


  def show
  end


  def new

  DataBase.prepare_connection(Test.find(params[:test_id]).database)

  @button = params[:button]
  @content = params[:content]
  
  if params[:sql]
  @sql = params[:sql]
  

  if @button == 'show'
  if @sql =~/create/i || @sql =~/insert/i || @sql =~/update/i || @sql =~/delete/i


    begin
      @zmienna=DataBase.answer_sql(@sql)
    rescue 
      @err = "In Your's query is something wrong, so can't execute"
    end

  elsif

    begin
      @zmienna=DataBase.connection.exec_query (@sql)
    rescue 
      @err = "In Your's query is something wrong, so can't execute"
    end

  end

  elsif @button == 'save' 
    self.question = Question.new()
    question.content = @content
    question.query = @sql
    if question.save
    test.questions << question
    render action: 'show'
    else
    render action: 'new'
    end
  end
 end

end


  def edit 

  DataBase.prepare_connection(Test.find(params[:test_id]).database)

  tmp=Question.find(params[:id])
  @sql=tmp.query
  @content=tmp.content 

  @button = params[:button]
  
  
  if params[:sql]
  @sql = params[:sql]
  @content = params[:content]

if @button == 'show'
if @sql =~/create/i || @sql =~/insert/i || @sql =~/update/i || @sql =~/delete/i


  begin
    @zmienna=DataBase.answer_sql(@sql)
  rescue 
    @err = "In Your's query is something wrong, so can't execute"
  end

elsif

 begin
    @zmienna=DataBase.connection.exec_query (@sql)
  rescue 
    @err = "In Your's query is something wrong, so can't execute"
  end

end
elsif @button == 'save' 
 if user_signed_in?
  question = Question.find(params[:id])
  parametry=Hash["test_id"=>params[:test_id],"content"=>@content, "query" =>@sql]
  question.update(parametry)
  render action: 'show'

 else
   redirect_to new_user_session_url
end
end
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
      params.require(:question).permit(:test_id, :content, :query)
    end
end
