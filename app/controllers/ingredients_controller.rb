class IngredientsController < ApplicationController
  def index
     @ingredient = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = ingredients.new(ingredient_params)
    symptom_list = params[:ingredient][:symptom_ids].split(',')

    if save_ingredient(@ingredient, symptom_list)
      redirect_to ingredient_path(@ingredient), success: 'ポストを作成しました'
    else
      flash.now[:danger] = 'ポストを作成できませんでした'
    render :new
    end
  end
  
  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    symptom_list = params[:ingredient][:symptom_id].split(',')

    if @ingredient.update(ingredient_params)
      @ingredient.save_symptoms(symptom_list)
      redirect_to ingredients_path, success: 'ポストを更新しました'
    else
      flash.now[:danger] = 'ポストを更新できませんでした'
      render :edit
    end
  end

  def destroy
    @ingredient = ingredients.find(params[:id])
    @ingredient.destroy!
    redirect_to ingredients_path, success: 'ポストを削除しました'
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :body)
  end

  def save_ingredient(ingredient, symptom_list)
    if ingredient.save
      ingredient.save_symptoms(symptom_list)
      return true
    end
    false
  end
end
