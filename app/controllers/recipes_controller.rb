class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @cur_recipe = Recipe.find_by(id: params[:id])
  end

  def new
    p "params"
    p params
    if session[:user_id]
      @recipe = Recipe.new
      @recipe_ingredient = @recipe.recipe_ingredients.build
    else
      redirect_to login_path
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = session[:user_id]

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.user_id == session[:user_id]
        @recipe_ingredient = @recipe.recipe_ingredients
        if @recipe.update(recipe_params)
          format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
          format.json { render :show, status: :ok, location: @recipe }
        else
          format.html { render :edit }
          format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to recipes_url, notice: 'That is not your recipe' }
        format.json { render :show, status: :ok, location: @recipe }
      end
    end
  end

  def destroy
    if @recipe.user_id == session[:user_id]
      @recipe.destroy
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'That is not your recipe' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :instruction, recipe_ingredients_attributes: [:ingredient_id, :quantity, :_destroy])
    end
end
