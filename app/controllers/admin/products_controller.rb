module Admin
  class ProductsController < AdminController
    def index

    end

  private

  def product_params
    params.require(:product).permit(:title, :description, :image, :price, :sku, :stock_id, :region_id)
  end

  end
end
