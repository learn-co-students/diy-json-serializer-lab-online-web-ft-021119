class ProductsController < ApplicationController
   before_action :set_product, only: [:data, :show, :description, :inventory]

   def data
      render json: ProductSerializer.serialize(@product)
   end

  def index
    @products = Product.all
  end

  def show
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    render plain: @product.description
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end

  def set_product
      @product = Product.find_by_id(params[:id])
  end
end
