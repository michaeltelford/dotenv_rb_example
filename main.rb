require 'dotenv'

# loads in the correct environments .env file e.g. .env.testing etc.
# environment defaults to "development"
# "production" will load .env.production and then .env (the former taking
# precedence for duplicate key/values in both files)
def load_env(environment=nil)
    environment ||= "development"
    load_dot_env ".env.#{environment}"
    load_dot_env ".env" if environment == "production"
end

def load_dot_env(filename)
    Dotenv.load filename if File.exist? filename
end

load_env ENV['RACK_ENV']
puts ENV['USERNAME']
