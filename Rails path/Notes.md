# What is rails

Rails is opinionated software. It makes the assumption that there is a "best" way to do things, and it's designed to encourage that way - and in some cases to discourage alternatives. If you learn "The Rails Way" you'll probably discover a tremendous increase in productivity. If you persist in bringing old habits from other languages to your Rails development, and trying to use patterns you learned elsewhere, you may have a less happy experience.

# Main philosophy
* Don't Repeat Yourself
* Convention Over Configuration

# Starting up the Web Server
```rails server```

# Say "Hello", Rails

To get Rails saying "Hello", you need to create at minimum a route, a controller with an action, and a view.

In terms of implementation: Routes are rules written in a Ruby DSL (Domain-Specific Language). Controllers are Ruby classes, and their public methods are actions. And views are templates, usually written in a mixture of HTML and Ruby.

Let's start by adding a route to our routes file, `config/routes.rb`, at the top of the `Rails.application.routes.`draw block:
```rb
Rails.application.routes.draw do
  get "/articles", to: "articles#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

Now we'll run the **controller generator** (with the --skip-routes option because we already have an appropriate route):
`bin/rails generate controller Articles index --skip-routes`

The most important of these is the controller file, `app/controllers/articles_controller.rb`.

# Autoloading
Rails applications do not use require to load application code.
You only need require calls for two use cases:

* To load files under the lib directory.
* To load gem dependencies that have require: false in the Gemfile.

# Model
A model is a Ruby class that is used to represent data. Additionally, models can interact with the application's database through a feature of Rails called Active Record.

## Generating a model
To define a model, we will use the model generator:

`rails generate model Article title:string body:text`

Two main files are
* the migration file db/migrate/<timestamp>_create_articles.rb
* the model file app/models/article.rb.

## Database Migrations
Migrations are used to alter the structure of an application's database. In Rails applications, migrations are written in Ruby so that they can be database-agnostic.

## Using a Model to Interact with the Database
To play with our model a bit, we're going to use a feature of Rails called the console. The console is an interactive coding environment just like irb, but it also automatically loads Rails and our application code.
