DBExam - Aplikacja do przeprowadzania kolokwiów z przedmiotu bazy danych
Autor: Tomasz Tarnawski
E-mail: tarnawski27@gmail.com

##############################################################################################

Instalacja aplikacji DBExam

##############################################################################################

1. Jeśli nie masz kopii aplikacji, a posiadasz uprawnienia do repzytorium sklonuj ją prostym poleceniem:

	git clone https://tarnawski@bitbucket.org/tarnawski/databaseexam.git

2. Przejdź do katalogu projektu 'cd databaseexam'
3. Pobierz wymagane pakiety poleceniem 'bundle install'
4. Konfiguracja bazy danych znajduje się w pliku 'config/database.yml' jeśli jest to konieczne edytuj ją.
5. Utwórz bazę danych poleceniem 'rake db:setup' oraz przygotuj bazę testową 'rake db:test:prepare'
6. Do poprawnego działania aplikacji wymagany jest pakiet ImageMagic, możesz go zainstalować poleceniem:

	sudo apt-get install libmagickwand-dev imagemagick

7. W Celu przetestowania działania aplikacji w katalogu głównym znajduje się skrypt przykładowej bazy danych 'baza_testowa.sql' nadającej się do przeprowadzania testów, należy utworzyć nową baze a następnie uruchomić skrypt tworzący schemat.
8. Uruchom serwer rails poleceniem 'rails s'
9. Otwórz swój localhost wpisując w przeglądarce w pole adresu: 'localhost:3000'
10. Gotowe! Teraz możesz zalogować się na konto administratora:
	Login: superadmin@exampl.com
	Hasło: valid_password
11. W menu wybierz opcję Dazy Danych->Dodaj połączenie i wypełnij informacje o bazie stworzonej w punkcie 7
12. Do uruchomienia testów wykorzystaj komendę 'rspec spec' 


