# TinyUrl

## Running

### Using Docker

This project has docker and docker-compose files and can be run using its commands. i.e

* Setting up the database:
`docker-compose run web bundle exec rake db:drop db:create db:migrate db:seed`

* Running the project:
`docker-compose up`

### Without Docker

This project was written with these dependencies installed:

* ruby 3.0.2
* rails 6.1.4.1
* Postgres server 13.4
* Bundler 2.2.22
* Yarn 1.22.5
* Node 12.19.0

Tests are written using rspec so any rspec command can be used to run the suits. i.e. bundle exec rspec all

## Improvements

1. Increase algorithm performance for `short_url` generation. It currently uses basic SecureRandom generator by loading a simple alphanumeric of 6 letters size
2. Add background tasks/processes to generate unique keys to be used as `short_url` and push those into a queue to be pulled by Rails web. This would remove web responsibility for re-generating keys when they are duplicated and also removes this task from request cycle
3. Add caching policies, specially on redirect request cycle. Consider applying browser-side as well with e-tags
4. [Redesign] Add database replication mechanism to explicitly separate read/write operation so that `short_url` visitors would have access to redirection cycle faster than `short_url` creators
5. [Redesign] Rethink application structure to consider moving creating short url to an standalone server and move visiting short url request cycle to another server. This would easy the process for horizontal scalability
6. [Redesign] Remove backend/frontend coupling by the creation of api (Rails) and consumer projects (React ?)
