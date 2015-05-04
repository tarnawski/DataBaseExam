class Answer < ActiveRecord::Base
belongs_to :student

connection = ActiveRecord::Base.connection
   
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

        @result = ActiveRecord::Base.connection.exec_query("select * from klienci #{@table}")

        raise ActiveRecord::Rollback

     end
     return @result
   end


    def self.correct_sql(query)

      transaction do
        connection.execute query
        connection.schema_cache.clear! 
        reset_column_information

        @result = ActiveRecord::Base.connection.exec_query("select * from klienci")

        raise ActiveRecord::Rollback

     end
     return @result
   end


    def self.users_sql(query)

      transaction do
        connection.execute query

        connection.schema_cache.clear! 
        reset_column_information

        @result = ActiveRecord::Base.connection.exec_query("select * from klienci")

        raise ActiveRecord::Rollback
      end
      return @result
    end



end

