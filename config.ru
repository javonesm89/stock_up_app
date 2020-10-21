require_relative './config/environment'


use Rack::MethodOverride
use OrderController
use StockController
use SessionController
use InvestorController
use LearnController
run AppController