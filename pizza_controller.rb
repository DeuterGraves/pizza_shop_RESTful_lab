require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order' )
also_reload( './models/*' )

# our model is called pizza_order - so it's good practice to call our path the same - kebab case

# INDEX
get("/pizza-orders") do
  @pizzas = PizzaOrder.all()
  erb(:index)
end

# NEW
get("/pizza-orders/new") do
  erb(:new)
end

# SHOW
# id will take ANYTHING - so this needs to go lower in the priority.
get("/pizza-orders/:id") do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  erb(:show)
end

#CREATE
post("/pizza-orders") do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end

# DELETE
post("/pizza-orders/:id/delete") do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id).delete()
  erb(:destroy)
end
