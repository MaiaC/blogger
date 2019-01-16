class AuthorSessionsController < ApplicationController

  def new
  end

  def create 
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: "Logged in successfully")
    else
      redirect_to(new_author_path, notice: "Login failed. Create new Author")
    end
  end

  def destroy
    logout
    redirect_to(:articles, notice: "Logged out")
  end

end
