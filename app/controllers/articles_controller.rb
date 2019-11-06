class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here

  def edit
    # This instance is being sent to the edit view page's form_for.
    # The form_for will receive this instance knowing it is not a new instance
    # rather that it already exists, because it knows the instance already exists
    # it will send the form info to the update action! Cool right? 
    #form_for knows to go to the update when submitted because it recieved an instance!

    @article = Article.find(params[:id])
  end

  def update
    # Query the database for the Article record that matches the :id passed to the route.
    # Store the query in an instance variable.
    # Update the values passed from the form 
    # Save the changes in the database.
    # Redirect the user to the show page so they can see the updated record.

    # Step 1/2 - Query and save it to an instance varaible

    @article = Article.find(params[:id])

    # Step 3 - Update the values passed from the form by adding params in the update method.

    @article.update(title: params[:article][:title], description: params[:article][:description])

    redirect_to article_path(@article)
  end

  
end
