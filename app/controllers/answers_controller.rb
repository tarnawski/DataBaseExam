class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update]
  before_action :acces!, only: [:index, :new, :show, :edit, :update, :prepare]

  expose(:student)
  expose(:answers)
  expose(:answer)

  #Ustalenie testu oraz bazy danych i sprawdzanie czy użytkownik ma dostęp do pytania
  def acces!
    @get_session = session[:tab]
    @first_question_in_session = Question.find(@get_session[0])
    @current_test = Test.find(@first_question_in_session.test_id)
    @current_database = Database.find(@current_test.database)

    unless (current_user.admin?) || (!current_user.admin?) && (@current_test.available)
      redirect_to tests_path,
      flash: { error: 'You are not allowed to edit this question.' }
    end
  end


  def index
    @all_answers = Answer.where(student_id: current_user.id).order("id")
    @points =0;
    @all_answers.each do |answer|
    if answer.answer!=''
      if answer.answer =~/cerate/i  || answer.answer =~/insert/i  || answer.answer =~/update/i || answer.answer =~/delete/i 
        begin
          zm1=TestDataBase.answer_sql(answer.answer)
          @zm1=zm1.to_hash
        rescue 
          @zm1="null"
        end
      elsif
        begin
          zm1=TestDataBase.connection.exec_query (answer.answer)
          @zm1=zm1.to_hash
        rescue 
          @zm1="null"
        end
    end


correct_query = Question.find(answer.question_id).query
if correct_query =~/create/i  || correct_query =~/insert/i  || correct_query =~/update/i  || correct_query =~/delete/i 

  begin
    zm1=TestDataBase.answer_sql(correct_query)
    @zm2=zm1.to_hash
  rescue 
    @zm2="null"
  end

elsif

 begin
    zm1=TestDataBase.connection.exec_query (correct_query)
    @zm2=zm1.to_hash
  rescue 
    @zm2="null"
  end

end



if (!@zm1.empty? && !@zm2.empty?)
if(@zm1==@zm2)
@points = @points+1
else

#if(@zm1==@zm2)
#@points = @points+1
#end
end
end

end  
  end
#Wywołanie funkcji wyznaczającej ocene
@mark = Answer.mark(@current_test.id,@points)

#Jeśli użytkownik jest w bazie to go usuwamy
tmp=Result.where(student_id: current_user.id, test_id: @current_test.id )
unless tmp.empty?
tmp.destroy_all
end
results = Result.new
results.student_id = current_user.id
results.test_id = @current_test.id
results.points = @points
results.mark = @mark
results.save

  end


  def edit
 
  end



  def show
    #Wyczytanie wszystkich pytań do zmiennej
    @tab = Answer.where(student_id: current_user.id).order("id")
    #Wczytanie dbierzącego pytania
    @answer = Answer.find(params[:id])
    
    #Przekazanie ilości pytań na które nie udzielono odpowiedzi
    @not_checked = Answer.where(answer:'',student_id: current_user.id).count
    
    #Wczytanie bierzącej odpowiedzi
    @sql = @answer.answer
if @sql =~/rollback/i || @sql =~/commit/i  || @sql =~/savepoint/i 
redirect_to tests_path, notice: 'Test broken! Do not try this again!' 
end

if @sql =~/create/i || @sql =~/insert/i  || @sql =~/update/i  || @sql =~/delete/i 

  begin
    @zmienna=TestDataBase.answer_sql(@sql)
  rescue 
    @err = "In Your's query is something wrong, so can't execute"
  end

elsif

 begin
    @zmienna=TestDataBase.connection.exec_query (@sql)
  rescue 
    @err = "In Your's query is something wrong, so can't execute"
  end

end
  
   
  end

  #Przygotowanie tabeli Answers w bazie danych na przyjęcie odpowiedzi od użytkownika
  def prepare

    #Usunięcie z tabeli poprzednich odpowiedzi zalogowanego użytkownika
    @to_destroy= Answer.where(student_id: current_user.id).all
    @to_destroy.each do |to_destroy|
    to_destroy.destroy
    end

    #Przygotowanie tabeli Answers

    @get_session.each do |tab|
    @answer = Answer.new()
    @quest = Question.find(tab)
    @answer.question_id = @quest.id
    @answer.student_id = current_user.id
    @answer.answer = ''
    @answer.save
    end

    #Wywołanie funkcji odpowiednio przygotowującej połączenie z bazą danych 
    TestDataBase.prepare_connection(@current_test.database)
  end

#Wywołanie funkcji przygotowującej tabele Answers na odpowiedzi oraz przekierowanie do pierwszego pytania
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
