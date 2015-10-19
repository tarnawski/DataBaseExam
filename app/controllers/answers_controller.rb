class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update]
  before_action :acces!, only: [:index, :new, :show, :edit, :update]

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
      flash: { error: 'Nie masz uprawnień do przedlądanie tej strony.' }
    end
  end


  def index
    @all_answers = Answer.where(student_id: current_user.id).order("id")
    
    #Wywołanie funkcji wyznaczającej punkty
    @points = Answer.checkAnswer(@all_answers)

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
      redirect_to tests_path, notice: 'Test zakończony. Zarejestrowano próbe ataku SQL Injection ' 
    end

    if @sql =~/create/i || @sql =~/insert/i  || @sql =~/update/i  || @sql =~/delete/i 
      begin
        @zmienna=TestDataBase.answer_sql(@sql)
      rescue ActiveRecord::StatementInvalid => exception
        @err = exception.message
      end
    elsif
      begin
        @zmienna=TestDataBase.connection.exec_query (@sql)
      rescue ActiveRecord::StatementInvalid => exception
	@err = exception.message
      end
    end
  end


  #Wywołanie funkcji przygotowującej tabele Answers na odpowiedzi oraz przekierowanie do pierwszego pytania
  def new
    Answer.prepare(@get_session, @current_test, current_user)
    redirect_to answer_path(Answer.where(student_id: current_user.id).first.id)
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
