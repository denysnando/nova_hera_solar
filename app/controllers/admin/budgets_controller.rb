class Admin::BudgetsController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @address = Address.new(address_params)
    @account.address = @address
    if @account.save
      flash[:notice] = 'Conta criada com sucesso!'
      redirect_to admin_accounts_path
    else
     redirect_to new_admin_account_path
    end
  end

  private
    def set_budget
      @budget = Budget.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:user_id, :media_kw, :balance_total)
    end
end
