#landing



get '/' do
  erb :landing
end

#index
get '/cars' do 
  @cars = Car.all
  erb :"cars/index"
end

#owners index
get '/owners' do
  @owners = Owner.all
  erb :"owners/index"
end


#new
get '/cars/new' do
  @owner_id = params[:owner_id]
  erb :"cars/new"
end

#create
post '/cars' do
  p car = {
    brand: params[:brand], 
    model: params[:model], 
    img_url: params[:img_url],
    owner_id: params[:owner_id]
  }
  car = Car.new(car)
  if(car.save)
    redirect '/cars'
  else
    @errors = car.errors.full_messages

    erb :"cars/new"
  end
end

#show
get '/cars/:id' do
  @car = Car.find(params[:id])
  erb :"cars/show"
end

#show owners
get '/owners/:id' do
  @owner = Owner.find(params[:id])
  @cars = @owner.car
  erb :"owners/show"
end


#edit
get '/cars/:id/edit' do
  @car = Car.find(params[:id])
  erb :"cars/edit"
end

#update
patch '/cars/:id' do
  @car = Car.find(params[:id])
  updated_car = {    
    brand: params[:brand], 
    model: params[:model], 
    img_url: params[:img_url]
  }
  if(@car.update(updated_car))
    redirect "/cars/#{@car.id}"
  else
    @errors = @car.errors.full_messages
    erb :"cars/edit"
  end
end

#destroy
delete '/cars/:id' do
  car = Car.find(params[:id])
  car.delete
  redirect '/cars'
end








