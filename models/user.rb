class User < Sequel::Model(:gtg_code)
    attr_accessor :conn, :username, :phone, :biography, :category, :age, :type, :status
    attr_writer :password

    def initialize
        @status = 0 # change this to an generic enum
    end

    def users_list
        conn.from(:gtg_users)
    end

    def add(username, password, type, age, phone, biography, category)
        conn[:gtg_users].insert(
                [:username, :password, :phone, :type, :age, :biography, :category, :status], 
                [username, password, type, age, phone, biography, category, status])
    end

    def find_user(id)
        return self.users_list.find { |user| user[:id] == id.to_i }
    end

    def find_user_by(phone)
        if self.users_list.find { |user| user[:phone] == phone }
            return true
        end
        return false
    end

    def open_session(params)
        hash_password(params[:password])
    end

    def hash_password(password)
        BCrypt::Password.create(password).to_s
    end
end