require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

# master controller
run ApplicationController
# mount additional controllers
use ArticlesController
use UsersController
use SessionsController
use RegistrationController
# use Rack::Session::Cookie
