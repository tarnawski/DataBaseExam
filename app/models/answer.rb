class Answer < ActiveRecord::Base
belongs_to :student

  def self.checkAnswer(all_answers)
  points = 0
  all_answers.each do |answer|
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
              points = points+1
            end
          end
        end
    end
    return points
  end

  def self.prepare(get_session, current_test, current_user)
    #Usunięcie z tabeli poprzednich odpowiedzi zalogowanego użytkownika
    @to_destroy= Answer.where(student_id: current_user.id).all
    @to_destroy.each do |to_destroy|
      to_destroy.destroy
    end

    #Przygotowanie tabeli Answers
    get_session.each do |tab|
      answer = Answer.new()
      quest = Question.find(tab)
      answer.question_id = quest.id
      answer.student_id = current_user.id
      answer.answer = ''
      answer.save
    end

    #Wywołanie funkcji odpowiednio przygotowującej połączenie z bazą danych 
    TestDataBase.prepare_connection(current_test.database)
  end


  def self.mark(test_id, points)
    current_test = Test.find(test_id)
    if current_test.standard_score
      max=Question.where(test_id: test_id).count
        if max>current_test.number_of_questions
          max=current_test.number_of_questions 
        end
      proc=(points*100)/max
      if proc>=95
        return 5;
      elsif proc>=85
        return 4.5;
      elsif proc>=75
        return 4;
      elsif proc>=65.5
        return 3.5;
      elsif proc>=50
        return 3;
      elsif proc<50
        return 2;
      end
    else
      if points>=current_test.bdb
        return 5;
      elsif points>=current_test.bd+(current_test.bdb-current_test.bd)
        return 4.5;
      elsif points>=current_test.bd
        return 4;
      elsif points>=current_test.dost+(current_test.current_test.dost)
        return 4.5;
      elsif points>=current_test.dost
        return 3;
      elsif points<current_test.dost
        return 2;
      end
    end
  end

end

class TestDataBase < Answer

  #Funkcja przygotowująca połączenie z odpowiednią bazą danych  
  def self.prepare_connection(number)
  baza = Database.find(number)

    establish_connection(
    adapter: baza.adapter,
    host: baza.host,
    username: baza.username,
    password: baza.password,
    database: baza.database)
  end

  def self.answer_sql(query)
 
    transaction do
      connection.execute query
      connection.schema_cache.clear! 
      reset_column_information
      query_in_tab = query.split(" ")
      if query_in_tab[0] == "insert" 
        @table = query_in_tab[2]
      elsif query_in_tab[0] == "update" 
        @table = query_in_tab[1]
      elsif query_in_tab[0] == "delete" 
        @table = query_in_tab[2]
      elsif query_in_tab[0] == "create" 
        @table = query_in_tab[2]
      end

      @result = TestDataBase.connection.exec_query("select * from #{@table}")
      raise ActiveRecord::Rollback
    end
    return @result
  end

end



