require 'time'

class Session
    attr_accessor :conn, :user_id, :last_access, :token

    def initialize
      dbops = DBops.new
      @conn = dbops.connect
    end

    def add(user_id, token)
      access_date = Time.now
      conn[:gtg_sessions].insert([:user_id, :token, :access_date], [user_id, token, access_date])
    end
  
    def get_user_session(token)
      self.find_session_with_token(token)
    end

    def find_session_with_token(token)
      sessions = conn.from(:gtg_sessions)
      session = sessions.find { |user_session| user_session[:token] == token }
      session ? session[:user_id] : "Essaie encore..."
    end

    def delete_session
      conn.from(:gtg_sessions)
    end

    def insert_session(params)
      conn[:gtg_sessions].all
    end

    def update_session(p)
    end
  
    def close_session(p)
    end
  
    def open_session(params)
      hash_password(params[:password])
    end
  
    def active_session(params)
      hash_password(params[:password])
    end
  
    def hash_password(password)
      BCrypt::Password.create(password).to_s
    end
end