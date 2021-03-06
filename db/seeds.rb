#Prepare database V 1.1


#####################################################################################################
#SuperAdmin
user = User.new
user.email = 'superadmin@example.com'
user.encrypted_password = 'xxxxxxx'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.current_sign_in_at = '2015-02-27 20:29:27.899831'
user.last_sign_in_at = '2015-02-26 20:29:27.899831'
user.current_sign_in_ip = '192.168.0.0'
user.last_sign_in_ip = '192.168.0.0'
user.created_at = '2015-02-26 20:29:27.899831'
user.updated_at = '2015-02-26 20:29:27.899831'
user.firstname = 'Super'
user.lastname = 'Admin'
user.admin = 'TRUE'
user.super_admin = 'TRUE'
user.save!

#Admin
user = User.new
user.email = 'admin@example.com'
user.encrypted_password = 'xxxxxxx'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.current_sign_in_at = '2015-02-27 20:29:27.899831'
user.last_sign_in_at = '2015-02-26 20:29:27.899831'
user.current_sign_in_ip = '192.168.0.0'
user.last_sign_in_ip = '192.168.0.0'
user.created_at = '2015-02-26 20:29:27.899831'
user.updated_at = '2015-02-26 20:29:27.899831'
user.firstname = 'Tomasz'
user.lastname = 'Tarnawski'
user.admin = 'TRUE'
user.save!

#Student
user = User.new
user.email = 'jolka@example.com'
user.encrypted_password = 'xxxxxx'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.current_sign_in_at = '2015-02-27 20:29:27.899831'
user.last_sign_in_at = '2015-02-26 20:29:27.899831'
user.current_sign_in_ip = '192.168.0.0'
user.last_sign_in_ip = '192.168.0.0'
user.created_at = '2015-02-26 20:29:27.899831'
user.updated_at = '2015-02-26 20:29:27.899831'
user.firstname = 'Jolanta'
user.lastname = 'Nowakowska'
user.admin = 'FALSE'
user.save!



#####################################################################################################

test_list = [
  [ "Kolokwium", true, 1, 2, true, true, 0, 0, 0,1 ],

]

test_list.each do |name, available, user_id, number_of_questions, random, standard_score, bdb, bd, dost, database|
  Test.create( name: name, available: available, user_id: user_id, number_of_questions: number_of_questions, random: random, standard_score: standard_score, bdb: bdb, bd: bd, dost: dost, database: database )
end

######################################################################################################
question_list = [
  [ 1, "Wypisz nazwe oraz adres wszystkich klientów", "select nazwa, adres from klienci"],
  [ 1, "Wypisz liczbe klientów", "select count(*) from klienci"],
  [ 1, "W tabeli ceny zmień cene cennikową na 20.5 dla produktu o id 100871", "update ceny set cena_cennikowa=20.5 where id_produktu=100871"]
]

question_list.each do |test_id, content, query|
  Question.create( test_id: test_id, content: content, query: query )
end

######################################################################################################

database_list = [
  [ "Baza testowa", "Testowa baza danych", "postgresql", "unicode", "localhost", 5, "postgres", "tarnawski", "test" ],

]

database_list.each do |name, comment, adapter, encoding, host, pool,   username, password, database, image_path|
  Database.create( name: name, comment: comment, adapter: adapter, encoding: encoding, host: host, pool: pool, username: username, password: password, database: database)
end
