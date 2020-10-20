require_relative './config/environment'

# use Rack::MethodOverride
use SessionController
use InvestorController
use LearnController
run AppController