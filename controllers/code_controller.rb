
class CodeController
    Code.plugin :json_serializer
    attr_accessor :code

    def initialize
        @code = Code.new
    end

    # Responsable to send the code validation by sms.
    def send_validation_by_sms(phone)
        code_value = get_validation_code(phone)
        # CALL TWILIO API
        return code_value
    end

    # Responsable to send the code validation by email.
    # It's necessary to get the phone number because it's a unique key
    # in case of the user doesn't have a userId yet.
    def send_validation_mail(phone, email)
        code_value = get_validation_code(phone)
        # CALL E-MAIL API
        return @code.status
    end

    # Responsable to validate code
    def validate_code(params)
        result = code.find_code(params[:phone])
        if result != null
            case result.status
            when 0 #'sent'
                result.status = 1
                @code.update_code(result)
                return 'verified' # code 3
            when 1 #'obsolete'
                'Error: Invalid Code' # Code is invalid: out of timestamp
            else
                'Error: Invalid Code' # Code is invalid: already used 
            end
        end
        return 'Error: Invalid Code' # Code is invalid: not exist
    end

    private
    # Generate a random code number with 4 digits.
    # In case of the generated number has less than
    # 4 digits the space is replaced by 0
    def generate_random_code
        return rand(10000).to_s.rjust(4,'0')
    end

    def get_validation_code(phone)
        code_value = generate_random_code

        puts Code.all.to_json
        # result = code.find_code(phone)
        # if result == nil
        #     @code.add(code_value, phone)
        # else
        #     @code.update_code(result, code_value)
        # end
        # return code_value
    end
end