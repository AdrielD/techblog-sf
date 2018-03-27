web: bundle exec puma -p $PORT -e $RAILS_ENV -C config/puma.rb
worker: bundle exec sidekiq -e production -C config/sidekiq.yml