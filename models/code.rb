class Code < Sequel::Model(:gtg_code)
    Sequel::Model.plugin :json_serializer

    attr_accessor :conn, :value, :phone, :status, :sent_date

    # enum state: { sent: 0, updated: 1, validated: 2, obsolete: 3 } # this could be on another class generic

    def initialize
        @status = 0
    end

    # Add new item on db
    def add(value, phone)
        self.create(value: value , phone: phone, status: status)
    end

    # List all the items on db
    def list_code
        puts self
        self.all
        # conn.from(:gtg_code)
    end

    # Find a contact using the code
    def find_code(phone)
        return self.list_code.find { |code| code[:phone] == phone }
        # return self.select([:id, :phone, :value, :status]).where(:phone => phone)
    end

    # Update a contact info on db
    def update_code(object, code_value)
        self.where(:id => object[:id]).update(:status => 1, :value => code_value)
    end
end