Download:
 
		git clone https://github.com/AdrielD/techblog-sf.git
		cd techblog-sf
    
Install gems:

		gem install bundler
		bundle install

Setup database and dependencies:

		rails db:setup
    redis-server &
    bundle exec sidekiq &

Star server:

		rails s
