
# https://gist.github.com/futuresocks/c71ded69a669b0780fe5d16dcb95c85c

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')


# # Get
# index and Show
#
# Post
# new and create

# READ - step 1 index
# index routes all the piazza's
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  # brings back an array of pizza orders
  erb(:index)
end

# step3 getting the hash for the form from the model
# Creat a pizaa and create a form at new erb
get '/pizza-orders/new' do

erb(:new)
end

# Read .step2 -show existing pizza we find by id
# Show -show one pizza
# if accessing find(params[:id] ...it's a hash
get '/pizza-orders/:id' do
@order = PizzaOrder.find(params[:id])
erb(:show)
end
# create step4
# create new routee- make a pizza_order

post '/pizza-orders' do
  # a hash of new orders . hash on pizza_order initializ. giving the whole thing of hash rather than picking one thing at a time.
  @order = PizzaOrder.new(params)
  # order exists in database
  @order.save()

  erb(:create)

end

# Edit
 get "/pizza-orders/:id/edit" do
   @order = PizzaOrder.find(params[:id])
     erb(:edit)
 end

 # post '/pizza-orders/:id/submit' do
 #    @order = PizzaOrder.find(params[:id])
 #    @order.update()
 #    redirect to "/pizza-orders"
 # end
# update
post "/pizza-orders/:id" do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect to "/pizza-orders/:id"
end

# destroy or delete
post '/pizza-orders/:id/delete' do
    @order = PizzaOrder.find(params[:id])
    @order.delete()
redirect to "/pizza-orders"
end

# Submit
