HOST = '127.0.0.1'

DATABASE = 'rubydev100'

USER = 'rubydev'

PASSWORD = 'ahj8ook8Ie8ieVaijah0UThuxi1aixo6ohneeyoh6eeseej5phum5goo3mohsh9p'

ADAPTER = 'mysql2'

Sequel.connect(adapter: ADAPTER,
                    host: HOST,
                    database: DATABASE,
                    user: USER,
                    password: PASSWORD)