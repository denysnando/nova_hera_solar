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
    @budget =  Budget.new(budget_params)

    if @budget.save
      redirect_to admin_budgets_path
    end

  end

  private
    def set_budget
      @budget = Budget.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:account_id, :media_kw, :balance_total, budget_items_attributes: [:product_id, :amount, :sub_total_price])
    end


end
