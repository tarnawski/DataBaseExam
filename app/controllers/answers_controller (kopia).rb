class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update]
  before_action :acces!, only: [:index, :new, :show, :edit, :update]

  expose(:student)
  expose(:answers)
  expose(:answer)

  #Sprawdzanie czy użytkownik ma dostęp do pytania
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
    #Wyczytanie wszystkich pytań do zmiennej
    @tab = Answer.where(student_id: current_user.id).order("id")
    #Wczytanie dbierzącego pytania
    @answer = Answer.find(params[:id])
    
    #Przekazanie ilości pytań na które udzielono odpowiedzi
    @not_checked = Answer.where(answer:'',student_id: current_user.id).count
    
    #Wczytanie bierzącej odpowiedzi
    @sql = @answer.answer

if @sql.include?("create") || @sql.include?("insert") || @sql.include?("update") || @sql.include?("delete")

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
    @tab = session[:tab]
    @tab.each do |tab|
    @answer = Answer.new()
    @quest = Question.find(tab)
    @answer.question_id = @quest.id
    @answer.student_id = current_user.id
    @answer.answer = ''
    @answer.save
    end

    #Wywołanie funkcji odpowiednio przygotowującej połączenie z bazą danych 
    TestDataBase.prepare_connection(Test.find(@quest.test_id).database)
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
