Live version at: https://techblog-sf.herokuapp.com

It's a simple blog: visitors can only see the list of posts or read an specific post, but
the author can also create and edit posts.

* The post editor has some simple helper tools to add markdown to the text.
* Also, there's a scheduling feature. Posts will only appear at the home page list after the chosen time (for testing purposes, there are only short times: 30 seconds, 1 minute and 10 minutes).

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
