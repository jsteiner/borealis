require 'borealis'

require 'bourne'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.order = 'random'
  config.mock_with :mocha
end
