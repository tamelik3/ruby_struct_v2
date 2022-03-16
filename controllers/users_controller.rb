require './models/user'
require './controllers/sessions_controller'
require 'json'

class UsersController
    attr_accessor :user

    def initialize
        @user = User.new
        @codeController = CodeController.new
    end

    def register(params)
        # if !user.find_user_by(params[:phone])
            response = @codeController.send_validation_by_sms(params[:phone])
            # return self.add_user(params)
        # end
        # return "This phone is already in use!" # Set Up Error Response
    end

    # Return all users existente on the db
    def get_users_list
        list = user.users_list
        list.all.to_json
    end

    # Return specific user
    def get_user(params)
        user = @user.find_user(params[:id])
        user.to_json
    end

    def connexion(params)
        $resp = user.open_session(params)
        $resp.to_json
    end

    private

    # Create a new user and return only the id
    def add_user(params)
        user = @user.add(
            params[:username], 
            params[:password],
            params[:phone],
            params[:type],
            params[:age],
            params[:biography],
            params[:category],
        )
        user.to_json
    end
end