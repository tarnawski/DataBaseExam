class Question < ActiveRecord::Base
belongs_to :test

validates_presence_of :content
validates_presence_of :query
end

class DataBase < Question

#Funkcja przygotowująca połączenie z odpowiednią bazą danych  
def self.prepare_connection(number)
baza = Database.find(number)

  establish_connection(
  adapter: baza.adapter,
  host: baza.host,
  username: baza.username,
  password: baza.password,
  database: baza.database
)
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

        @result = DataBase.connection.exec_query("select * from #{@table}")

        raise ActiveRecord::Rollback

     end
     return @result
   end

end



