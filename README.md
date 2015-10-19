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
6. Do poprawnego działania aplikacji wymagane jest pakiet ImageMagic, możesz go zainstalować prostym poleceniem:

sudo apt-get install libmagickwand-dev imagemagick




