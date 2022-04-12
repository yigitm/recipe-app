module ShoppingHelper
  def total_price(recipes)
    total_price = 0
    recipes.each do |recipe|
      total_price += recipe.total_price
    end
    total_price
  end

  def food_list(user)
    list = {}
    names = []
    user.recipes.each do |recipe|
      recipe.ingridients.each do |ingridient|
        if names.include?(ingridient.food.name)
          look = ingridient.food.name
          list[look][:quantity] += ingridient.quantity
        else
          names.push(ingridient.food.name)
          list[ingridient.food.name] = { quantity: ingridient.quantity, price: ingridient.food.price }
        end
      end
    end
    list
  end
end
