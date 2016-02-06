require "experiment"
require "factory_girl"

Dir.glob(File.join(File.dirname(__FILE__), "factories", "*.rb")).each do |factory|
  puts factory
  require factory
end

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

end
