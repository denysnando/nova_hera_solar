class Admin::WelcomesController < Admin::ApplicationController
  before_action :authenticate_user!
  
  def index
  end

end
