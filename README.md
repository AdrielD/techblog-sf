Live version at: https://techblog-sf.herokuapp.com

This project uses MYSQL database and Redis, both services must be installed in order to work.
Don't forget to change database.yml according to your MYSQL privileges!

Download:
 
	git clone https://github.com/AdrielD/techblog-sf.git
    
Setup Rail installation:

	cd techblog-sf
	gem install bundler
	bundle install
	rails db:setup

Setup dependencies:

	redis-server
	bundle exec sidekiq

Star server:

	rails s


Project adds a seeded user, for testing purposes:
> User: leonidas@sparta.com
> 
> Pass: ares123
