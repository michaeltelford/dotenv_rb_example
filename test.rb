require 'minitest/autorun'
require_relative './main'

class TestLoadEnvironment < Minitest::Test
    def setup
        ENV['USERNAME'] = nil
        ENV['PASSWORD'] = nil
    end

    def test_testing
        load_env "test"
        assert_equal "test_user", ENV['USERNAME']
    end

    def test_development
        load_env "development"
        assert_equal "development_user", ENV['USERNAME']
    end

    def test_unset_env
        load_env
        assert_equal "development_user", ENV['USERNAME']
    end

    def test_production
        load_env "production"
        assert_equal "production_user", ENV['USERNAME']
    end

    def test_production_file_precedence
        load_env "production"
        assert_equal "prod_pword", ENV['PASSWORD']
    end
end
