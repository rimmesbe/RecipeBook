class RecipeIngredientsController < ApplicationController

  def new
    if session[:user_id]
      @recipe = Recipe.new
    else
      redirect_to login_path
    end
  end

  def create
    @recipe_ingredient = Recipe_Ingredient.new(recipe_ingredient_params)

    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to @recipe_ingredient, notice: 'Recipe_Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_ingredient }
      else
        format.html { render :new }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


end
