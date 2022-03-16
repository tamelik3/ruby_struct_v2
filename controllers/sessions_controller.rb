require './models/session'
require 'json'

class SessionsController
    attr_accessor :session

    def initialize
        @session = Session.new
    end

    def add_session(user_id, token)
        @session.add(user_id, token)
    end

    def get_user(params)
        user = session.get_user_session(params)
        user.to_json
    end

    def connexion(params)
        $resp = user.open_session(params)
        $resp.to_json
    end
end