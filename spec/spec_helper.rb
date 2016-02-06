require "experiment"
require "factory_girl"
require "rspec/collection_matchers"

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  config.before(:each) do
    Individual.reset_all
  end

end
