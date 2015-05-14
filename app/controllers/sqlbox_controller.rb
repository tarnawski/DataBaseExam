class SqlboxController < ApplicationController
  def index



  @button = params[:button]
  if params[:sql]
  @sql = params[:sql]
  @database = params[:database]
  


  Sqlbox.prepare_connection(@database)

  begin
    @zmienna2=Sqlbox.connection.exec_query (@sql)
  rescue 
    @err = "In Your's query is something wrong, so can't execute"
  end



end

  end
end
