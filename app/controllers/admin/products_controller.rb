class Admin::ProductsController < Admin::ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show

  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = 'Produdo criado com sucesso!'
        redirect_to admin_products_path
      else
        redirect_to new_admin_product_path
      end
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
      if @product.save
        flash[:notice] = 'Produto editado com sucesso!'
        redirect_to admin_products_path
      else
        redirect_to edit_admin_product_path(@product)
      end
  end

  def destroy
    @product.destroy
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :number_references, :category_id, :balance)
    end
end
