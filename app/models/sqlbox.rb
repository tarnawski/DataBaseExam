class Sqlbox < ActiveRecord::Base

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

end

