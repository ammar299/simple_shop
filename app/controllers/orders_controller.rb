class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:customer_name, :shipping_address, :summary)
    end

end
