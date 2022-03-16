require './controllers/users_controller'

get '/users' do
    ctrl = UsersController.new
    ctrl.get_users_list
end

post '/user' do
    ctrl = UsersController.new
    ctrl.register(request)
end

get '/user/:id' do
    ctrl = UsersController.new
    ctrl.get_user(params)
end