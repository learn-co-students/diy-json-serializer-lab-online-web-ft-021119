class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def show
    @product = Product.find(params[:id])
  end

  # def data
  #   product = Product.find(params[:id])
  #   render plain: product.data
  # end

  def data
    product = Product.find_by_id(params[:id])
    render json: ProductSerializer.serialize(product)
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
end
