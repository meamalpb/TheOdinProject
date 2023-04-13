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

# Scaffold
Scaffold is the easiest way to do generate a simple rest service and it literally takes just 2 commands
Suppose you want to create a simple blog post model with a title and a body. To generate the scaffold for this model, you can use the following command:
```rb
rails generate scaffold Post title:string body:text
rails db:migrate
rails server
```

You can then visit http://localhost:3000/posts in your web browser to see the index page for the Post model. From there, you can create, edit, and delete posts using the generated views.

This command by itself produces a lot of routes , views and controllers

# Routing
when a request enters your application  Rails grabs all the parameters that came with it and makes them available for you in a special hash called params that you can later use in your controller.
for example

routes.rb
```rb
Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"
end
```

articles_controller.rb
```rb
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
```

Usually a full crud application
```rb
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show"
  post "/posts", to: "posts#create"  # usually a submitted form
  get "/posts/:id/edit", to: "posts#edit"
  put "/posts/:id", to: "posts#update" # usually a submitted form
  delete "/posts/:id", to: "posts#destroy"
```

All these routes can be automatically made by adding this on the routes.rb file
`  resources :posts `

The above created routes need controller methods to work and the simplest controller to satisfy above routes are given below
```rb
class PostsController < ApplicationController

    def index
      # very simple code to grab all posts so they can be
      # displayed in the Index view (index.html.erb)
    end

    def show
      # very simple code to grab the proper Post so it can be
      # displayed in the Show view (show.html.erb)
    end

    def new
      # very simple code to create an empty post and send the user
      # to the New view for it (new.html.erb), which will have a
      # form for creating the post
    end

    def create
      # code to create a new post based on the parameters that
      # were submitted with the form (and are now available in the
      # params hash)
    end

    def edit
      # very simple code to find the post we want and send the
      # user to the Edit view for it (edit.html.erb), which has a
      # form for editing the post
    end

    def update
      # code to figure out which post we're trying to update, then
      # actually update the attributes of that post. Once that's
      # done, redirect us to somewhere like the Show page for that
      # post
    end

    def destroy
      # very simple code to find the post we're referring to and
      # destroy it.  Once that's done, redirect us to somewhere fun.
    end
  end
  ```

When we don't want all the routes:
```rb
  resources :posts, only: [:index, :show]
  resources :users, except: [:index]
```

Using scope, we can alter path names generated by resources:
```rb
scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do
  resources :categories, path: 'kategorien'
end
```
```rb
GET	        /kategorien	categories#index	categories_path
GET	        /kategorien/neu	categories#new	new_category_path
POST	      /kategorien	categories#create	categories_path
GET	        /kategorien/:id	categories#show	category_path(:id)
GET	        /kategorien/:id/bearbeiten	categories#edit	edit_category_path(:id)
PATCH/PUT	  /kategorien/:id	categories#update	category_path(:id)
DELETE	    /kategorien/:id	categories#destroy	category_path(:id)
```

```rb
scope 'admin', as: 'admin' do
  resources :photos, :accounts
end

resources :photos, :accounts
```

This will generate routes such as `admin_photos_path` and `admin_accounts_path` which map to `/admin/photos` and `/admin/accounts` respectively.

You can prefix routes with a named parameter also:
```rb
scope ':username' do
  resources :articles
end
```
This will provide you with URLs such as /bob/articles/1 and will allow you to reference the username part of the path as params[:username] in controllers, helpers, and views.

A shortcut you’ll see plenty of times is, instead of writing `redirect_to post_path(@post.id)`, just write `redirect_to @post` because Rails knows people did that so often that they gave you the option of writing it shorthand.


# Problem with link_to
`link_to` is a method used instead of a tag in rails. This allows to add path not as prefix_path kind of way.
You can also add methods with `link_to` in the following way:
`<%= link_to 'Destroy', post, :method => :delete, :onclick => "return confirm('Are you sure you want to delete this post?')" %>`

Unfortunately this does not work. Delete method for some reason doesnt work. There is a solution to do it in previous rails version but I havent found similar article for the new version yet.
Anyway the easy thing to do is to just replace `link_to` by `button_to`.

