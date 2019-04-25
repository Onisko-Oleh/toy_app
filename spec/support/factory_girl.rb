#This makes method calls less verbose. For example 
#instead ofFactoryGirl.build you can now use build.
RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
end