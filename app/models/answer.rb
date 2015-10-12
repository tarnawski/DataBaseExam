class Answer < ActiveRecord::Base
belongs_to :student

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



