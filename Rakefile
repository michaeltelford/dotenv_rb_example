require 'rake/testtask'
require 'dotenv/tasks'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test.rb']
end

desc "Run tests"
task default: :test

desc "Load .env and print the ENV keys"
task print_env: :dotenv do
    puts ENV.keys # :dotenv loads in .env file values
end

desc "Run main.rb with default RACK_ENV"
task :run do
    system("ruby main.rb")
end

desc "Run main.rb with test RACK_ENV"
task :run_in_test do
    system("RACK_ENV=test ruby main.rb")
end

desc "Run main.rb with development RACK_ENV"
task :run_in_development do
    system("RACK_ENV=development ruby main.rb")
end

desc "Run main.rb with production RACK_ENV"
task :run_in_production do
    system("RACK_ENV=production ruby main.rb")
end
