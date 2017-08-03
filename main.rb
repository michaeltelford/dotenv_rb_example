require 'dotenv'

# Loads in the correct environments .env file e.g. .env.testing etc.
# Environment defaults to "production".
# "production" will load .env and then .env.production (the latter taking
# precedence for duplicate key/values in both files).
# This approach conforms to the https://12factor.net princliples if no
# environment value is provided to load_dot_env(env=nil).
def load_env(environment=nil)
    environment ||= "production"
    load_dot_env ".env" if environment == "production"
    load_dot_env ".env.#{environment}"
end

def load_dot_env(filename)
    Dotenv.load filename if File.exist? filename
end

load_env ENV['RACK_ENV']
puts ENV['USERNAME']
