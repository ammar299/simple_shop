module Admin
  class ProductsController < AdminController
    before_action :set_product, only: %i[edit update destroy]

    def index
      @products = Product.all
      render json: @products
    end

    def create
      @product = product.new product_params

      if @product.save
        render json: @product

      else
        render json: @product.errors.full_messages.join("\n")
      end
    end

    def update
      if @product.update product_params
        render json: @product

      else
        render json: @product.errors.full_messages.join("\n")
      end
    end

    def destroy
      byebug
      if @product.destroy
        render json: 'product destroy successfully!'

      else
        render json: 'Unable to delete product!'
      end
    end

  private

    def set_product
      @product = Product.find params[:id]
    end

  def product_params
    params.require(:product).permit(:title, :description, :image, :price, :sku, :stock_id, :region_id)
  end

  end
end
