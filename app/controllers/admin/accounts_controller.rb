class Admin::AccountsController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @address = Address.new(address_params)
    @account.address = @address
      if @account.save
        flash[:notice] = 'Conta criada com sucesso!'
        redirect_to admin_accounts_path
      else
        redirect_to new_admin_account_path
      end
  end

  def update
    @account = Account.find(params[:id])
    @account.update_attributes(account_params)
      if @account.save
        flash[:notice] = 'Conta editada com sucesso!'
        redirect_to admin_accounts_path
      else
        redirect_to edit_admin_account_path(@account)
      end
  end

  def destroy
    @account.destroy
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :cpf, :cnpj, :rg, :email, :phone, :cell, :address )
    end

    def address_params
      params.require(:address).permit(:kind, :street, :number, :complement, :district, :zip_code, :city, :state )
    end
end
