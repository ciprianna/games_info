# README
This is a simple catalog of games. Games can be played on a console. The home page of the application has links to the lists for all games and consoles.

## Dependencies and Configuration
The Ruby version used for this project is `2.6.5`. This started from the base Rails setup and added the following Gems:
* annotate
* pry-rails
* rspec-rails
* active-model-serializers
* haml-rails
* rubocop, require: false (copied over base rules from `flywheel-app`)
* factory_bot_rails
* simplecov

The front-end of the application was built in Vue and uses single-page routing. When setting up the Rails application, webpacker was set to use the vue option: `webpacker=vue`.

The following npm packages were added to the project:
* vue-router
* vue-turbolinks

## Running Locally

### Setup
To get started, set up the package managers and databases. Run the following in the root of the project folder.
Step 1: Install the Gems
```
bundle install
```
Step 2: Install the yarn packages
```
yarn
```
Step 3: Setup and seed the database. There are existing games and consoles seeded.
```
rails db:setup
```

### Running
To run this, you will need two terminal sessions. In one, run

```
rails s
```

In the other, run

```
yarn start
```

These commands will start the rails server for the back-end of the application and start the front-end of the application with hot-reloading.

## Tests
`SimpleCov` was added to determine test coverage. All models and controller files are tested. To run tests, in the console run:
```
bin/rspec
```



💻🎮🕹 HAVE FUN 🕹🎮💻