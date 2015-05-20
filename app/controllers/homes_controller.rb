class HomesController < ApplicationController
  def index
    @recipes = Recipe.all
    @users = User.all
  end
end
