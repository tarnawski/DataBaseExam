class Task < ActiveRecord::Base


connection = ActiveRecord::Base.connection
   

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

